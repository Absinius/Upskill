using namespace System.Net

# Input bindings are passed in via param block.
param ($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Check for correct REST Method first
if ($Request.Method -ne "GET") {

  # Return a warning to standard output
  $Body = "Wrong REST Method used, this function only supports GET, used Method were $($Request.Method)"
  Write-Warning $Body

  # Create the hashtable that will be used in the HTTP response
  $ResponseHashtable = @{

    StatusCode = [HttpStatusCode]::MethodNotAllowed
    Body = $Body
  }
}

# If correct Method were used, return response and StatusCode OK
else {

  # Return a message to standard output
  $ReturnMessage = "Successful request from IP $(($Request.Headers."x-forwarded-for").Split(":")[0])"
  Write-Host $ReturnMessage

  # Create the hashtable that will be used in the HTTP response
  $ResponseHashtable = @{
        
    StatusCode = [HttpStatusCode]::OK
    Body = @{
      ReturnMessage   = $ReturnMessage
      FunctionName    = $TriggerMetadata.FunctionName
      InvocationId    = $TriggerMetadata.InvocationId
    }
  }

  if ($Request.Body) {

    $ResponseHashtable.Body.Add("RequestBody", $Request.Body)
  }
}

# Return the response
Push-OutputBinding -Name Response -Value ([HttpResponseContext]$ResponseHashtable)