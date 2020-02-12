

## Message Action Buttons (Preview)

In preview, Teamwork Analytics Automated messaged to user can include an action button, allowing a user to take a direct action from the message, for example, deleting or archiving a team.

Note this feature is in preview/development and we are looking for customer feedback.

## How it works

Emails or Teams Messages will contain an action button that is a hyperlink. The user clicks the hyperlink which invokes the action via Microsoft Graph using that users permissions (called delegated permissions). 

The action button requires the user to be signed into Office 365 in the browser. In a corporate environment users are often already signed in on the browser, but if not they may be promoted to sign into their Office 365 account, much like they would if going to SharePoint or Outlook Web App.

Delegated permissions mean the buttons can only do what that user can do. e.g. if they are a team owner they have delete permission that team. 

The backend application doesn't need write access/delete access to teams. Actions are handled through delegated access.

## How to set it up

To enable an app with delegated permissions to work for users on your tenant, an Office 365 global admin has to approve the app once globally. From them on the app will work for all users. 

