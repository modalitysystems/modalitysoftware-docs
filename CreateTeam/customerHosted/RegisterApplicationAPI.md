## Registering Create Team as an Azure Application (API)
This document describes the process of registering Create Team as an Azure Application as the first step to deployment. As part of the registration you will gather the following information for use further along the deployment process.
   * Application ID
   * Application Secret
   * Tenant ID

Create Team requires two Azure Applications to be configured, one for the API and one for the Client. Here we will be looking at the API

### Register Create Team with Azure Active Directory
1. Sign in to the [Azure Portal](https://portal.azure.com)
1. Select the **Azure Active Directory** service from the navigation menu on the top
1. Select **App Registrations** from navigation pane on the left and then click **+ New Registration** (Take care not to select **App Registrations (Legacy)** as these instructions do not apply to them)
1. Enter the following application registration details
   * **Name** - Recommend setting this to **Create Team API**
   * **Supported Account Types** - This needs to be set to **Accounts in any Organizational Directory**

   ![RegisterApplication01](../images/customerHosted/registerapplication01.png)

1. Click **Register** and Azure AD will create an Application ID and present the Overview page

   ![RegisterApplication02](../images/customerHosted/registerapplication02.png)

   * From this screen use the "Copy to Clipboard" button next to the Application ID, then open Windows Notepad and paste the value with appropriate title. Repeat these steps for Directory ID.

1. Under Manage on the left hand side, click Certificates & Secrets then New Client secret

   ![RegisterApplication03](../images/customerHosted/registerapplication03.png)

   * Select an appropriate expiry for the secret from 1 year to Never and click Add

1. The next screen will be the only time that the secret will be show so use the "Copy to Clipboard" button and paste into the Windows Notepad window that should still be open with appropriate title.

   ![RegisterApplication04](../images/customerHosted/registerapplication04.png)

1. Under Manage on the left hand side, click API permissions then click the 3 dots next to the User.Read permission and click Remove permission

   ![RegisterApplication05](../images/customerHosted/registerapplication05.png)

1. The click + Add a permission, then Mircosoft Graph and select Application permissions

   ![RegisterApplication06](../images/customerHosted/registerapplication06.png)

   * Search for and Add Directory.ReadWrite.all and Group.ReadWrite.All permissions

1. Once the permissions have been Added, they will need to be granted Admin Consent by a Global Admin

   ![RegisterApplication07](../images/customerHosted/registerapplication07.png)

   * Click the Grant Admin Consent button 

   ![RegisterApplication08](../images/customerHosted/registerapplication08.png)

1. Under Manage on the left hand side, click Expose an API and the click Set next to Application ID URI and then Save

   ![RegisterApplication09](../images/customerHosted/registerapplication09.png)

1. Then Click + Add a scope and enter the following and then Add scope

   ![RegisterApplication10](../images/customerHosted/registerapplication10.png)

   * Which should then look like this

   ![RegisterApplication11](../images/customerHosted/registerapplication11.png)

1. Under Manage on the left hand side, click Manifest and replace the line "appRoles" with the following

   [appRoles](https://docs.modalitysoftware.com/CreateTeam/images/customerHosted/appRoles.json)

   * Which should end up looking like this

   ![RegisterApplication12](../images/customerHosted/registerapplication12.png)

   * Click Save and continue on to [RegisterApplicationClient](RegisterApplicationClient.md)