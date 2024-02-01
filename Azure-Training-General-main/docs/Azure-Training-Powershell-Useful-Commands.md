# Azure Training - Powershell Useful Commands
_This document will contain Powershell commands that are frequently used when working with Azure._<br>
_Microsoft documentation for Azure Powershell can be found [here](https://learn.microsoft.com/en-us/powershell/azure/?view=azps-10.4.1)._<br>

---
## General commands
* `Install-PackageProvider -Name NuGet`
  * _Installs the package provider NuGet_
    <details>
      <summary>Additional information</summary>
      
      _With NuGet PowerShell, developers can quickly find and install packages from a central repository, manage dependencies, and update packages to their latest versions using PowerShell commands._

      [What is NuGet?](https://learn.microsoft.com/en-us/nuget/what-is-nuget)
    </details>

* `$PSVersionTable`
  * _Built-in variable that outputs such as the current Powershell version and edition._

* `Get-Module Az.* -ListAvailable`
  * _Gets all installed Azure Powershell modules._

* `Get-Command -Module Az.Accounts`
  * _Gets all available commands for a specific installed Azure Powershell Module._ 

---
## Azure Powershell specific commands

* [Connect-AzAccount](https://learn.microsoft.com/en-us/powershell/module/az.accounts/connect-azaccount?view=azps-10.4.1)
  * _Connects the specified user to the specified Azure tenant / subscription._

* [Get-AzContext](https://learn.microsoft.com/en-us/powershell/module/az.accounts/get-azcontext?view=azps-10.4.1)
  * _Shows the current context of the connected user (if any)._

* [Set-AzContext](https://learn.microsoft.com/en-us/powershell/module/az.accounts/set-azcontext?view=azps-10.4.1)
  * _Changes the current-context into the specified-context, used for suchs as switching the subscription context._

* [Get-AzTenant](https://learn.microsoft.com/en-us/powershell/module/az.accounts/get-aztenant?view=azps-10.4.1)
  * _Gets information about the currently connected Azure Tenant._

* [Get-AzAccessToken](https://learn.microsoft.com/en-us/powershell/module/az.accounts/get-azaccesstoken?view=azps-10.4.1)
  * _Gets an access token for the current user-context that can be used for utilities to access Azure._

* [New-AzResourceGroup](https://learn.microsoft.com/en-us/powershell/module/az.resources/new-azresourcegroup?view=azps-10.4.1)
  * _Creates an Azure resource group._