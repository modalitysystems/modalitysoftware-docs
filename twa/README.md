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

### Step 2: Deploy Teamwork Analytics Azure Resource Management (ARM)

Teamwork Analytics uses an Azure Resource Management (ARM) template to ease deployment. The ARM template ensures that all data is held on your Azure tenant, and is a simple way to deploy and secure several resources on your Azure tenant. Using the information provided to you from the previous step, follow the [deployment steps here](deploytwa.md).

When the deployment has completed, review the resources which have been created within the resource group. One of the resources is a SQL Server with a name similar to *twa-aaa1bb2c3dd4e*. Make a note of this name.

### Step 3: Get PowerBI Apps from the App Store and Connect to your SQL Database

You can find the PowerBi Apps at this [link](https://modalitysoftware.com/twa) 

>[PowerBi Apps installation guide](twa/PowerBIAppsAdminInstallGuide.md)

### Individual Modules
>[Teamwork Analytics: Teams Usage](twa/ModalityTeamsUsage.md)

>[Teamwork Analytics: Teams Governance & Security](twa/ModalityTeamsGovernanceAndSecurity.md)

>[Teamwork Analytics: Teams PSTN Billing](twa/ModalityPSTNBilling.md)

>[Teamwork Analytics: Online Meeting Usage](twa/ModalityOnlineMeetingUsage.md)

>[Teamwork Analytics: Yammer Usage](twa/ModalityYammerUsage.md)
