SELECT COUNT(*)
  FROM [dbo].[Calls]
  WHERE StartDateTime > '2021-03-02 00:00' --report window
  AND EndDateTime < '2021-03-09 00:00'  --report window
  AND Type = 2
  AND OrganiserUserId IN (SELECT Id FROM Users)
