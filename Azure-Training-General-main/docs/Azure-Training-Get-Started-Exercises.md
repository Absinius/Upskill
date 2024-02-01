# Azure Training - Get Started Exercises
_These exercises are simply focused on getting started to working with Azure._<br>
_The main focus of these exercises is simply onboarding the user to Azure, and test out different Azure related tools._<br>
_Most of these exercises will have open end objectives, and not a step-by-step approach, the idea is for the users having to start exploring Azure for themselves._<br>

---
## Exercise - Explore the Azure Portal
**NOTE:** _GUID = Globally Unique Identifier_
* Firstly, ensure your user is logged into the [Azure Portal](https://portal.azure.com)

* Find the `Azure tenant GUID`
* Find out the assigned `roles` for your user
* Find out if your user has any `licenses` assigned
* Find the `object ID` of your user
* Find out what `subscriptions` you have access too

---
## Exercise - Test the Azure Cloud Shell
**NOTE:** _The first time the Azure Cloud Shell is started from your user, it will be a bash-prompt._
* Firstly, ensure your user is logged into the [Azure Portal](https://portal.azure.com)
  * Start the Azure Cloud Shell from your user
* Find out what user context you currently have using Azure CLI command
* Switch your Azure Cloud shell to use Powershell
* Find out what user context you currently have using Powershell command

#### Collect some example data taken from your Azure Cloud Shell session and download the data
* First, change directory to the folder called **clouddrive** using `cd clouddrive`
  * Find out the `history` of the commands you've ran so far in Powershell
    * Once found, take the outputs of the `history` and create a file which contains the history data
      * Download this created file to your local workstation

---
## Exercise - Test Azure CLI
**NOTE:** _This exercise should be performed from your local workstation using Azure CLI._<br>
_Some useful Azure CLI commands can be found [here](Azure-Training-AzureCLI-Useful-Commands.md)._<br>
* Check what `az` version you currently have installed
* Log in to the Azure Tenant
* Find out what user context you currently have
* Create a resource group
* List all resources your user can see
  * After that, now list all resources you can see but only `query` for the `name` of the resources
    * Re-run the same command, but now ensure the `output` is in tab-separated-values (tsv)
* Delete the resource group

---
## Exercise - Test Azure Powershell
**NOTE:** _This exercise should be performed from your local workstation using Powershell Core (pwsh)._<br>
_Some useful Powershell commands can be found [here](Azure-Training-Powershell-Useful-Commands.md)._<br>
* Check what `pwsh` version you currently have installed
* Check what _Azure Powershell Modules_ you currently have installed
* Log in to the Azure Tenant
* Find out what user context you currently have
* Create a resource group
* List all resources your user can see
  * After that, now list all resources you can see but get only the `name` of the resources
* Delete the resource group
