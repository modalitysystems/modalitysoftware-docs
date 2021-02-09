```
/****** Script for SelectTopNRows command from SSMS  ******/

declare @userId nvarchar(36) 

select top (1) @userId = cast(Id as nvarchar(36)) from dbo.Users where lower(UserPrincipalName) = 'rob.taylor@modalitysystems.com' -- Enter UPN here - lower case

SELECT  [CallId]
      ,[_HashOrganiserUserId]
      ,[OrganiserUserId]
      ,[Version]
      ,[Type]
      ,[StartDateTime]
      ,[EndDateTime]
      ,[AudioSessionMinutes]
      ,[VideoSessionMinutes]
      ,[AppShareSessionMinutes]
      ,[TotalSessionMinutes]
      ,[VoipParticipants]
      ,[PstnParticipants]
      ,[TotalParticipants]
  FROM [dbo].[Calls]
  where [OrganiserUserId] = @userid
  And [EndDateTime] > getutcdate() - 1

SELECT  [CallId]
      ,[Version]
      ,[CallType]
      ,[SegmentId]
      ,[SegmentStart]
      ,[SegmentEnd]
      ,[StreamId]
      ,[StreamStart]
      ,[StreamEnd]
      ,[_HashOrganiserUserId]
      ,[_HashUserId]
      ,[OrganiserUserId]
      ,[UserId]
      ,[UserType]
      ,[TenantId]
      ,[StreamDirection]
      ,[MediaType]
  FROM [dbo].[Streams]
  where ([OrganiserUserId] = @userId Or UserId = @userid)
  And [SegmentEnd] > getutcdate() - 1
```