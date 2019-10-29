# Installing CreateTeam in your own tenant: Prerequisites

Installing CreateTeam in your own tenant involves 2 separate processes: deploying the ARM template to add resources to your Azure tenant to run CreateTeam, and creating and configuring an Azure AD application.

## Adding resources to your ARM Template

Modality System will provide an ARM template to install everything needed for CreateTeam to run in your tenant. This includes:

 - a Web App Service and Service Plan
 - a Bot Framework Instance
 - a Storage Account with a number of Storage Tables
 
 In addition you will need to provide details of an SMTP gateway to enable CreateTeam to send emails.
 
## Creating and Configuring an Azure AD application

You will need to follow our documentation to create a new Azure AD Application for CreateTeam to use. In order for CreateTeam to work, the following permissions are required:

**Read and write directory data** - Allows the app to read and write data in your organization's directory, such as users, and groups, without a signed-in user. Does not allow user or group deletion.

**Read and write all groups** - Allows the app to create groups, read all group properties and memberships, update group properties and memberships, and delete groups. Also allows the app to read and write group calendar and conversations. All of these operations can be performed by the app without a signed-in user.

**Sign in and read user profile** - Allows users to sign-in to the app, and allows the app to read the profile of signed-in users. It also allows the app to read basic company information of signed-in users.
