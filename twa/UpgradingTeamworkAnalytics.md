## Upgrading Teamwork Analytics

Teamwork Analytics is comprised of a backend (SQL Database, Windows Server and Windows Services) and PowerBI Apps. To upgrade 

> **Important**: The PowerBI Apps and Data Collector should both be updated to the latest version together, to confirm if you need to update both components, you can check your version numbers as outlined [here](/twa/HowToCheckYouHaveTheLatestVersion.html)

## Backend Upgrade - ARM Template

The process for upgrading is identical to installation, except that you will choose an existing Resource Group, rather than creating a new one.

Azure Resource Manager analyses the difference from past deployments, and only changes what it needs to.

If you need to recover the settings from a previous deploy, you can do this via the Resource Group deployment history; 

1. In the Resource Group which you chose to deploy to, click Deployments on the left hand menu under settings, and then click the latest deployment (at the top) as below
![Deployment History](images/deployments-list.png)

2. Once open, click inputs to see the value from the previous deploy.
![Inputs](images/deployment-inputs.png)

Detailed steps here: [ARM Template Install](/twa/deploytwa.html)

## Backend Upgrade - Manual PowerShell Install

The process for upgrading is identical to installation, run the PowerShell script from the virtual machine.

Details steps here: [Deploying Teamwork Analytics with PowerShell](/twa/customDeploytwa.html)

## Updating Power BI apps

The process for updating an app is exactly the same as the initial installation. You install the latest version side by side and configure it then delete the existing version.

When installing the latest version from AppSource select "Install to a new workspace" and click _Install_.

When the new version is installed, the old version can be unpublished by deleting its workspace.

> The "Overwrite an existing version (Preview)" option is not recommended until it becomes fully supported. 

![Overwriting an app that is already installed](images/powerbi/alreadyinstalled.png)


Detailed steps here: [PowerBI Install Guide](/twa/PowerBIAppsAdminInstallGuide.html)
