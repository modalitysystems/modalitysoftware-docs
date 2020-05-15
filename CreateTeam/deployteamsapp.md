# How to deploy CreateTeam App into Teams

Create Team is provided as an Microsoft Teams App which needs to be uploaded to your organisation's Apps section within Microsoft Teams.

> NOTE: Some of the steps below require making changes to your Microsoft Online Tenant which can sometimes take a few hours to take effect

## Admin Consent for CreateTeam App API

For the App to be able to create teams in the target Teams Tenant, it is a requirement that a Office 365 Global Admin of that tenant grants admin consent. 

1. This is achieved by clicking on the following link and logging in with a Global Administrator account, this will consent to the AAD APP 1 permisions below (for the API). Note AAD App 2 below (for the client) does not require admin consent.

   [Provide Admin Consent](https://login.microsoftonline.com/common/adminconsent?client_id=d992e819-1a67-4840-89d3-1cee8cd4e735&redirect_uri=https://tgmodprod.azureedge.net/AdminConsent)

2. These are the permissions that will be required

   ### AAD App 1 (for the API)
     
      #### Microsoft Graph Permissions (Delegated - no consent required)
      **openid** Sign in and read user profile - Allows users to sign-in to the app, and allows the app to read the profile of signed-in      users. It also allows the app to read basic company information of signed-in users. (required for multi-step approval feature, when approving/declining team creation requests)
     
      #### Microsoft Graph Permissions (Application)
      **Directory.ReadWrite.All** Read and write directory data - Allows the app to read and write data in your organization's directory,      such as users, and groups, without a signed-in user. Does not allow user or group deletion.

      **Groups.ReadWrite.All** Read and write all groups - Allows the app to create groups, read all group properties and memberships,        update group properties and memberships, and delete groups. Also allows the app to read and write group calendar and conversations.      All of these operations can be performed by the app without a signed-in user.

      **Sites.Read.All** Read items in all site collections - Allows the app to read information related to sites within SharePoint in your organization.

      #### SharePoint Permissions (Application)

      **Sites.FullControl.All** Have full control of site collections - Allows the app to have full control over all of the within SharePoint in your organization.
      
      ### AAD App 2 (for the client) : Delegated Permisions (no consent required)
      **openid** Sign in and read user profile - Allows users to sign-in to the app, and allows the app to read the profile of signed-in      users. It also allows the app to read basic company information of signed-in users.

3. The Admin Consent for AAD App 1 (for the API) that you just consented to, will be visible within the Enterprise Applications section of Azure AD

   ![Screenshot](images/enterprise-applications.png)

## Installation

**[Click here to download the CreateTeam manifest file](https://github.com/modalitysystems/CreateTeamGABuilds/releases/latest)**

1. 1.	From Microsoft Teams go to the Apps section
   
   ![Screenshot](images/teams-apps.png)
   
2. Then select Upload for [YOUR ORGANISATION NAME]
   
   ![Screenshot](images/apps-upload.png)
   
3. Then select the App package provided by Modality Systems as a zip file
   
   ![Screenshot](images/upload-open.png)

4. The App should then appear within your companies Apps section
   
   ![Screenshot](images/app-deployed.png)
   
> NOTE: To update an App that has already been installed, navigate to the App within your companies Apps section then hover your mouse pointer over the app, click on the ... in the top right corner and click Update
   
   ![Screenshot](images/app-update.png)
   
## Allow App to be installed within Microsoft Teams

Now that the App has been added to your Microsoft Teams Tenant, your Global policy may need to be adjusted to allow it to be installed by users.

1. From the Microsoft Teams Admin Center, under *Teams apps* click *Permission policies*

   ![Screenshot](images/admin-perm-pols.png)
    
2. Click on *Global (Org-wide default)* (or whatever policy is applied to your organisation)

   ![Screenshot](images/app-perm-pols.png)

3. Make sure the *Tenant apps* policy is set to Allow all apps

   ![Screenshot](images/tenant-apps.png)

> NOTE: You could also specify a list of allowed apps here 

## Pin App within Microsoft Teams

To improve the end user experience it is recommended to pin the App to the main Microsoft Teams list of Apps

1. From the Microsoft Teams Admin Center, under *Teams apps* click *Setup policies*

   ![Screenshot](images/admin-setup-pols.png)
    
1. Either edit *Global (Org-wide default)* or create a new policy and give it a name

   ![Screenshot](images/pinned-apps-notg.png)

1. Click *Add apps*, select *Permissions policy* from previous step, search for TG and click Add

   ![Screenshot](images/add-pinned-apps.png)

1. Click Save

   ![Screenshot](images/pinned-apps-complete.png)

If you created a new Setup policy in step 2 then you will need to assign users to the policy

1. From the Microsoft Teams Admin Center, under *Teams apps* click *Setup policies*, click on the tick next to the required policy name

   ![Screenshot](images/admin-setup-pols-users.png)

1. Click *Manage users* and add the required users
    
   ![Screenshot](images/manage-users.png)
   
Further information about managing app setup policies in Microsoft Teams is available: 

   [Manage app setup policies in Microsoft Teams](https://docs.microsoft.com/en-us/microsoftteams/teams-app-setup-policies)

> NOTE A user can only be assigned to 1 app settings policy so this will remove them from the policy that they are currenlty assigned too

## User Consent for CreateTeam App Client

When a user first launches the App from within Microsoft Team, they are required to provide consent for their details to be accessed by the App

   ![Screenshot](images/teams-consent.png)
  

## Changing default settings

This application looks at your default tenant settings to determine the default value of certain fields.
To change your default tenant settings read the following [guide](https://docs.microsoft.com/en-us/graph/api/resources/groupsetting?view=graph-rest-1.0).

The following fields look at tenant default values
1. External Checkbox looks at AllowToAddGuests value
