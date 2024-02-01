<#
  .SYNOPSIS
  A simple port scanning script.

  .EXAMPLE
  .\PortScanExample.ps1 -IPAddress google.com -PortRangeStart 443 -PortRangeEnd 500

  .NOTES
  Author: Fredrik Eliasson - 2023-10-27
#>

[CmdletBinding()]

param (

  [Parameter(Mandatory)][string]$IPAddress,
  [Parameter(Mandatory)][string]$PortRangeStart,
  [Parameter(Mandatory)][string]$PortRangeEnd
)

if ($PortRangeStart -and $PortRangeEnd) {

  $PortRangeStart..$PortRangeEnd | ForEach-Object {
    Write-Host "Testing host $($IPAddress) TCP port $($_): " -ForegroundColor Cyan -NoNewline
    Test-Connection -TargetName $IPAddress -TcpPort $_ -TimeoutSeconds 1
  }
}