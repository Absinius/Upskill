[CmdletBinding()]

param (

  [Parameter(Mandatory)][string]$FunctionUri,
  [Parameter(Mandatory)][string]$FunctionKey,
  [Parameter()][ValidateSet("GET","POST","PUT","DELETE")][string]$Method = "GET",
  [Parameter()][ValidateSet("WebRequest","RestMethod")]$PowershellCommand = "WebRequest",
  [Parameter()]$Body
)

# Build HeadersObject
$Headers = @{
  "Content-Type"    = "application/json"
  "x-functions-key" = $FunctionKey
}

# Splatting for the parameters
$Parameters = @{

  Uri     = $FunctionUri
  Headers = $Headers
  Method  = $Method
}
if ($Body) { $Parameters.Add("Body", $Body) }

# Use Invoke-RestMethod
if ($PowershellCommand -eq "RestMethod") { 
  Invoke-RestMethod @Parameters
}

# Use Invoke-WebRequest
else {

  Invoke-WebRequest @Parameters
}