
  SELECT COUNT(DISTINCT c.CallId)
  FROM [dbo].Calls c
  JOIN [dbo].[Segments] s on s.CallId = c.CallId 
    WHERE s.StartDateTime > '2021-03-02 00:00' --reporting window
  AND s.EndDateTime < '2021-03-09 00:00' --reporting window
  AND s.CalleeId IN (SELECT Id FROM Users) OR s.CallerId IN (SELECT Id FROM Users)
  AND c.Type = 1
