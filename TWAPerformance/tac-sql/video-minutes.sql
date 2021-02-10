SELECT  DATEDIFF(MINUTE, SegmentStart, SegmentEnd)
  FROM [dbo].[Streams]
    WHERE SegmentStart > '2021-01-31 00:00' --reporting window
  AND SegmentEnd < '2021-02-07 00:00' --reporting window
  AND UserId IN (SELECT Id FROM Users)
  AND MediaType = 2
  GROUP BY SegmentId, SegmentStart, SegmentEnd
