SELECT SUM(TotalConferenceCount) as TotalConferenceCount
  FROM [aggregates].[ConferenceMinsByUsers]
  WHERE [Date] > '2021-03-02 00:00' --reporting window
  AND [Date] < '2021-03-09 00:00' --reporting window
  AND [_HashUserId] IN (SELECT [_HashUserId] FROM Users)
