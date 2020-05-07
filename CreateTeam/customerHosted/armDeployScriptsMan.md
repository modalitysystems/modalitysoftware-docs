## Upload Certificate to App Registration

1. Navigate to the resource group that CreateTeam has been deployed too
   
   ![Resource Group](../images/customerHosted/armDeployRG.png)

1. Click on the KeyVault and then Certificates
   
   ![Screenshot](../images/customerHosted/certificateKeyVault.png)

1. Click on the Certificate called CreateTeam
   
   ![Screenshot](../images/customerHosted/certificateGenerationOpen.png)

1. Click on the Current version

   ![Screenshot](../images/customerHosted/certificateGenerationOpen2.png)

1. Then on the certificate details screen, there will be an option to "Download in CER format", select this and keep track of the directory it downloads to, which should be your default browser download directory.

   ![Screenshot](../images/customerHosted/certificateDownload.png)

Following the section above, you should have a valid certificate which will now be used to upload against the app registration. So the next step is go to the app registration and follow the steps below:

1. When the app registration has loaded, go to the "certificates & secrets" section and select the "Upload certificate" button underneath the "Certificates" header

   ![Screenshot](../images/customerHosted/certificateUploadToAppReg.png)

1. Browse to the directory containing the .cer certificate file recently created, and select "Ok". The import should work and you upload should show against the app registration

   ![Screenshot](../images/customerHosted/certificateUploadedToAppReg.png)

It is unlikely that you have uploaded the wrong certificate, but you can verify by checking that the "Thumbprint" values matches on both the uploaded certificate and the one created in KeyVault.

## Upload CreateTeam manifest to Microsoft Teams

Using the manifest file that was created by **PostARMDeployScript.ps1**, follow the instructions below:

1. From Microsoft Teams go to the Apps section

   ![Screenshot](../images/teams-apps.png)

1. Then select Upload for [YOUR ORGANISATION NAME]

   ![Screenshot](../images/apps-upload.png)

1. Then select the zip file downloaded as detailed in the previous section.

   ![Screenshot](../images/upload-open.png)

1. The App should then appear within your companies Apps section

   ![Screenshot](../images/app-deployed.png)

> NOTE: To update an App that has already been installed, navigate to the App within your companies Apps section then hover your mouse pointer over the app, click on the ... in the top right corner and click Update

![Screenshot](../images/app-update.png)

## Allow App to be installed within Microsoft Teams

Now that the App has been added to your Microsoft Teams Tenant, your Global policy may need to be adjusted to allow it to be installed by users.

1. From the Microsoft Teams Admin Center https://admin.teams.microsoft.com/ , under _Teams apps_ click _Permission policies_

   ![Screenshot](../images/admin-perm-pols.png)

1. Click on _Global (Org-wide default)_ (or whatever policy is applied to your organisation)

   ![Screenshot](../images/app-perm-pols.png)

1. Make sure the _Tenant apps_ policy is set to Allow all apps

   ![Screenshot](../images/tenant-apps.png)

> NOTE: You could also specify a list of allowed apps here

## Pin App within Microsoft Teams

> NOTE: You can call the policy whatever you like, it is not required to be called "CreateTeam-ModProd" as seen in the pictures below.

To improve the end user experience it is recommended to pin the App to the main Microsoft Teams list of Apps

1. From the Microsoft Teams Admin Center, under _Teams apps_ click _Setup policies_

   ![Screenshot](../images/admin-setup-pols.png)

1. Either edit _Global (Org-wide default)_ or create a new policy and give it a name

   ![Screenshot](../images/pinned-apps-notg.png)

1. Click _Add apps_, select _Permissions policy_ from previous step, search for TG and click Add

   ![Screenshot](../images/add-pinned-apps.png)

1. Click Save

   ![Screenshot](../images/pinned-apps-complete.png)

If you created a new Setup policy in step 2 then you will need to assign users to the policy

1. From the Microsoft Teams Admin Center, under _Teams apps_ click _Setup policies_, click on the tick next to the required policy name

   ![Screenshot](../images/admin-setup-pols-users.png)

1. Click _Manage users_ and add the required users

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