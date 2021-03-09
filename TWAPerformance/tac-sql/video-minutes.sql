SELECT  DATEDIFF(MINUTE, s.StartDateTime, s.EndDateTime)
  FROM [dbo].[Segments] s
  JOIN [dbo].[MediaStreams] ms on ms.CallId = s.CallId and ms.SegmentId = s.SegmentId
    WHERE s.StartDateTime > '2021-03-02 00:00' --reporting window
  AND s.EndDateTime < '2021-03-09 00:00' --reporting window
  AND (s.CalleeId IN (SELECT Id FROM Users) OR s.CallerId IN (SELECT Id FROM Users))
  AND ms.MediaLabel = 0
  AND ms.PacketUtilization > 0
  GROUP BY s.StartDateTime, s.EndDateTime, s.CalleeId, s.CallerId
