SELECT COUNT(*)
  FROM [dbo].[Calls]
  WHERE StartDateTime > '2021-01-31 00:00' -- reporting window
  AND EndDateTime < '2021-02-07 00:00' -- reporting window
  AND Type = 1
