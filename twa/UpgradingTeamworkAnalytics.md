## Upgrading Teamwork Analytics

Teamwork Analyitcs is comprised of a backend (SQL Database, Windows Server and Windows Services) and PowerBI Apps. To upgrade 

## How to check your versions and find out the latest released version

Your current versions are listed in the PowerBI apps under Advanced / About

![Deployment History](images/TWAVersionNumbers.png)

You can check the latest versions of the backend released here: [Github Releases List](https://github.com/modalitysystems/TeamworkAnalyticsGABuilds/releases)

For PowerBI apps, our version number appears in the description of the app in the AppSource Microsoft App Store. Note Microsoft don't have any publicly accessible version numbering for PowerBI apps so we label our PowerBI apps with our own versioning.

When upgrading either the PowerBI or the backend, please make sure you are on the latest of both. You can upgrade the app or the backend in any order, but it is only tested and supported to work on the current version of both.



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


Detailed steps here: [PowerBI Instal Guide](/twa/PowerBIAppsAdminInstallGuide.html)
