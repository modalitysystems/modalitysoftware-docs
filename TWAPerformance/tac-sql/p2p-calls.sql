SELECT COUNT(*)
  FROM [dbo].Calls c
    WHERE c.StartDateTime > '2021-03-02 00:00' --reporting window
  AND c.EndDateTime < '2021-03-09 00:00' --reporting window
  AND c.Type = 1
