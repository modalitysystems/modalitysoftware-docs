## Upgrading Teamwork Analytics

Teamwork Analyitcs is comprised of a backend (SQL Database, Windows Server and Windows Services) and PowerBI Apps. To upgrade 

## How to check your current version

Your current versions are listed in the PowerBI apps under Advanced / About



## Backend Upgrade

Follow the same ARM Template deployment or PowerShell deployment steps. You will need all your origional configuration details. The install will overwrite the exsiting code but not lose any existing data.

## Updating Power BI apps

The process for updating an app is exactly the same as the initial installation. You install the latest version side by side and configure it then delete the existing version.

When installing the latest version from AppSource select "Install to a new workspace" and click _Install_.

When the new version is installed, the old version can be unpublished by deleting its workspace.

> The "Overwrite an existing version (Preview)" option is not recommended until it becomes fully supported. 

![Overwriting an app that is already installed](images/powerbi/alreadyinstalled.png)
