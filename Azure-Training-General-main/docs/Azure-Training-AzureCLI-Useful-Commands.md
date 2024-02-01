# Azure Training - Azure CLI Useful Commands
_This document will contain Azure CLI commands that are frequently used when working with Azure._<br>
_Microsoft documentation for Azure CLI can be found [here](https://learn.microsoft.com/en-us/cli/azure/)._<br>

---
* `az -h`
  * _Shows the help section for Azure CLI commands._

* `az --version`
  * _Shows the current version of Azure CLI installed_

* `az login --tenant <Tenant-GUID>`
  * _Connects the specified user to the specified Azure tenant._

* `az ad signed-in-user show`
  * _Shows information about the currently signed in user._

* `az account show`
  * _Shows the current context of the connected user (if any)._

* `az account set --subscription <Subscription-GUID>`
  * _Changes the current-context into the specified-context, used for suchs as switching the subscription context._

* `az account get-access-token`
  * _Gets an access token for the current user-context that can be used for utilities to access Azure._

* `az group create --name <Name> --location <Region>`
  * Creates an Azure resource group.
