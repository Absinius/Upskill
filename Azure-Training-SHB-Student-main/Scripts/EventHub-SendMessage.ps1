<#
  .SYNOPSIS
  Small script to send messages to an Azure Event Hub based on a connection-string.

  .NOTES
  Author: Fredrik Eliasson - 2023-11-03
#>

#Requires -PSEdition Core

[CmdletBinding()]

param (

  [Parameter(Mandatory)][string]$ConnectionString,
  [Parameter()][ValidateRange(1,50)][int]$DummyMessagesTotal = 5,
  [Parameter()][ValidateRange(1000,20000)][int]$DummyMessagesWaitMilliseconds = 1000,
  [Parameter()][hashtable]$DummyMessage,
  [Parameter()][string]$JsonFileMessage,
  [Parameter()][string]$JsonMessage
)

function New-DummyMessage {

  [CmdletBinding()]

  param (
    [Parameter()][hashtable]$DummyMessage = @{
      MessageGuid       = $(New-Guid).Guid
      MessageDate       = $(Get-Date -Format "yyyyMMdd-HH:mm:ss")
      RandomValue       = $(Get-Random -Maximum 10000)
    }
  )

  return $DummyMessage
}

# Set variables based on Connection-String
$EventHubsNamespace = $ConnectionString.Split("/")[2].Split(".")[0]
$EventHubsName = $ConnectionString.Split("EntityPath=")[1]
$SharedAccessPolicyPrimaryKey = $ConnectionString.Split(";")[2].Split("SharedAccessKey=")[1]
$SharedAccessPolicyName = $ConnectionString.Split(";")[1].Split("SharedAccessKeyName=")[1]

# Create SAS Token
[Reflection.Assembly]::LoadWithPartialName("System.Web")| Out-Null
$URI = "$($EventHubsNamespace).servicebus.windows.net/$($EventHubsName)"
$Expires = ([DateTimeOffset]::Now.ToUnixTimeSeconds())+3600
$SignatureString = [System.Web.HttpUtility]::UrlEncode($URI)+ "`n" + [string]$Expires
$HMACSHA256 = New-Object System.Security.Cryptography.HMACSHA256
$HMACSHA256.key = [Text.Encoding]::ASCII.GetBytes($SharedAccessPolicyPrimaryKey)
$SignatureBytes = $HMACSHA256.ComputeHash([Text.Encoding]::ASCII.GetBytes($SignatureString))
$SignatureBase64 = [Convert]::ToBase64String($SignatureBytes)
$SASToken = "SharedAccessSignature sr=" + [System.Web.HttpUtility]::UrlEncode($URI) + "&sig=" + [System.Web.HttpUtility]::UrlEncode($SignatureBase64) + "&se=" + $Expires + "&skn=" + $SharedAccessPolicyName

# URI for the Event Hub
$EventHubUri = "https://$($EventHubsNamespace).servicebus.windows.net/$($EventHubsName)/messages"

# API headers
$Headers = @{
  "Authorization" = $SASToken
  "Content-Type"  = "application/json;type=entry;charset=utf-8"
}

try {

  if ($JsonFileMessage -or $JsonMessage) {

    ####################################################################
    # SEND JSON FILE AS MESSAGE
    ####################################################################

    if ($JsonFileMessage) { $JsonBody = Get-Content $JsonFileMessage -ErrorAction Stop }

    ####################################################################
    # SEND JSON STRING AS MESSAGE
    ####################################################################

    else { $JsonBody = $JsonMessage }

    # Fix the Body in compressed JSON
    $Body = $JsonBody | ConvertFrom-Json -Depth 25 | ConvertTo-Json -Depth 25 -Compress -ErrorAction Stop
    Write-Verbose $Body

    # Send message
    Invoke-WebRequest -Uri $EventHubUri -Method POST -Headers $Headers -Body $Body | Format-Table StatusCode, StatusDescription
  }

  else {

    ####################################################################
    # SEND DUMMY MESSAGES
    ####################################################################
    
    # Output
    Write-Host "Sending $($DummyMessagesTotal) messages to event hub [$($EventHubsName)] within [$($EventHubsNamespace)]"
    
    # Loop to create X number of dummy messages
    for ($i = 1; $i -le $DummyMessagesTotal; $i++) {

      # Set custom Dummy Message if any parameter input
      if ($DummyMessage) { $Message = $DummyMessage }
      # Else, we create the Dummy Message
      else { $Message = New-DummyMessage @NewDummyMessageParameters }
      
      # Output
      Write-Host "Sending message number $($i)" -ForegroundColor Cyan
      $Message | Format-Table -HideTableHeaders

      # Convert the Dummy Message to JSON
      $Body = $Message | ConvertTo-Json -Depth 25 -Compress -ErrorAction Stop
      Write-Verbose $Body

      # Send the message
      Invoke-WebRequest -Uri $EventHubUri -Method POST -Headers $Headers -Body $Body -ErrorAction Stop | Format-Table StatusCode, StatusDescription
    }
  }
}
catch {

  Throw "$($_.Exception.Message)"
}