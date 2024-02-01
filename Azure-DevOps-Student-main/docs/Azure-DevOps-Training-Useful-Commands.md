# Azure DevOps Training - Useful Commands
_This document will contain commands from different tools that are frequently used when working with Azure DevOps and Infrastructure as Code (IaC)._<br>

---
## Table of contents for exercises
1. [Azure Powershell specific commands](#azure-powershell-specific-commands)
2. [Azure CLI commands](#azure-cli-commands)
3. [Bicep commands](#bicep-commands)
4. [Git commands](#git-commands)

---
## Azure Powershell specific commands
_Microsoft documentation for Azure Powershell can be found [here](https://learn.microsoft.com/en-us/powershell/azure/?view=azps-10.4.1)._<br>

* [New-AzManagementGroupDeployment](https://learn.microsoft.com/en-us/powershell/module/az.resources/new-azmanagementgroupdeployment?view=azps-11.0.0)
  * _Starts a deployment from the management group level._

* [New-AzDeployment](https://learn.microsoft.com/en-us/powershell/module/az.resources/new-azdeployment?view=azps-11.0.0)
  * _Starts a deployment from the subscription level._

* [New-AzResourceGroupDeployment](https://learn.microsoft.com/en-us/powershell/module/az.resources/new-azresourcegroupdeployment?view=azps-11.0.0)
  * _Starts a deployment from the resource-group level._

---
## Azure CLI commands
_Microsoft documentation for Azure CLI commands can be found [here](https://learn.microsoft.com/en-us/cli/azure/reference-index?view=azure-cli-latest)._<br>

* [az deployment mg create](https://learn.microsoft.com/en-us/cli/azure/deployment/mg?view=azure-cli-latest#az-deployment-mg-create)
  * _Starts a deployment from the management group level._

* [az deployment sub create](https://learn.microsoft.com/en-us/cli/azure/deployment/sub?view=azure-cli-latest#az-deployment-sub-create)
  * _Starts a deployment from the subscription level._

* [az deployment group create](https://learn.microsoft.com/en-us/cli/azure/deployment/group?view=azure-cli-latest#az-deployment-group-create)
  * _Starts a deployment from the resource-group level._

* [az bicep decompile --file <ARM-template.json>](https://learn.microsoft.com/sv-se/cli/azure/bicep?view=azure-cli-latest#az-bicep-decompile)
  * _Decompiles an ARM-template JSON into a Bicep-template._

* [az bicep build --file <Bicep-template.bicep>](https://learn.microsoft.com/en-us/cli/azure/bicep?view=azure-cli-latest#az-bicep-build)
  * _Builds an ARM-template from your Bicep-template._

---
## Bicep commands
_Microsoft documentation for Bicep can be found [here](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)._<br>
_Bicep best practices can be found [here](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/best-practices)._<br>

* `bicep -h`
  * _Shows the help section for the Bicep binary._

* `bicep -v`
  * _Shows the version of the Bicep binary._

* `bicep decompile <ARM-template.json>`
  * _Decompiles an ARM-template JSON into a Bicep-template._

* `bicep build <Bicep-template.bicep>`
  * _Builds an ARM-template from your Bicep-template._

---
## Git commands
_Documentation about Git commands can be found [here](https://git-scm.com/docs)._<br>

* `git clone <URL>` - _More information [here](https://git-scm.com/docs/git-clone)._
  * _Clones a remote repository to your local workstation._

* `git checkout <branch-name>` - _More information [here](https://git-scm.com/docs/git-checkout)._
  * _Switch branches or restore working tree files._

* `git push` - _More information [here](https://git-scm.com/docs/git-push)._
  * _Pushes your local changes into the remote repository branch._

* `git pull` - _More information [here](https://git-scm.com/docs/git-pull)._
  * _Fetch from and integrate with another repository or a local branch._

* `git config user.name "<FIRST_NAME> <LAST_NAME>"` - _More information [here](https://git-scm.com/docs/git-config)._
  * _Sets the default user name to be used for the targeted repository._

* `git config user.email "<MY_NAME>@example.com"` - _More information [here](https://git-scm.com/docs/git-config)._
  * _Sets the default email address to be used for the targeted repository._