# Template JSON Configuration

The templates available in CreateTeam are [configured in table storage](TableStorageConfiguration.md##template-table), the _templateJson_ field describes what settings a team created using the specified template will have. The field should be populated with a JSON object, this document explains how to create that JSON object.

## JSON Format

The JSON object should have the following format:

```javascript
{
   "Prefix": "Prefix",
   "Suffix": "UK Sales",
   "IsExternal":true,
   "Visibility":1,
   "AlwaysAuthorise":false,
   "AzureSecurityGroup":"GroupName",
   "Channels":[
      {
         "DisplayName": "General",
         "Tabs":[
            {
               "Type": "website",
               "DisplayName": "My Website Tab",
               "Contenturl": "https://www.google.co.uk/"
            }
         ]
      },
      {
         "DisplayName":"Channel with document tabs",
         "Description":"This channel contains document tabs",
         "Tabs":[
            {
               "Type": "word",
               "DisplayName": "My Word Tab",
               "FileName": "MyWordDoc.docx",
               "DocumentUrl": "https://company.sharepoint.com/:w:/r/sites/site/_layouts/15/Doc.aspx?sourcedoc=%7BEF93C343-A495-4E04-BFB4-E5C70FFD85F6%7D&file=MyWordDoc.docx&action=default&mobileredirect=true",
               "FolderUrl":"https://company.sharepoint.com/sites/site/path.aspx?newTargetListUrl=%2Fsites%2Fsite%2Fpath&viewpath=%2Fsites%2Fsite%2Fpath%2Easpx&viewid=18ad4b3b%2Dc03a%2D4479%2Db927%2D390460de7363&id=%2Fsites%2Fsite%2Fpath"
            }
         ]
      },
      {
         "DisplayName":"Channel name",
         "Description":"Channel description"
      }
   ]
}
```

You can use the above example as a starting point for your JSON object, you should then go through [each of the settings](##template-settings) and set the behaviour for template.

> The above JSON object is only an example and will not work if you copy it into your table storage without editing it for your requirements.

Once you have edited/created your JSON object it is advisable to verify your JSON object is in a valid format. This can be done by visiting https://jsonformatter.curiousconcept.com/, and pasting in your JSON object. If your JSON object is not in a valid format, then CreateTeam's templates will not function correctly.

## Template Settings

This section details what each setting controls and how to configure it. Not all setting have to be set in a particular template, so you can choose settings to include/exclude based on your required behaviour. Any setting that you set in the template cannot be overridden when creating a team, as the corresponding fields will be disabled.

### Prefix

- The text that will be prepended to the start of the every team name created using the template.
- The maximum prefix length is 10 characters.

### Suffix

- The text that will be appended to the end of every team name created using the template.
- The maximum suffix length is of 10 characters long.
- If the team can contain guests (controlled by the [IsExternal setting](##isexternal)), then the suffix _' - IsExternal'_ is appended after the suffix specified here.

### IsExternal

- Whether the team can contain guests or not.
- Controls the _Allow Guests_ tickbox on the Create Page in CreateTeam.
- When _true_ appends the suffix _' - IsExternal'_ to the team name.

### Visibility

- The visibility and behaviour of the team to users who are not members of the created team.
- The setting must have the value of either _0_,_1_, or _2_ as defined below:
  - 0 - Public
  - 1 - Private - Discoverable
  - 2 - Private - Hidden

### AlwaysAuthorise

- When _true_, all new teams created using the template will be submitted for Authorisation.
- The ability to create Teams directly is removed, even if they meet the recommended rules.

### RetentionLabel

- When populated, the value is used to assign the retention label for the whole SharePoint site library, if this process fails the **team** will be archived, leaving the IT admin to resolve.
- Therefore the value must exactly match one of the available retention labels provision on your tenants SharePoint. This is a prerequisite for this feature, for more information [read the following](https://docs.microsoft.com/en-us/microsoft-365/compliance/labels?view=o365-worldwide).

### AzureSecurityGroup

- When populated, only users that belong to an Azure security group with a matching name (case sensitive) can use the template. If the user is not in a group with a matching name, the template will not be displayed in the list.
- If the field is empty, any logged in user can use the template.

> [Users can be assigned to security groups, and groups can be set up](../ManagingAzureSecurityGroups.md) in the Azure Portal.

### Channels

- An array of the channels that are added to a team created using the template.
- You can have multiple channels, or if you do not wish for any channels to be created this setting can be removed.

> The _General_ channel is automatically created by Microsoft Teams when a team is created. This means that every team you create, with or without a template will have a _General_ channel. It is also Microsoft Teams behaviour that this channel name, or description cannot be edited. CreateTeam templates behaviour reflects this by not allowing the _DisplayName_ and _Description_ to set. Tabs can however be added to the _General_ channel on team creation using CreateTeam templates.

- The channel settings are as follows:

#### DisplayName

- The name of the channel displayed in Teams

#### Description

- The name of the channel displayed in Teams

#### Tabs

- An array of tabs that are added to the channel when the team is created using the template.
- You can have multiple tabs, or if you do not wish for any tabs to be created this setting can be removed.
- There are 4 supported tab types:
  - Website
  - Word document
  - Excel document
  - PowerPoint document
- Different settings are required depending on the selected tab type, see below:

##### Website Tabs

- Type = Must be set to _website_
- DisplayName = The name of the tab displayed in Teams
- ContentUrl = The full address of the website to be displayed in the tab

> The Microsoft Team Web App will not render most websites inside a tab. This happens when the website has specified that it cannot be displayed inside another website. Teams handles this behaviour by displaying a _Go to site_ button which can be used to view the website in the browser directly.
>
> Website tabs display correctly in the Microsoft Teams client application.

##### Word, Excel or Powerpoint documents Tabs

> Document Tabs in Microsoft Teams displays documents that exist within Teams and SharePoint. This means that in order for CreateTeam to add a document tab the file must already exist in Teams and SharePoint.

- Type = Must be either _word_, _excel_ or _powerpoint_ depending on the tab type
- DisplayName = The name of the tab displayed in Teams
- FileName = The name of the file to be displayed in the tab, including the extension.
- DocumentUrl = The web address of the document when viewed in SharePoint.
- FolderUrl = The web address of the folder containing document when viewed in SharePoint.

> You can acquire the _DocumentUrl_ and the _FolderUrl_ by carrying out the following steps:
>
> 1. Navigate to the _Files_ tab where the required document is listed.
> 1. In the toolbar below the tabs select the button labelled _Open in SharePoint_. This will open a browser window displaying the same list of files, but in the SharePoint site instead of Teams.
> 1. The address of this page is what is required for the _FolderUrl_ setting. You can copy the address out of the address bar and paste it in the _FolderUrl_ for that tab.
> 1. Back in the SharePoint site, find the required file from the list. Open it, by clicking its name.
> 1. The address of this page is what is required for the _DocumentUrl_ setting. You can copy the address out of the address bar and paste it in the _DocumentUrl_ for that tab.
