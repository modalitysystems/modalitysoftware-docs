# Single Owner Reminder

This scenario causes a message to be sent to each team owner for a team where they are the only Owner. It includes the General Channel Id for deep linking to a team if required.

## Required Settings

| Setting | Value |
| --- | --- |
| StoredProcedureName | automation.SpGetTeamOwnerCountsWithChannelId |
| IsSentOnce | False |

## SQl Query

```
CREATE PROCEDURE [automation].[SpGetTeamOwnerCountsWithChannelId]
AS
BEGIN

	DECLARE @MaximumNumberOfOwners INT = 1

	SELECT * FROM (
		SELECT 
			teams.[TeamID]
			,towners.[UserID] AS UserID
			,teams.[DisplayName] AS TeamDisplayName
			,teams.[LastActivity]
			,towners.[UserName] AS OwnerDisplayName
			,towners.[Mail] AS UserMailAddress
			,COUNT(others.[UserID]) AS TotalOwnerCount 
			,c.Id as GeneralChannelId
			,GETUTCDATE() as ScenarioRunDateTime
		FROM automation.Teams teams
			JOIN automation.TeamUsers towners ON towners.[TeamID] = teams.[TeamID]
			JOIN automation.TeamUsers others ON others.[TeamID] = teams.[TeamID]
			Join dbo.Channels c on c.TeamId = teams.TeamID And c.DisplayName = 'General'
		WHERE 
			teams.[IsArchived]=0
			AND towners.[UserType] = 'Owner' 
			AND others.[UserType] = 'Owner'
		GROUP BY 
			teams.[TeamID]
			,teams.[DisplayName]
			,teams.[LastActivity]
			,towners.[UserID]
			,towners.[UserName]
			,towners.[Mail]
			,c.Id
	) AS teamOwners
	WHERE teamOwners.[TotalOwnerCount] <= @MaximumNumberOfOwners
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
        "TotalOwnerCount" : 1,
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
        "TotalOwnerCount" : 2,
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
                    "text": "TotalOwnerCount: ${Value.TotalOwnerCount}"
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
