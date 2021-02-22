SELECT COUNT(DISTINCT SegmentId)
  FROM [dbo].[Streams]
    WHERE SegmentStart > '2021-01-31 00:00' -- reprting window
  AND SegmentEnd < '2021-02-07 00:00' -- reprting window
  AND CallType = 2
  AND UserId IN (SELECT Id FROM Users)
