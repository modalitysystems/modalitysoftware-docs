# How to deploy CreateTeam App into Teams

Create Team is provided as an Microsoft Teams App which needs to be uploaded to your organisation's Apps section within Microsoft Teams.

> NOTE: Some of the steps below require making changes to your Microsoft Online Tenant which can sometimes take a few hours to take effect

## Creating your manifest file

You must install the "App Studio" application on your local teams client, load in the template "CreateTeam Template.zip" provided, update specific values and then download the new manifest, as seen below:

1.	From Microsoft Teams go to the Apps section
   
   ![Screenshot](../images/teams-apps.png)

2.	Search for "App Studio" and install by selecting "Add"
   
   ![Screenshot](../images/customerHosted/appStudioInstall.png)

3.	Open "App Studio", then select the "Manifest editor" tab and then click "Import an existing app"

   ![Screenshot](../images/customerHosted/importApp.png)

4.	Browse to the directory that contains the "CreateTeam Template.zip" provided, select this file and click "Ok"

   ![Screenshot](../images/customerHosted/openManifest.png)

5.	The base template will now be visible on within the manifest editor tab, simply highlight select the elipsis and click "Edit"

6.	Select "Tabs" within the "Capabilities" section, then click "Add" underneath the "Add a personal tab" section.

7.	Fill in the fields using the values below and select "Save":
   7.1 Name = Main
   7.2 Entity ID = ctID
   7.3 Content URL = **output from the ARM template**

8.	Select "Domains and permissions" within the "Finish" section, enter in your valid domain which was also **output from the ARM template** and then select "Add"

   ![Screenshot](../images/customerHosted/validDomain.png)

9.	Select "Test and distribute" within the "Finish" section and then select "Download"

   ![Screenshot](../images/customerHosted/downloadManifest.png)

10.  Your new template with the correct values will now be located in your default download directory. The file will be called "CreateTeam.zip", this is your final template that will be used when installing. 

   ![Screenshot](../images/customerHosted/downloaded.png)

## Installation

Using the manifest file created above, follow the instructions below:

1. From Microsoft Teams go to the Apps section
   
   ![Screenshot](../images/teams-apps.png)
   
2. Then select Upload for [YOUR ORGANISATION NAME]
   
   ![Screenshot](../images/apps-upload.png)
   
3. Then select the App package provided by Modality Systems as a zip file
   
   ![Screenshot](../images/upload-open.png)

4. The App should then appear within your companies Apps section
   
   ![Screenshot](../images/app-deployed.png)
   
> NOTE: To update an App that has already been installed, navigate to the App within your companies Apps section then hover your mouse pointer over the app, click on the ... in the top right corner and click Update 
   
   ![Screenshot](../images/app-update.png)
   
## Allow App to be installed within Microsoft Teams

Now that the App has been added to your Microsoft Teams Tenant, your Global policy may need to be adjusted to allow it to be installed by users.

1. From the Microsoft Teams Admin Center, under *Teams apps* click *Permission policies*

   ![Screenshot](../images/admin-perm-pols.png)
    
2. Click on *Global (Org-wide default)* (or whatever policy is applied to your organisation)

   ![Screenshot](../images/app-perm-pols.png)

3. Make sure the *Tenant apps* policy is set to Allow all apps

   ![Screenshot](../images/tenant-apps.png)

> NOTE: You could also specify a list of allowed apps here 

## Pin App within Microsoft Teams
> NOTE: You can call the policy whatever you like, it is not required to be called "CreateTeam-ModProd" as seen in the pictures below.

To improve the end user experience it is recommended to pin the App to the main Microsoft Teams list of Apps

1. From the Microsoft Teams Admin Center, under *Teams apps* click *Setup policies*

   ![Screenshot](../images/admin-setup-pols.png)
    
2. Either edit *Global (Org-wide default)* or create a new policy and give it a name

   ![Screenshot](../images/pinned-apps-notg.png)

3. Click *Add apps*, select *Permissions policy* from previous step, search for TG and click Add

   ![Screenshot](../images/add-pinned-apps.png)

4. Click Save

   ![Screenshot](../images/pinned-apps-complete.png)

If you created a new Setup policy in step 2 then you will need to assign users to the policy

5. From the Microsoft Teams Admin Center, under *Teams apps* click *Setup policies*, click on the tick next to the required policy name

   ![Screenshot](../images/admin-setup-pols-users.png)

6. Click *Manage users* and add the required users
    
   ![Screenshot](../images/manage-users.png)
   
Further information about managing app setup policies in Microsoft Teams is available: 

   [Manage app setup policies in Microsoft Teams](https://docs.microsoft.com/en-us/microsoftteams/teams-app-setup-policies)

> NOTE A user can only be assigned to 1 app settings policy so this will remove them from the policy that they are currenlty assigned too

## User Consent for CreateTeam App Client

When a user first launches the App from within Microsoft Team, they are required to provide consent for their details to be accessed by the App

   ![Screenshot](../images/teams-consent.png)
  

## Changing default settings

This application looks at your default tenant settings to determine the default value of certain fields.
To change your default tenant settings read the following guide.
https://docs.microsoft.com/en-us/graph/api/resources/groupsetting?view=graph-rest-1.0

The following fields look at tenant default values
1. External Checkbox looks at AllowToAddGuests value
