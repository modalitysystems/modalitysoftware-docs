# Hosting TWA Automation in Customer Azure Tenant (CAT) Configuration

This page describes the architecture required for hosting TWA Automation in CAT Configuration. In this configuration, the Modality-managed cloud solution that brokers and delivers messages to users is replicated within a customer's own Azure tenant.

> **Important**: because this configuration results in all parts of the TWA Automation service being hosted within a customer's Azure tenant, the customer assumes responsibility for monitoring of the service and raising any issues with Modality for investigation. It may be necessary to export log files or temporarily provide access to installed components for troubleshooting.

## Required Components

The following Azure resources are required to install TWA Automation:

- 1 x Bot Registration S1 Standard
- 1 x App Service Plan S1
- 1 x App Service
- 1 x Application Insights
- 1 x Storage Account General Purpose v2 Hot
- 1 x Service Bus Queue

## Required Configuration Settings

As part of the setup process, the following configurations will be applied. These are required for the TWA Automation service to operate. The ARM Template deployment will configure these settings automatically; this list is provided for reference:

- The App Service should be publicly accessible via HTTPS 443, and also reachable by the TWA Bot Notification Service (usually installed alongside the Teamwork Analytics Windows Service on the same Virtual Machine). This is to ensure it is accessible to the Microsoft Bot Framework service, which is used to deliver both email and Microsoft Teams messages.

- The Application Registration created as part of the Bot Registration process should be set to Multi Tenant. Single Tenant registration will not work correctly for Bot Registrations.

- A service account will be needed in order to send emails from the Bot Registration service. This account should be enabled for sending emails, and should not be enabled for multi-factor authentication to enable the Bot Registration service to authenticate and send email.
  
  > NOTE: You can chose to not include the Email Channel when deploying Teamwork Automation but this would require **EnableProActiveBot** to be set to **tue** and the **TeamsAppInstallation.ReadWriteSelfForUser.All** application permission to be consented against your tenant.

![TWA Automation CAT Architecture](https://raw.githubusercontent.com/modalitysystems/modalitysoftware-docs/master/twa/images/TWA-Automation-CAT-Architecture-1.png)

| | Service Description |
|-|-|
| 1 | The Bot Notification service is an additional component that gets installed on an existing TWA deployment.  It runs as scheduled tasks that looks at the TWA Database for defined scenarios to pass to the TWA Automation service. |
| 2 | Jobs are placed on the ServiceBus Queue by the Bot Notification Service. These jobs are then retrieved by the Automation Service. This process adds a layer of resilience to the TWA Automation Service. | 
| 3 | A storage account is used for holding configuration values which are consumed by the TWA Automation Service. |
| 4 | Connection Strings and Secrets that are used by the solution are stored here. Through the use of Azure Managed Identity, only code running on the App Service have access and only when required. |
| 5 | An App Service is essentially an IIS Web Server but presented as a PaaS solution. This is used to run Modality's TWA Automation Service |
| 6 | Application Insights is where the App Service stores logs and metrics for the health of the solution. To assist with Modality's ability to resolve faults, it is recommended the leave the default option **Logs to Modality** to **Yes** which will mean that this component won't get deployed |
| 7 | The App Service Plan defines the capabilities and cost of the App Service and can be scaled up or down as required. |
| 8 | A Bot Registration contains the configuration necessary for the TWA Automation Service to be able to send messages through Microsoft Bot Framework Service |
| 9 | Microsoft host a central Bot Framework Service that allows Modality's TWA Automation Service to function |

# Installation Instructions

[Azure ARM Template](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/overview) is our preferred installation and configuration method. The instructions below are for an ARM Template deployment.

## Step 1 - Create Azure AD Application

TWA Automation requires a new Azure AD Application registration. Once created, you will provide the App ID and Secret to the ARM Template, which will perform the remainder of the configuration.

### Register Teamwork Analytics with Azure Active Directory
1. Sign in to the [Azure Portal](https://azure.microsoft.com/en-gb/features/azure-portal/)
1. Select the **Azure Active Directory** service from the navigation pane on the left 
1. Select **App Registrations** and click **New Registration** (Take care not to select **App Registrations (Legacy)** as these instructions do not apply to them)
1. Enter the following application registration details
   * **Name** - must be **Modality TWA Automation** (this name is important for the application to work correctly)
   * **Supported Account Types** - This should be set to  **Accounts in any organizational directory (Any Azure AD directory - Multitenant)** [Why?](https://techcommunity.microsoft.com/t5/iis-support-blog/how-to-create-an-app-registration-in-azure-ad-for-a-bot-solution/ba-p/810761)
   * **Redirect URI** - not required   
1. Click **Register** and Azure AD will create an Application ID and present the Overview page

1. Take note of the **ApplicationID** as this will be required further in the deployment process
![overview of application](https://raw.githubusercontent.com/modalitysystems/modalitysoftware-docs/master/twa/images/applicationOverview.png)

### Add a Client Secret
1. Navigate to the **Azure Active Directory** from the navigation pane on the left
1. Select **App Registrations** and select the **Modality Teamwork Analytics** app 
1. Select **Certificates & secrets** from the Manage menu
1. Select **New client secret** and enter an appropriate description and expiry period
   * **Description** - Recommend setting this to **TWA-Secret**
   * **Expiry** - Recommend setting this to **Never**
1. Click **Add**
1. Immediately take note of the **Secret** as this can not be retrieved later and will be required further in the deployment process
![team work secret](https://raw.githubusercontent.com/modalitysystems/modalitysoftware-docs/master/twa/images/teamworkSecrets.png)

### Declare API Permissions for Teamwork Automation
1. Navigate to the **Azure Active Directory** from the navigation pane on the left
1. Select **App Registrations** and select the **Modality Teamwork Analytics** app 
1. Select **Api permissions** from the Manage menu
1. Find and select **Microsoft Graph** from the **Request API permissions** blade
![add permissions](https://raw.githubusercontent.com/modalitysystems/modalitysoftware-docs/master/twa/images/requestGraphPermissions.png)
1. Ensure that the permission type is set to "Application permissions" and not "Delegated permissions"
1. Select the follow permission from Microsoft.Graph
   * TeamsAppInstallation.ReadWriteSelfForUser.All
2. Click **Add permissions** to be returned to the "API permissions" blade
3. Click the **Grant Admin Consent for Your Name** button
![permissions summary](images/apiPermissions.png)

## Step 2 - Deploy Teamwork Automation

Teamwork Automation is provided as an **Azure Resource Manager (ARM) template** that automatically provisions and starts the required resources in your Azure subscription. Teamwork Analytics **MUST** already have been installed by using the [InstallTWA.ps1](../deploytwa.md) deployment script

> Note: You must have registered an application beforehand. Provide the App ID and App Secret from Step 1.

> Note: For an introduction to Azure Resource Manager see [docs.microsoft.com](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-overview).

Download [InstallBOT.ps1](https://github.com/modalitysystems/TeamworkAnalyticsGABuilds/releases), the PowerShell script is version stamped and will install the version of Teamwork Analytics that matches the download. It uses output from InstallTWA.ps1 so **MUST** be run from the same location.

Each script is signed and will require an **Administrative PowerShell** window and the following PowerShell module to be installed before attempting to run the scripts:

- [Azure PowerShell](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps-msi)
  
They will also need to be able to access the internet so if you are running the scripts from behind a web proxy then this will need to be configured. First off run the PowerShell script by typing the name of the script from the script directory.

  ![Script Choice](https://raw.githubusercontent.com/modalitysystems/modalitysoftware-docs/master/twa/images/scriptchoice2.png)

Enter **O** if Teamwork Analytics has been deployed to the Windows machine that the script is being run from, or **A** if Teamwork Analytics has been deployed to Azure.

Once you have made your selection enter the information as prompted, all selections are saved to a parametersFile.json file that will be read the next time the script is run so as to make upgrades easier.

## Step 3 Install Teamwork Automation App into Teams

The **InstallBOT.ps1** script should have created a manifest file called **AutomationManifest.zip** that points to the newly deployed Teamwork Automation Bot. The manifest should only need to be uploaded to Teams once or if Modality say it needs to be done again.

1. 1.	From Microsoft Teams go to the Apps section
   
   ![Screenshot](https://raw.githubusercontent.com/modalitysystems/modalitysoftware-docs/master/twa/images/bots/teams-apps.png)
   
1. Then select Upload for [YOUR ORGANISATION NAME]
   
   ![Screenshot](https://raw.githubusercontent.com/modalitysystems/modalitysoftware-docs/master/twa/images/bots/apps-upload.png)
   
1. Then select the downloaded App manifest file zip file
   
   ![Screenshot](https://raw.githubusercontent.com/modalitysystems/modalitysoftware-docs/master/twa/images/bots/upload-open.png)

1. The App should then appear within your companies Apps section
   
   ![Screenshot](https://raw.githubusercontent.com/modalitysystems/modalitysoftware-docs/master/twa/images/bots/app-deployed.png)
   
1. Once this has been completed, click the "..." button in the top right corner of the app and click Copy link. Provide this link to Modality alongside your Tenant ID as these required for provisioning on the Modality hosted bot platform.
   
   ![Screenshot](https://raw.githubusercontent.com/modalitysystems/modalitysoftware-docs/master/twa/images/bots/app-copy-link.png)
   
## Allow App to be installed within Microsoft Teams

Now that the App has been added to your Microsoft Teams Tenant, your Global policy may need to be adjusted to allow it to be installed by users.

1. From the Microsoft Teams Admin Center, under *Teams apps* click *Permission policies*

   ![Screenshot](https://raw.githubusercontent.com/modalitysystems/modalitysoftware-docs/master/twa/images/bots/admin-perm-pols.png)
    
1. Click on *Global (Org-wide default)* (or whatever policy is applied to your organisation)

   ![Screenshot](https://raw.githubusercontent.com/modalitysystems/modalitysoftware-docs/master/twa/images/bots/app-perm-pols.png)

1. Make sure the *Tenant apps* policy is set to Allow all apps

   ![Screenshot](https://raw.githubusercontent.com/modalitysystems/modalitysoftware-docs/master/twa/images/bots/tenant-apps.png)

> NOTE: You could also specify a list of allowed apps here 

## Upgrading

Each time the script is run it will deploy anything that has changed from what is defined in the ARM Template. To perform an upgrade simply run a newer version of the script to the same resource group. If a parametersFile exists in the script folder then this will be read and used for the deployment. However, if there is no parametersFile then you will need to complete all information as prompted.