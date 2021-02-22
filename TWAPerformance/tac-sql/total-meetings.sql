SELECT COUNT(DISTINCT CallId)
  FROM [dbo].[Streams]
    WHERE SegmentStart > '2021-01-31 00:00' -- reporting windows
  AND SegmentEnd < '2021-02-07 00:00' -- reporting windows
  AND CallType = 2
