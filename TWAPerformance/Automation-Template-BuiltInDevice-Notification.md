# Built In Device Teams Reminder

This scenario sends a message to a teams user whenever the use of an unsupported/uncertified mic or speakers was used in a call in the last week.

## Required Settings 

| Setting | Value |
| --- | --- |
| StoredProcedureName | automation.SpBuiltInDeviceTeamsReminderNotifications |
| IsSentOnce | False |

## SQL Query

> Add/Change/Remove any of the `LIKE` case statements to match anything you class as Built In / Default.

```SQL
CREATE PROCEDURE [automation].[SpBuiltInDeviceTeamsReminderNotifications]
AS
BEGIN

SELECT
	U.[Id] AS [UserId],
	U.[Mail] AS [UserMailAddress],
	COUNT(II.[CallId]) AS [CallCount],
	SUM(II.[HasUncertifiedCaptureDeviceInCall]) AS [CallsUsingBuiltInMicCount],
	ROUND(SUM(II.[HasUncertifiedCaptureDeviceInCall]) / CONVERT(FLOAT, COUNT(II.[CallId])) * 100, 2) AS [CallsUsingBuiltInMicPercentage],
	SUM(II.[HasUncertifiedRenderDeviceInCall]) AS [CallsUsingBuiltInSpeakersCount],
	ROUND(SUM(II.[HasUncertifiedRenderDeviceInCall]) / CONVERT(FLOAT, COUNT(II.[CallId])) * 100, 2) AS [CallsUsingBuiltInSpeakersPercentage],
	ROUND(AVG(II.[MinScore]), 2) AS [AverageModalityScore]
FROM
	( SELECT
		I.[CallId],
		I.[HashUserId],
		CASE WHEN SUM(I.[HasUncertifiedCaptureDeviceInStream]) > 0 THEN 1 ELSE 0 END AS [HasUncertifiedCaptureDeviceInCall],
		CASE WHEN SUM(I.[HasUncertifiedRenderDeviceInStream]) > 0 THEN 1 ELSE 0 END AS [HasUncertifiedRenderDeviceInCall],
		MIN(I.[MinScore]) AS [MinScore]
	FROM
		( SELECT
			C.[CallId],
			CASE WHEN MD.[StreamDirection] = 0 THEN S.[_HashCallerId] ELSE S.[_HashCalleeId] END AS [HashUserId],
			CASE WHEN MD.[StreamDirection] = 0 THEN S.[CallerUserType] ELSE S.[CalleeUserType] END AS [UserType],
			CASE WHEN
				MD.[CaptureDeviceName] LIKE '%realtek%' OR
				MD.[CaptureDeviceName] LIKE '%built-in%' OR
				MD.[CaptureDeviceName] LIKE '%default input%'
			THEN 1 ELSE 0 END AS [HasUncertifiedCaptureDeviceInStream],
			CASE WHEN
				MD.[RenderDeviceName] LIKE '%realtek%' OR
				MD.[RenderDeviceName] LIKE '%built-in%' OR
				MD.[RenderDeviceName] LIKE '%default output%'
			THEN 1 ELSE 0 END AS [HasUncertifiedRenderDeviceInStream],
			( SELECT MIN(S) FROM (VALUES (MS.[PacketLossRateScore]), (MS.[JitterScore]), (MS.[RoundTripTimeScore])) AS Score(S) ) AS [MinScore]
		FROM
			[dbo].[Calls] C
			JOIN [dbo].[Segments] S ON S.[CallId] = C.[CallId]
			JOIN [dbo].[MediaDevices] MD ON MD.[CallId] = C.[CallId] AND MD.[SegmentId] = S.[SegmentId]
			JOIN [dbo].[MediaStreams] MS ON MS.[CallId] = C.[CallId] AND MS.[SegmentId] = S.[SegmentId]
				AND MS.[MediaLabel] = MD.[MediaLabel] AND MS.[StreamDirection] = MD.[StreamDirection]
		WHERE
			CONVERT(DATE, C.[StartDateTime]) >= CONVERT(DATE, DATEADD(DAY, -7, GETUTCDATE()))
		) I
	WHERE
		I.[UserType] = 1
	GROUP BY
		I.[CallId],
		I.[HashUserId]
	) II
	JOIN [dbo].[Users] U ON U.[_HashId] = II.[HashUserId]
WHERE
	U.[_Deleted] = 0
	AND U.[_Anonymised] = 0
GROUP BY
	U.[Id],
	U.[Mail]
HAVING
	SUM(II.[HasUncertifiedCaptureDeviceInCall]) > 0 OR 
	SUM(II.[HasUncertifiedRenderDeviceInCall]) > 0

END
GO
```

## Example Data Model

```
{
  "RowsWithAdditionalProperties": [
    {
      "Value": {
        "CallCount": "35",
        "CallsUsingBuiltInMicCount": "2",
        "CallsUsingBuiltInMicPercentage": "5.71",
        "CallsUsingBuiltInSpeakersCount": "29",
        "CallsUsingBuiltInSpeakersPercentage": "82.86",
        "AverageModalityScore": "9.32"
      }
    }
  ]
}
```

## Example Card Template

> Basic format to be customised

```
```