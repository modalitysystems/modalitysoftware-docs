SELECT COUNT(*)
  FROM [dbo].[Calls]
  WHERE StartDateTime > '2021-01-31 00:00' --report window
  AND EndDateTime < '2021-02-07 00:00'  --report window
  AND Type = 2
  AND OrganiserUserId IN (SELECT Id FROM Users)
