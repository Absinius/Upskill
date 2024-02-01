# Azure DevOps training - Practical Exercises
_The exercises in this section should primarily be performed logged in to the [Azure Portal](https://portal.azure.com), the [Azure DevOps](https://dev.azure.com) organization or using tools such as **Powershell** or **Azure CLI**_.<br>

##### Legend for exercises
:exclamation: - _Step or instruction is highly likely to run into problem/error that your goal is to solve._<br>
:link: - _Step or instruction assumes a prior step or exercise has been performed.
If instructions are in code, it is assumed the same workspace or process is used as from prior steps._<br>

---
## Table of contents for exercises
1. [Bicep exercises](#bicep-exercises)
2. [Azure DevOps exercises](#azure-devops-exercises)

---
# Bicep exercises
_For some of the exercises we will be using exercises from Microsoft Learn as it fits the intended scenario(s)._<br>

:warning: Some of these exercises says it requires a Sandbox environment to complete, but we would prefer to use our designated lab tenant in this scenario, so do ***not*** use the Sandbox environment, but adjust the commands so they are used towards the designated lab tenant.

### Exercise - Define resources in a Bicep template (Microsoft Learn)

1. Follow the steps in the exercise found here - [Exercise - Define resources in a Bicep template](https://learn.microsoft.com/en-us/training/modules/build-first-bicep-template/4-exercise-define-resources-bicep-template?pivots=powershell)

### Exercise - Add parameters and variables to your Bicep template (Microsoft Learn)

1. :link: Follow the steps in the exercise found here - [Exercise - Add parameters and variables to your Bicep template](https://learn.microsoft.com/en-us/training/modules/build-first-bicep-template/6-exercise-add-parameters-variables-bicep-template?pivots=powershell)

### Exercise - Refactor your template to use modules (Microsoft Learn)

1. :link: Follow the steps in the exercise found here - [Exercise - Refactor your template to use modules](https://learn.microsoft.com/en-us/training/modules/build-first-bicep-template/8-exercise-refactor-template-modules?pivots=powershell)

### Exercise - Define child resources (Microsoft Learn)

1. Follow the steps in the exercise found here - [Exercise - Define child resources](https://learn.microsoft.com/en-us/training/modules/child-extension-bicep-templates/4-exercise-define-child-resources?ns-enrollment-type=learningpath&ns-enrollment-id=learn.bicep-collaborate&pivots=powershell)

### Exercise - Deploy extension resources and use existing resources (Microsoft Learn)

1. :link: Follow the steps in the exercise found here - [Exercise - Deploy extension resources and use existing resources](https://learn.microsoft.com/en-us/training/modules/child-extension-bicep-templates/7-exercise-deploy-extension-existing-resources?ns-enrollment-type=learningpath&ns-enrollment-id=learn.bicep-collaborate&pivots=powershell)

---
# Azure DevOps exercises
_These exercises will mainly be performed in the prepared Azure DevOps organization for the training._<br>

### Exercise - Create a service connection for Azure Resource Manager (ARM)

#### Register an Application in Azure (Service Principal)
_First we will be registering an Application in Azure (Service Principal) which we will use to create the service connection between Azure DevOps and Azure in the upcoming steps._

1. In the portal, go to `App registrations`.
2. Press `+ New registration`.
3. On the `Register an application` page, use the following details:
  * `Name` - _Use the following name format `<your-name>-DevOps-<name-of-your-subscription>`._
  * `Who can use this application or access this API?` - _Accounts in this organizational directory only (OBS Training only - Single tenant)._
4. Press `Register` in the bottom left corner.

#### Create a secret for your application (service principal)
:information_source: _The secret is only shown after initial creation and is thereafter hidden, so if you lose it you might need to repeat these steps._

1. :link: In the Azure portal, go to `App registrations` and press `<Name-of-your-registered-application>`.
2. In the left side menu, go to `Certificates & secrets`.
3. Press `+ New client secret`, then in `Description` enter a descriptive name for your secret, such as `AzureDevOpsSecret`.
4. Press `Add`.
5. **Save down the value in the `Value` field** 

#### Get the values that we will be using for our service connection
1. :link: In the Azure portal, go to `App registrations` and press `<Name-of-your-registered-application>`.
2. In the left side menu, under `Overview`, save down the values for `Application (client) ID` and `Directory (tenant) ID`.
3. Now, in the portal, go to `Subscriptions`, and save down the _GUID_ of your subscription.

#### Add permissions on your subscription for the application (service principal)
1. :link: In the Azure portal, go to `Subscriptions`, and press `<Name-of-your-subscription>`.
2. In the left side menu, go to `Access control (IAM)`, press `+ Add` and then `Add role assignment`.
3. Choose the role `Owner` and press `Next`.
4. On the `Members` tab, press `+ Select members` and search for the name of your application, press it, press `Select`, and then `Next`.
5. On the `Conditions` tab, press `Not constrained` and then `Next`.
6. Finally, press `Review + assign`.

#### Create the service connection in Azure DevOps
1. :link: Log in to the Azure DevOps organization using `<AZURE-DEVOPS-URL>`.
2. Go into the project `<AZURE-DEVOPS-PROJECT-NAME>`.
3. In the bottom left corner, press `Project settings`.
4. Under the `Pipelines` section, press `Service connections`.
5. In the upper right corner, press `New service connection`.
6. Choose `Azure Resource Manager` as connection type and press `Next`.
7. For `Authentication method` choose `Service principal (manual)`.
8. On the `New Azure service connection` page, enter the following details:
  * `Environment` - _Should be `Azure Cloud`._
  * `Scope Level` - _For this exercise we will be using the `Subscription` scope._
  * `Subscription Id` - _Enter the subscription GUID that you saved down from earlier for your subscription._
  * `Subscription Name` - _Enter the name of your subscription._
  * `Service Principal Id` - _Enter the Application ID that you saved down from earlier for your application._
  * `Credential` - _We will use `Service Principal key` here._
  * `Service principal key` - _Enter the value saved down for the application secret you created earlier._
  * `Tenant ID` - _Enter the tenant GUID that you saved down from earlier._
9. Press the `Verify` button, if everything alright, we should get `:white_check_mark: Verification Succeeded`, then you can proceed.
10. For `Service connection name` - _Use the following name formatting `sub-<your-name>-<subscription-name>`._
11. For `Security` - _Leave `Grant access permission to all pipelines` **unchecked**._
12. Press `Verify and save`.

---
### Exercise - Setup your own Azure DevOps Repos repository

#### Create the repository
1. Log in to the Azure DevOps organization using `<AZURE-DEVOPS-URL>`.
2. Go into the project `<AZURE-DEVOPS-PROJECT-NAME>`.
3. In the left side menu, press `Repos` and then `Files`.
4. In the navigation panel at the top, use the dropdown button and press `+ New repository`.
5. On the right side of the screen in `Create a repository`. 
  * `Repository type` - _Use `Git` here._
  * `Repository name` - _Use the following name formatting `repo-<your-name>`._
  * `Add a README` - _Leave this checked in._
6. Press `Create`.

#### Clone your repository to your workstation
1. :link: In the left side menu, press `Repos` and then `Files`.
2. In the navigation panel at the top, ensure your own repository is the currently selected one.
3. Press the `Clone` button, and then press `Clone in VS Code`.<br> 
   _If prompted by a popup asking to open Visual Studio Code, allow it._
4. Select the local path on your workstation where you want your repository.<br>
   _If prompted to login, use your Microsoft Entra credentials._
5. If no errors, you should now see the repository in your VS Code.
  
    :information_source: _The equivalent command for the cloning of the repository can be done using `git` command line utility and the following example:_
    ``` Powershell
    git clone <URL-to-repo>
    ```

---
### Exercise - Commit code to your own repository
_The current directory in your terminal should be the repository root-folder for the below steps._<br>
_In this exercise we are committing directly to the default branch called `main`._<br>

#### Set repository-specific username and email configuration
1. :link: Set the default username and email for your repository by running the below commands:
    ``` Powershell
    # Set your default username for this repository
    git config user.name "<FIRST_NAME> <LAST_NAME>"
    
    # Use your Microsoft Entra email-address here
    git config user.email "<MY_NAME>@example.com"
    ```

#### Commit to your repository
1. :link: Once the repository is successfully cloned into your Visual Studio Code, in your terminal, change directory to the repository root-folder.
2. Find and open the `README.md` document that should be there from previous steps.<br>
   _If the file is not there, you can just create a file in the repository root-folder called `README.md` and proceed._
3. In `README.md`, add any text that you want or use the below sample, and ensure to save it afterwards (Ctrl + S).<br><br>
    _Sample text snippet in [Markdown](https://www.markdownguide.org/basic-syntax/) format._
    ``` Markdown
    #### Markdown heading level 4
    **This is bold!**
    _This is italic!_

    ##### Markdown heading level 5
    **Hello!**
    ```
4. In the left side menu of Visual Studio Code, go to `Source Control`. You should now see the file you edited, and a box where you can fill in your _commit message_. Write a message in the box and press the `Commit` button. Then press again on the `Sync Changes` button that will push the changes into your Azure DevOps repository.
5. If no errors, you have now successfully pushed your first commit into your repository.
6. Browse to the `README.md` of your repository in Azure DevOps to see the results!<br>
    
    :information_source: _The equivalent commands for the exercise can be done using `git` command line utility and the following example:_
    ``` Powershell
    # The current directory should be the root-folder of the repository before running these commands

    # Adds / stages all of the files in the current repository directory
    git add .

    # Commits your latest changes and adds a commit message
    git commit -m "My commit message here"

    # Pushes the changes to your remote repository
    git push
    ```