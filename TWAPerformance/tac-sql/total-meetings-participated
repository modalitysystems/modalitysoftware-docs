SELECT COUNT(*)
  FROM [dbo].[Streams]
    WHERE SegmentStart > '2021-01-31 00:00' -- report window
  AND SegmentEnd < '2021-02-07 00:00' -- report window
  AND CallType = 2
  AND UserId IN (SELECT Id FROM Users)
  GROUP BY CallId, UserId
