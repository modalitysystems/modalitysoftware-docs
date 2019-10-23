# Summary
Uses Google Chrome to run Microsoft Teams, schedule and join a meeting. Whilst in the meeting, video and audio is passed through, generating teams call quality data - visible from the call analytics dashboard.

## System Requirements
- Google Chrome
- Microsoft .NET 4.6.1 - https://docs.microsoft.com/en-us/dotnet/framework/get-started/system-requirements

# How to Run
- Extract the zipped file "TeamsNodesPoC"
- Configure the program by opening "TeamsMeeting.exe.config" in Notepad updating the values within the "appSettings" section, the defaults are as follows:
- CallLength = 30 (seconds - cannot be less than 7)
- DemoMode = false (when true (enabled), displays automation within the browser)
- MaximumNumberOfCalls = * (asterisk = infinite - else should be 1 or greater)
- UserEmail = "user@domain.com" (plain text)
- UserPassword  = "password" (plain text)
- The executable "TeamsMeeting.exe” can be run manually or as a service.

# What it does
This PoC uses Selenium to automate a specified browser, in this case Google Chrome. Using the credentials supplied in the config, the application loads the Microsoft Teams web client and uses the specified credentials to login the users tenant. A meeting is then scheduled for 30 minutes based on the current time and the signed in user is specified as an attendee. The application then joins the user to the scheduled meeting, attaching audio and video to the call. The call will end after the specified amount of seconds have elapsed. The whole process is then restarted and will occur for as long as specified in the config.

All actions are logged to file and can be located at C:\TEMP. If a failure occurs, it is logged and the automated process restarts. The application can run as a service without a user being signed into the machine.

# Known Issues
- When "DemoMode" is set to true the call success is lower than when set to false.
 - When false, deep links are used to schedule - which is still in preview so unexpected behaviour may occur overtime.
- The "CallLength" cannot be less than 7, otherwise the calls fail.

# Future Scope
- Default Browser Detection:
 - Microsoft Edge (Tested with and works)
 - Microsoft Chromium Edge (Tested with and works)
