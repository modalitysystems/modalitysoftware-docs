# Tax Advice Teams Reminder

This scenario causes a message to be sent to each team owner listing all teams which they own. It is a customer specific scenario to only send to owners who are part of a "Tax" team, which was denoted by CustomAttribute8.

## Required Settings

| Setting | Value |
| --- | --- |
| StoredProcedureName | automation.BotTaxTeamAdviceNotification |
| IsSentOnce | False |

## SQl Query

> Replace "[TaxTeam]" with the actual value of the AD attribute as required

```
CREATE PROCEDURE [automation].[BotTaxTeamAdviceNotification]
AS
BEGIN

SELECT 
		teams.[TeamID]
		,towners.[UserID] AS UserID
		,teams.[DisplayName] AS TeamDisplayName
		,teams.[LastActivity]
		,towners.[UserName] AS OwnerDisplayName
    ,towners.[Mail] AS UserMailAddress
		,c.Id as GeneralChannelId
		,GETUTCDATE() as ScenarioRunDateTime
	FROM automation.Teams teams
		JOIN automation.TeamUsers towners ON towners.[TeamID] = teams.[TeamID]
		JOIN dbo.Users users ON towners.[UserID] = users.[Id]
		Join reporting.UserProperties up on users.Id = up.UserId
		Join dbo.Channels c on c.TeamId = teams.TeamID And c.DisplayName = 'General'
	WHERE 
		teams.[IsArchived] = 0 
		AND up.CustomUserAttribute8 = '[TaxTeam]'
	GROUP BY
		teams.[TeamID]
		,teams.[DisplayName]
		,teams.[LastActivity]
		,towners.[UserID]
		,towners.[UserName]
    ,towners.[Mail]
		,c.Id

END
GO

```

## Example Data Model

```
{
  "RowsWithAdditionalProperties": [
    {
      "Value": {
        "TeamID": "TeamID",
        "TeamDisplayName": "Team 1 Name",
        "LastActivity": "2019-10-31T22:36:04Z",
        "OwnerDisplayName": "Name",
        "GeneralChannelId": "Channel Id",
        "ScenarioRunDateTime": "2021-04-13T08:06:26Z"
      }
    },
    {
      "Value": {
        "TeamID": "Team Id",
        "TeamDisplayName": "Team 2 Name",
        "LastActivity": "2019-07-09T13:45:19Z",
        "OwnerDisplayName": "Name",
        "GeneralChannelId": "Channel Id",
        "ScenarioRunDateTime": "2021-04-13T08:06:26Z"
      }
    }
  ]
}
```

## Example Card Template

> Basic format to be customised

```
{
    "type": "AdaptiveCard",
    "body": [
        {
            "type": "Container",
            "$data": "${RowsWithAdditionalProperties}",
            "items": [
			    {
                    "type": "TextBlock",
                    "text": "New Row",
                    "weight": "Bolder"
                },
                {
                    "type": "TextBlock",
                    "text": "TeamID: ${Value.TeamID}"
                },
                {
                    "type": "TextBlock",
                    "text": "TeamDisplayName: ${Value.TeamDisplayName}"
                },
                {
                    "type": "TextBlock",
                    "text": "LastActivity: ${Value.LastActivity}"
                },
                {
                    "type": "TextBlock",
                    "text": "OwnerDisplayName: ${Value.OwnerDisplayName}"
                },
                {
                    "type": "TextBlock",
                    "text": "GeneralChannelId: ${Value.GeneralChannelId}"
                },
                {
                    "type": "TextBlock",
                    "text": "ScenarioRunDateTime: ${Value.ScenarioRunDateTime}"
                }
            ]
        }
    ],
    "$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
    "version": "1.2"
}
```