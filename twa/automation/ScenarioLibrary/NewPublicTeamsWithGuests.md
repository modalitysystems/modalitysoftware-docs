# New Public Teams without Guests

This scenario causes a message to be sent to each team owner when a public team without guests is created (or a team becomes public). It is only sent once. It will be triggered both when a public team is created, and if a team is switched from public to private.

## Required Settings

| Setting | Value |
| --- | --- |
| StoredProcedureName | automation.SpBotNewPublicTeamsWithoutGuestsNotifications |
| IsSentOnce | True |

## SQl Query

```
CREATE PROCEDURE [automation].[SpBotNewPublicTeamsWithoutGuestsNotifications]
AS
BEGIN

SELECT 
		t.[Id] As TeamId
		,u.[Id] As UserID
		,t.[DisplayName] As TeamDisplayName
		,u.[Mail] As UserMailAddress
		,t.[LastUpdatedDateTime] AS TeamLastUpdated
		,t.[CreatedDateTime] AS CreatedDateTime
		,c.Id as GeneralChannelId
		,GETUTCDATE() as ScenarioRunDateTime
	FROM dbo.Teams t
		JOIN automation.[TeamUsers] tu on tu.[TeamId] = t.[Id]
		JOIN automation.[TeamUsers] tg on tg.[TeamId] = t.[Id]
		JOIN dbo.Users u on tu.[UserId] = u.[Id]
		Join dbo.Channels c on c.TeamId = t.Id And c.DisplayName = 'General'
	WHERE t.[Visibility] = 'Public'
		AND tu.[UserType] = 'Owner'
		AND tg.[DataType] <> 'Guest'
		AND t.[CreatedDateTime] >= cast(GETUTCDATE() - 7 as date)
		AND t.Deleted = 0
		AND t.IsArchived = 0

	GROUP BY
		t.[Id]
		,t.[DisplayName]
		,u.[Id]
		,u.[Mail]
		,t.[LastUpdatedDateTime]
		,t.[CreatedDateTime]
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
        "TeamId": "Team Id",
        "TeamDisplayName": "Team Name",
        "TeamLastUpdated": "2021-04-13T07:55:30Z",
        "CreatedDateTime": "2021-04-07T14:24:42Z",
        "GeneralChannelId": "Channel Id",
        "ScenarioRunDateTime": "2021-04-13T07:55:56Z"
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
                    "text": "TeamID: ${Value.TeamID}"
                },
                {
                    "type": "TextBlock",
                    "text": "TeamDisplayName: ${Value.TeamDisplayName}"
                },
                {
                    "type": "TextBlock",
                    "text": "TeamLastUpdated: ${Value.TeamLastUpdated}"
                },
                {
                    "type": "TextBlock",
                    "text": "CreatedDateTime: ${Value.CreatedDateTime}"
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