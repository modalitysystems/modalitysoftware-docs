# Removing the default Microsoft Teams Create Button when using CreateTeam

> Depending on your circumstances, it may be preferable to remove the default Teams Creation button when using CreateTeam, in order to ensure that all Team creation reaquests happen via CreateTeam. This page documents how to do that, and known effects of doing so.

## How to remove default Microsoft Teams Teams Creation button

Currently, the only way to restrict ability for users to create Teams is to restrict their ability to create Office 365 Groups. 
This is done by restricting Office 365 Group creation to members of a particular security group.

There are a number of steps needed to configure this (which is done using Windows PowerShell). 
Follow the steps detailed at: [Manage who can create Office 365 Groups](https://docs.microsoft.com/en-us/office365/admin/create-groups/manage-creation-of-groups?view=o365-worldwide)

Note, even if you disable OFfice 365 group cration, the buttin in Microsoft Teams client will still appear and still be called "Join or Create Team". When it is clicked the only option users will see is to join a Team. This can be a confusing experience for users. At present this is not something partners or customers can control, but Microsoft welcome feedback if this is causing you concern.

## Effects of restricting Office 365 Group creation

Removing the ability for users to create Office Groups restricts their ability to perform a number of activities, not just creation of Teams. Activities include (but may not be limited to):

- Creation of Plans in Planner
- Workspace creation in PowerBI
- Creation of Office 365-connected Yammer groups (new groups will be reated as legacy non-Office 365 groups)
- Creation of Groups in Stream
- Creation of Groups in Outlook
- Creation of Teams in StaffHub

In addition, any users in the security group designated for Group creation must have one of the following licenses assigned to them:

- Azure AD Premium licenses
- Azure AD Basic EDU

