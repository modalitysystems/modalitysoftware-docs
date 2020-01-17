## Teamwork Analytics Data Collector Deployment

The Teamwork Analytics Technical Documentation page provides access to all of the platform documentation you will need to successfully setup and configure Teamwork Analytics.

## Deployment Prerequisites

You will need:

- A Office 365 Global admin to register an Azure Application ID
- Access to a Microsoft Azure tenant
- An Azure Global Admin account (for admin consent of application permissions)
- To create a PowerBI Pro service user account and provide us with login credentials

### Step 1: Register an Azure Application ID

Start by registering a new Azure Application in your Azure tenant. 

For this step you will need to use an Azure Global Admin account. 

[Registering Teamwork Analytics as an Azure Application](registerapplication.md)

Once the application has been registered, submit the Application ID of your newly created application to Modality System for it to be whitelisted. Once this is has happened you will be given access to continue the deployment using the steps below.

### Step 2: Deploy Teamwork Analytics

Follow one of the two guides to deploy Teamwork Analytics depending on your requirements.

#### ARM Template Deployment (Recommended)

Teamwork Analytics uses an Azure Resource Management (ARM) template to ease deployment. The ARM template ensures that all data is held on your Azure tenant, and is a simple way to deploy and secure several resources on your Azure tenant. Using the information provided to you from the previous step, follow the [deployment steps here](deploytwa.md).

When the deployment has completed, review the resources which have been created within the resource group. One of the resources is a SQL Server with a name similar to *twa-aaa1bb2c3dd4e*. Make a note of this name.

#### Custom Deployment (Pre-built infrastructure)

Teamwork Analytics can also be deployed and configured to use an existing environment. By using your own SQL Server and provided information, you can request our PowerShell Script that will download and install the deployment on your existing machine. Once you have access to our PowerShell Script you can follow [these deployment steps](customDeploytwa).

### Step 3: Get PowerBI Apps from the App Store and Connect to your SQL Database

You can find the PowerBi Apps at this [link](https://modalitysoftware.com/twa) 

>[PowerBi Apps installation guide](PowerBIAppsAdminInstallGuide.md)

### Step 4 (optional): Teamwork Analytics Bot Deployment

>N.B You can only complete the bot deployment if the Notification Service was deployed in step 2.

To deploy the teamwork analytics Teams Bot, you need to install the Bot App into your Microsoft Teams tenant by [following these instructions](deployteamsapp.md). Once completed, provide your Tenant Id, Bot Pre-Shared Key and Bot Installation Link to the Modality Team to complete provisioning in our hosted infrastructure.

If you would like to change the default reminder scheduling. Follow [these steps to configure the Task Scheduler](NotificationTaskScheduling.md).

### Step 5 (optional): Configuring 

Now that everything is installed, you can configure settings previously set or for additional features.

#### User Adoption Groups

Teamwork Analytics allows you to create custom groups of users for reporting, for more information on these groups see [here](UserAdoptionGroups.md).

#### Toggling Feature Flags

You can enable and disable previously set feature flags from the Teamwork Analytics Data Collector config file. Steps on how to do this can be found [here](ChangingFeatureFlags.md)

### Individual Modules
>[Teamwork Analytics: Teams Usage](ModalityTeamsUsage.md)

>[Teamwork Analytics: Teams Governance & Security](ModalityTeamsGovernanceAndSecurity.md)

>[Teamwork Analytics: Teams PSTN Billing](ModalityPSTNBilling.md)

>[Teamwork Analytics: Online Meeting Usage](ModalityOnlineMeetingUsage.md)

>[Teamwork Analytics: Yammer Usage](ModalityYammerUsage.md)
