## Register Azure Application

1. Sign in to the [Azure Portal](https://azure.portal.com).
1. Select the **Azure Active Directory** service from the navigation pane on the left 
1. Select **Application Registrations** and click **New Registration**
1. Enter the follow application registration details
   *   **Application Name** - A meaningfull user-facing name for the application such as **Modality Teamwork Analytics**
   * **Supported Account Types** - Recommend setting this to **Accounts in this Organisational Directory Only**
   * **Redirect URI** - Recommend setting this to **https://login.live.com/oauth20_desktop.srf**
1. Click **Register** and Azure AD will create an Application ID and present the Overview page.
![application registration](images/applicationRegistration.png)
1. Take note of the **ApplicationID** as this will be required futher in the deployment process
![overview of application](images/applicationOverview.png)

