using namespace System.Net

# Input bindings are passed in via param block.
param ($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Check for correct REST Method first
if ($Request.Method -ne "POST") {

  # Return a warning to standard output
  $Message = "Wrong REST Method used, this function only supports POST, used Method were $($Request.Method)"
  Write-Warning $Message

  # Create the hashtable that will be used in the HTTP response
  $ResponseHashtable = @{

    StatusCode = [HttpStatusCode]::MethodNotAllowed
    Body = $Message
  }
}

# Check that our HTTP request has Body
elseif (-not $Request.Body) {

  # Return a warning to standard output
  $Message = "HTTP Request is missing Body"
  Write-Warning $Message

  # Create the hashtable that will be used in the HTTP response
  $ResponseHashtable = @{

    StatusCode = [HttpStatusCode]::BadRequest
    Body = $Message
  }
}

else {

  # If the body does not contain a text property which is required for Slack, then help out by adding it
  if (-not $Request.Body.Text) { $Body = @{ text = $Request.Body } | ConvertTo-Json -Compress } # Convert to JSON-string which is required for Slack messages
  else { $Body = $Request.Body | ConvertTo-Json -Compress } # Convert to JSON-string which is required for Slack messages

  # Send our request Body as a message to our Slack Webhook
  Invoke-WebRequest -Uri $env:SlackWebhookUri -Method Post -Body $Body -ErrorAction Stop

  # Return a message to standard output
  $ReturnMessage = "Successful request from IP $(($Request.Headers."x-forwarded-for").Split(":")[0])"
  Write-Host $ReturnMessage

  # Create the hashtable that will be used in the HTTP response
  $ResponseHashtable = @{
        
    StatusCode = [HttpStatusCode]::OK
    Body = @{
      ReturnMessage   = $ReturnMessage
      SlackMessage    = $Body
      FunctionName    = $TriggerMetadata.FunctionName
      InvocationId    = $TriggerMetadata.InvocationId
    }
  }
}

# Return the response
Push-OutputBinding -Name Response -Value ([HttpResponseContext]$ResponseHashtable)