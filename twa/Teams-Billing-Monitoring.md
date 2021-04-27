# TWA Billing Monitoring Scripts

## The following SQL Statements can be used by monitoring software to help identify potential problems with the operation of the TWA Billing service.

For the 4 selects, 0 = bad, 1+ = good

```
SELECT TOP 10 * FROM [billing].[CurrentLicenses]
-- Expected behavoir: This statement should return 1 or more rows. If 0 rows are returned, this is indicative of a problem.

SELECT TOP (10) * FROM [billing].[UserPropertiesDaily] WHERE [date] > getdate()-3
-- Expected behavoir: This statement should return 1 or more rows. If 0 rows are returned, this is indicative of a problem.

SELECT TOP (10) * FROM [billing].[UserSkuDaily] WHERE [date] > getdate()-3
-- Expected behavoir: This statement should return 1 or more rows. If 0 rows are returned, this is indicative of a problem.

SELECT TOP (10) * FROM [billing].[PstnCallData] WHERE [Start Time] > getdate()-7
-- Expected behavoir: This statement should return 1 or more rows. If 0 rows are returned, this is indicative of a problem.
```




For human Reference:

SELECT LastRun,CurrentRun FROM [billing].[RunData]
-- This gives information about the last succesful run, and any current run or previously started run progress. It can be useful in monitoring last known good run

