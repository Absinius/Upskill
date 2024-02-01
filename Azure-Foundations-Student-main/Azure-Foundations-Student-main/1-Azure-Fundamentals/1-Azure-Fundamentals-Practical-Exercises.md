# Azure Fundamentals Practical Exercises
_The exercises in this section should primarily be performed logged in to the [Azure Portal](https://portal.azure.com), or using tools such as **Powershell** or **Azure CLI**_.<br>
_The exercises are based on each student having a subscription available and `Owner` access permissions to that subscription._<br>

---
## Table of contents for exercises
1. [Exercise - Evaluate user permissions on your subscription](#exercise---evaluate-user-permissions-on-your-subscription)
2. [Group Exercise - Assign RBAC (Role based access control) permissions to your subscription](#group-exercise---assign-rbac-role-based-access-control-permissions-to-your-subscription)
3. [Exercise - Evaluate the Management group hierarchy](#exercise---evaluate-the-management-group-hierarchy)
4. [Exercise - Evaluate Azure policies applied to your subscription](#exercise---evaluate-azure-policies-applied-to-your-subscription)
5. [Exercise - Evaluate the Cost Management configuration of your subscription](#exercise---evaluate-the-cost-management-configuration-of-your-subscription)
6. [Exercise - Configure a resource lock on your resource group](#exercise---configure-a-resource-lock-on-your-resource-group)

---
## Exercise - Evaluate user permissions on your subscription
1. In the portal, go to `Subscriptions` -> `<Name-of-your-own-subscription>`.
2. _Evaluate your own user's access to your subscription._
    * In the left side menu press `Access Control (IAM)` -> `View my access`.
3. _Evaluate another user's access to your subscription._
    * In the left side menu press `Access Control (IAM)` -> `Check access`.
4. _Evaluate all role assignments on your subscription currently._
    * In the left side menu press `Access Control (IAM)` -> `Role assignments`.

---
## Group Exercise - Assign RBAC (Role based access control) permissions to your subscription
_This exercise should be performed as a group exercise, where the users should compare the results between eachother._
_The goal of this exercise is to compare how different role assignments (permissions) affects what individual users are able to see and perform towards different subscription scopes._

#### Assign Reader permission for other students to your subscription
1. In the portal, go to `Subscriptions`, and notice what subscriptions you can currently see in this section.
2. Press `<Name-of-your-own-subscription>`.
3. In the left side menu press `Access Control (IAM)` -> `Add` -> `Add role assignment`.
4. Under the `Role` tab select the `Reader` role and press _Next_. 
5. Under the `Members` tab select the users you would like to give the access to and press _Next_.<br>
    * Optionally, use the security-group `All-Students` which should contain all students in the course.
6. Press the `Review + assign` button in the bottom left corner, to create the role assignment.
7. Once the role assignment has been created, head back to `Subscriptions` and check what you can see now as compared to before (per student).

#### Test out the Reader permission
1. In the portal, under `Subscriptions`, go into any `<Name-of-subscription>` that is **not** your subscription.
2. In the left side menu, go to `Resource groups`.
3. Try to create a resource-group from here and see the results.

#### Assign Contributor permission for other students to your subscription
1. Use the same approach as in [Assign Reader permission for other students to your subscription](#assign-reader-permission-for-other-students-to-your-subscription), but this time choose the role `Contributor`

#### Test out the Contributor permission
1. Have another student, use the same approach as in [Test out the Reader permission](#test-out-the-reader-permission) towards your subscription.
2. Have the other student try to create a resource-group from your subscription and see the results.

#### Cleanup permissions
1. In the portal, go to `Subscriptions` -> `<Name-of-your-own-subscription>`.
2. In the left side menu press `Access Control (IAM)` -> `Role assignments`.
3. In the `Role assignments` list find the `Contributor` assignments you created for the other students, mark this one, and press `Remove`.<br>
    * Optionally, you can remove the `Reader` role assignment you created for other students as well (if you like your own privacy :grimacing:)

---
## Exercise - Evaluate the Management group hierarchy
1. In the portal, go to `Management groups`.
2. In the `Overview`, evaluate where your subscription is in the hierarchy.

---
## Exercise - Evaluate Azure policies applied to your subscription
1. In the portal, go to `Subscriptions` -> `<Name-of-your-own-subscription>`.
2. In the left side menu, go to `Policy`.
3. In the new left side menu, go to `Assignments` and note what policies are currently assigned to your subscription or management-group containing your subscription.
4. For each policy that is **not** the `ASC Default` policy:
    * Press the policy
        * Evaluate how the currently assigned policy affects the way you can work with your subscription.
        * What are the impacts of the applied policy?

---
## Exercise - Evaluate the Cost Management configuration of your subscription
1. In the portal, go to `Subscriptions`.
2. Go into your subscription -> `<Name-of-your-own-subscription>` -> See the `Cost Management` section in the left side menu
    * Are there any Cost alerts associated to your subscription?
      * If any alert found, what are the alert conditions and what will happend if the alert are triggered?

    * Are there any Budgets alerts associated to your subscription?
      * If any alert found, what are the alert conditions and what will happend if the alert are triggered?

---
## Exercise - Configure a resource lock on your resource group
1. Firstly, if you do not have any resource-group, create one.
2. Go to `Resource groups` -> `<Name-of-your-resource-group>`.
3. In the left side menu, press `Locks` -> `Add`.
4. Choose a `name` for your lock, pick `Delete` as the `Lock type`, and then press `OK`.
5. Now test to **delete** your resource-group.
    * What happened ?
6. Delete the lock and the resource-group.
