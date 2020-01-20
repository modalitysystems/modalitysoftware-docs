# Teams Chat Assist Manifest for ARM Deployment

Teams Chat Assist Bot requires a manifest file that defines all components of the Bot so that it can be installed into Microsoft Teams and used by people within your organization. To create this file we will be using a Microsoft Utility called [App Studio](https://docs.microsoft.com/en-us/microsoftteams/platform/concepts/build-and-test/app-studio-overview).

## Create Manifest

1. Start by [downloading](http://docs.modalitysoftware.com/TeamsChatAssist/images/TeamsChatAssistBot.zip) the base manifest file with common values defined.

2. Load App Studio from Micrsoft Teams, goto 'Manifest editor' and 'Import and existing app'.

   ![App Studio](images/appStudio.png)

3. Select the base manifest zip file that you downloaded, click the 3 dots in the top right corner of the App.

   ![App Studio Edit](images/appStudioEdit.png)

4. The App ID needs to be unique for each manifest that is created so to ensure this click the 'Generate' button to create a new randomly generated GUID. All other values on this page to need changing.

   ![App Studio Detail](images/appStudioDetail.png)

5. Under Capabilites click the Bots tab and then click the 'Set up' button.

   ![App Studio Bots](images/appStudioBots.png)

6. Select Existing bot, connect to different bot id and enter the same App ID that you created for the ARM Deployment.

   ![App Studio BotSetup](images/appStudioBotSetup.png)

   > NOTE: Under Scope, Tick Personal and Team.