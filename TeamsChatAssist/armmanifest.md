# Teams Chat Assist Manifest for ARM Deployment

Teams Chat Assist Bot requires a manifest file that defines all components of the Bot so that it can be installed into Microsoft Teams and used by people within your organization. To create this file we will be using a Microsoft Utility called [App Studio](https://docs.microsoft.com/en-us/microsoftteams/platform/concepts/build-and-test/app-studio-overview).

## Create Manifest

1. Start by [downloading](http://docs.modalitysoftware.com/TeamsChatAssist/images/TeamsChatAssistBot.zip) the base manifest file with common values defined.

2. Load App Studio from Micrsoft Teams, goto 'Manifest editor' and 'Import and existing app'.

   ![App Studio](images/appStudio.png)

3. Select the base manifest zip file that you downloaded, click the 3 dots in the top right corner of the App.

   ![App Studio Edit](images/appStudioEdit.png)

4. The App ID needs to be unique for each manifest that is created so to ensure this click the 'Generate' button to create a new randomly generated GUID. All other values on this page don't need changing.

   ![App Studio Detail](images/appStudioDetail.png)

5. Under Capabilites click the Bots tab and then click the 'Set up' button.

   ![App Studio Bots](images/appStudioBots.png)

6. Select Existing bot, connect to different bot id and enter the same App ID that you created for the ARM Deployment and give it a name. Under Scope, Tick Personal and Team, then click Save.

   ![App Studio BotSetup](images/appStudioBotSetup.png)

7. You should then see the following and then the manifest can be downloaded by clicking 'Test and distribute'.

   ![App Studio BotResults](images/appStudioBotResults.png)

8. Click 'Download' to download the manifest zip file to your downloads folder. The validation is intended for when the Manifest is going to be added to the Microsoft Store so is not always relevant here.

   ![App Studio Distribute](images/appStudioDistribute.png)

9. To install the manifest into Microsoft Teams click the 3 dots and then More apps.

   ![Teams More Apps](images/teamsMoreApps.png)
         
10. Click Upload for (complany name) and select the manifest zip file that you downloaded

   ![Teams Upload](images/teamsUpload.png)

   > Note: This step will require the Teams Admin Role

11. Click the down arrow next to add and select 'Add to a team'. Select a Team within you organization for the bot to post agent messages.

   ![Teams Add](images/teamsAdd.png)

   > Note: It is recommended for this Team to be purpose made for the bot to talk too
