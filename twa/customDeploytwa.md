# How to deploy Teamwork Analytics using our PowerShell Script

Teamwork Analytics can be installed to an existing environment using our PowerShell Script, available on request.

> Note: You must have [registered an application](registerapplication.md) beforehand.

> Note: For an introduction to Azure Resource Manager see [docs.microsoft.com](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-overview).

## Installation

1. Run the provided powershell.

2. Carefully fill in the fields. The powershell should provide descriptions for each field it requests.
    - **Sql Server Credentials** - your username and password that an administrator can use to sign in to the SQL database hosting Teamwork Analytics data. 
    - **Sql Server Details** - your server name and database name that the Teamwork Analytics service will use to store data. 
    - **Azure Application details** - Use the Id, secret and redirect URI you generated when [registering an application](registerapplication.md).
    - **Azure Tenant ID** - A globally unique identifier (GUID) that identifies the organization for which Teamwork Analytics will gather Teams usage data.
    - **Include Notification Service** - Yes / No field. The Notification Service is an additional feature required to send pro-active messages to users via Bot/Email to improve adoption. Set to Yes if you plan to use the Teamwork Analytics bot. 
      > Note: For more information about the Teamwork Analytics bot, see [How to deploy the Teamwork Analytics Bot App into Teams](deployteamsapp.md).
3. Once the deployment is complete, if you have opted to include the Notification Service, you will need to provide the Bot Preshared Key to Modality to allow us to authenticate with your deployment. The powershell will output the generated Guid once complete, otherwise you can find it in the appsettings.json file located in the install directory.
    >C:\Program Files\Modality\NotificationService\TeamworkAnalytics.NotificationService.ConsoleApp