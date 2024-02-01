# Azure Training - Tools
_Tools required for working with Azure in a programmatic way_

---
## Windows Terminal
_Windows Terminal only works for Windows._
* [Windows Terminal](https://apps.microsoft.com/detail/windows-terminal/9N0DX20HK701?hl=en-US&gl=US)

---
## Git
* [Git for Windows](https://git-scm.com/download/win)
* [Git for Linux](https://git-scm.com/download/linux)
* [Git for MacOS](https://git-scm.com/download/mac)

---
## Visual Studio Code 
* [Visual Studio Code (IDE)](https://code.visualstudio.com/)
  * Visual Studio Code Extensions
    * [Powershell](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell)
    * [Azure CLI Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azurecli)
    * [Azure Resource Manager (ARM) Tools](https://marketplace.visualstudio.com/items?itemName=msazurermtools.azurerm-vscode-tools)
    * [Azure Resource Manager Snippets](https://marketplace.visualstudio.com/items?itemName=samcogan.arm-snippets)
    * [Bicep](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-bicep)
    * [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)
    * [Live Share Extension Pack](https://marketplace.visualstudio.com/itemdetails?itemName=MS-vsliveshare.vsliveshare-pack)

---
## Azure CLI
* [Azure CLI on Windows](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli)
* [Azure CLI on Linux](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt)
* [Azure CLI on MacOS](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-macos)

---
## Powershell
* [Powershell on Windows](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3#installing-the-msi-package)
* [Powershell on Linux](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-linux?view=powershell-7.3)
* [Powershell on MacOS](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-macos?view=powershell-7.3)

---
## Powershell Azure Modules
* [How to install Azure Powershell](https://learn.microsoft.com/en-us/powershell/azure/install-azure-powershell?view=azps-10.4.1)
``` Powershell
# Installation commands in Powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Register-PSRepository -Default -InstallationPolicy Trusted
Install-Module -Name Az -Repository PSGallery -Force
```

---
## Bicep
* [Bicep on Windows](https://github.com/Azure/bicep/releases/latest/download/bicep-setup-win-x64.exe)
* [Bicep on Linux](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/install#linux)
* [Bicep on MacOS](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/install#macos)

---
## AzCopy
_AzCopy is a command-line utility that you can use to copy blobs or files to or from a storage account._
* [AzCopy on Windows](https://aka.ms/downloadazcopy-v10-windows)
* [AzCopy on Linux](https://aka.ms/downloadazcopy-v10-linux)
* [AzCopy on MacOS](https://aka.ms/downloadazcopy-v10-mac)

1. Download the .zip file
2. Unzip the `azcopy` file from the .zip file
3. Place `azcopy` in a folder that exists in the environment variable PATH

``` Powershell
# We can see what is in the environment variable PATH by using Powershell
$env:PATH

# Easier output example
$env:PATH -split ";"
```

_Example `azcopy` commands_
``` Powershell
# See the available commands and options for azcopy
azcopy -h

# See the installed azcopy version
azcopy -v
```