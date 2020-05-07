# Installing CreateTeam in your own tenant

Installing CreateTeam in your own tenant involves 4 separate processes: configuring two Azure AD applications, configure SendGrid Email Delivery Service, deploying the ARM template to add resources to your Azure tenant to run CreateTeam, and then installing a manifest into your Microsoft Teams enviroment that joins the two together.

### AAD App 1 (for the API) : Application Permisions

#### Microsoft Graph Permissions

**Directory.ReadWrite.All** Read and write directory data - Allows the app to read and write data in your organization's directory, such as users, and groups, without a signed-in user. Does not allow user or group deletion.

**Groups.ReadWrite.All** Read and write all groups - Allows the app to create groups, read all group properties and memberships, update group properties and memberships, and delete groups. Also allows the app to read and write group calendar and conversations. All of these operations can be performed by the app without a signed-in user.

**Sites.Read.All** Read items in all site collections - Allows the app to read information related to sites within SharePoint in your organization.

#### SharePoint Permissions

**Sites.FullControl.All** Have full control of site collections - Allows the app to have full control over all of the within SharePoint in your organization.

### AAD App 2 (for the client) : Delegated Permisions

**openid** Sign in and read user profile - Allows users to sign-in to the app, and allows the app to read the profile of signed-in users. It also allows the app to read basic company information of signed-in users.

# Steps to install

>[Configure SendGrid Email Delivery Service](sendGrid.md)

>[Automated Script Deployment of CreateTeam](armDeployScripts.md)

>or

>[Manual Deployment of CreateTeam](RegisterApplicationAPI.md)

>[Configure CreateTeam - Azure Table Storage](TableStorageConfiguration.md)

---

## Deployment complete

Provided that all steps above have been followed, the CreateTeam deployment should now be complete and ready to use.