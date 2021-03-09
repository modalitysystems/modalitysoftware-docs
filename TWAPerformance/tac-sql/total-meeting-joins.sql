  SELECT COUNT(DISTINCT SegmentId)
  FROM [dbo].Calls c
  JOIN [dbo].[Segments] s on s.CallId = c.CallId 
    WHERE s.StartDateTime > '2021-01-31 00:00' -- reprting window
  AND s.EndDateTime < '2021-02-07 00:00' -- reprting window
  AND c.Type = 2
  AND (s.CalleeId IN (SELECT Id FROM Users) OR s.CallerId IN (SELECT Id FROM Users))
