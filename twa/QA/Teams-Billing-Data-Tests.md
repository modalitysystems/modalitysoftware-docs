Modality Systems perform extensive tests to ensure data is gathered correctly, but there can sometimes be per tenant or environmental factors that can influence quality and completeness of data returned. Examples might be a specific tenant issue or your organisations SQL, collector VM or proxy or firewall having issues.

Should you want to, here are a set of quality assurance tests you can perform to validate the data collected against Microsoft native reporting. To separate potential issues and to aid in diagnosis, we compare Microsoft to TWA Billing SQL, and seperately, TWA Billing SQL to Power BI.

# Comparing Microsoft Data to TWA Billing SQL
These tests focus on comparing Microsoft native reporting/data to TWA Billing SQL and ignore any variables of Power BI reports or Power BI refresh time.

## Comparing Call Data CSV input to SQL
This test compares Microsoft's CSV export of PSTN call data for the last 28 days to TWA Billing SQL.

Download the Last 28 Days PSTN call data CSV file from the Teams Admin centre. Make a note of earliest and latest StartTime of calls in the file.

Make a note of the total number of calls. Ensure that this CSV file (or another export file covering the same date period) has already been imported into the TWA Billing database.

Validation SQL Query

To run this SQL, first provide values for @startTime and @endTime, using the earlist and latest StartTime of calls from the CSV file

```
DECLARE @startTime char(28) = '2020-07-01T00:00:00.0000000Z'
DECLARE @endTime char(28) = '2020-07-28T00:00:00.0000000Z'

--  Do not edit below this line, these values are calculated from the ones above --

DECLARE @startTimeFormatted datetime = convert(datetime,SUBSTRING(@startTime,0,len(@startTime)-4) + 'Z',127)
DECLARE @endTimeFormatted datetime = convert(datetime,SUBSTRING(@endTime,0,len(@startTime)-4) + 'Z',127)

SELECT TOP (1000) [Id]
      ,[UsageId]
      ,[CallId]     
      ,[StartTimeUtc]
      ,[EndTimeUtc]
      ,[FirstImported]
      ,[LastImported]
      ,[FirstSeenIn]
      ,[LastSeenIn]
  FROM [billing].[PstnCalls]
  WHERE [StartTimeUtc] between @startTimeFormatted and @endTimeFormatted
  ORDER BY [StartTimeUtc]

```

The number of rows returned returned should be consistant with the number of rows in the CSV file.

## Comparing AD Attributes PowerShell to SQL

## Comparing AD Licenses PowerShell to SQL


# Comparing SQL to Power BI

## Total Licences of each type

## Total cost for a month

## Number of users of X Attribute

