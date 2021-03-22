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

Essentially Teamwork Analytics consists of a Collector service that writes to a database and optionally a Notification Service that gets triggered by scheduled tasks to post messages to the Automation Bot. 

These components can either be deployed to your own Windows VM that writes to your own SQL Server 2016 or greater database or we can deploy all required components to a self contained resource group in Azure using an ARM Template.

Both methods of deployment are achieved but running the InstallTWA deployment script.

[Teamwork Analytics installation guide](deploytwa.md).

### Step 3: Get PowerBI Apps from the App Store and Connect to your SQL Database

In order to visualize the data that has been collected by the Teamwork Analytics Service you will need to install the PowerBi Apps.

[PowerBi Apps installation guide](PowerBIAppsAdminInstallGuide.md).

### Step 4 (optional): Teamwork Automation Bot Deployment

>N.B You can only complete the bot deployment if the Notification Service was deployed in step 2.

This component lives in Azure but you can either use the one hosted by Modality (SaaS) or you can deploy your own instance within your tenant (CAT)

To make use of Teamwork Automation Bot (SaaS), you need to install the Bot App into your Microsoft Teams tenant by [following these instructions](automation\customerhosted.md). Once completed, provide your Tenant Id, Bot Pre-Shared Key and Bot Installation Link to the Modality Team to complete provisioning in our hosted infrastructure.

To deploy Teamwork Automation Bot (CAT) within your own tenant then [follow these instructions](deployteamsapp.md)

If you would like to change the default reminder scheduling. Follow [these steps to configure the Task Scheduler](NotificationTaskScheduling.md).

If you would like more information on the default Bot scenarios and their message content see [here](BotsContent.md).

### Step 5 (optional): Configuring 

Now that everything is installed, you can configure settings previously set or for additional features.

#### Scan Configuration

Teamwork Analytics allows you to configure the types of scan you wish to run, and the scheduling for each. for more information on how to configure this see [here](scan-configuration.md).

#### User Adoption Groups

Teamwork Analytics allows you to create custom groups of users for reporting, for more information on these groups see [here](UserAdoptionGroups.md).

#### Custom User Attributes

Teamwork Analytics allows you to report on custom user attributes from your active directory. For information on how to configure this feature, see [here](CustomUserAttributes.md).

#### User Reporting Filters

The filters for reports containing user data can be configured. For information on how to configure this feature, see [here](user-reporting-filters.md).

#### Toggling Feature Flags

You can enable and disable previously set feature flags from the Teamwork Analytics Data Collector config file. Steps on how to do this can be found [here](ChangingFeatureFlags.md).

#### SQL Performance
You can fine tune TWA's load on SQL. Find out more about this [here](sql-performance.md).

### Step 6: Individual Power BI Apps to install and connect to backend database
>[Teamwork Analytics: Teams Usage](ModalityTeamsUsage.md)

>[Teamwork Analytics: Teams Governance & Security](ModalityTeamsGovernanceAndSecurity.md)

### Step 7: Learn TWA
Learn how TWA works and some of the terminology surrounding it.
>[Messages](messages.md)

>[Files](files.md)

>[Anonymisation of Personally Identifiable Information (PII)](Anonymisation.md)