# Call

TWA Performance aggregates the data it collects about Teams calls in order to provide reporting insight.

## The `[dbo].[Calls]` table

When TWA Performance receives data about a Call from Microsoft Graph API, the call is actually split into several "segments" and "streams".
TWA Performance saves this data as-is, but also populates the `[dbo].[Calls]` table with a single aggregated row for each call.
This takes account of all the segments and streams to provide an overall picture for the call.

> See  [Definitions](TWAPerformance/Defintions.md)

|Column|Type|Description|
|---|---|---|
| [CallId] | UNIQUEIDENTIFIER NOT NULL | The indentifier for the call given by Microsoft |
| [_HashOrganiserUserId] | NVARCHAR(64) NULL | An anonymised version of the User ID for joining to our other tables |
| [OrganiserUserId] | NVARCHAR(450) NULL | A user GUID from AD, a unknown identifier, a phone number or mail address. This may be obfuscated in [anonymisation](TWAPerformance/Anonymisation.md) is enabled.  |
| [OrganiserUserType] | TINYINT NULL | Classification of the organiser for reporting: 0 Unknown, 1 Internal, 2 External, 3 Pstn |
| [Version] | TINYINT NOT NULL | The version of the data given by Microsoft |
| [Type] | TINYINT NOT NULL | Classification of the call for reporting: 0 Unkown, 1 P2P, 2 Conference |
| [StartDateTime] | DATETIME2 NOT NULL | When the call started |
| [EndDateTime] | DATETIME2 NOT NULL | When the call finished |
| [AudioSessionMinutes] | INT NOT NULL | The sum of the durations of all segments with audio streams (media label: `main-audio`) |
| [VideoSessionMinutes] | INT NOT NULL | The sum of the durations of all segments with video streams (media label: `main-video`, `main-video1` ... `main-video9`) |
| [AppShareSessionMinutes] | INT NOT NULL | The sum of the durations of all segments with app sharing streams (media label: `applicationsharing-video`) |
| [TotalSessionMinutes] | INT NOT NULL | The sum of the durations of all segments |
| [VoipParticipants] | INT NOT NULL | A count of non-phone participants excluding service endpoints |
| [PstnParticipants] | INT NOT NULL | A count of phone participants |
| [TotalParticipants] | INT NOT NULL | Both of the above added together |
| [_LastUpdatedDateTime] | DATETIME2 NOT NULL | When TWA Performance last updated this row |
