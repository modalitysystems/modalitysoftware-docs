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

This test is used to spot check that user attributes, including extended user attributes, are correctly collected from Microsoft Graph.

Provide the alias of a sample user and run the following PowerShell

```
# Use Script at your own risk

# Connect to Microsoft Teams with PowerShell before running this script

#input correct user UPN
$user = "peter.test@modalitysystems.com"

Get-AzureADUser -SearchString $user | Select-Object DisplayName,Department,Country
Get-AzureADUser -SearchString $user | Select -ExpandProperty ExtensionProperty
```

The script will output 2 tables of information. The first will contain the Display Name, Department and Country of the specified user; the second will contain a list of all extended attributes.

Run the following SQL, using the same user alias:

```
DECLARE $user varchar(100) = 'peter.test@modalitysystems.com'

SELECT [Id]
      ,[GivenName]
      ,[Surname]
      ,[Department]
      ,[Country]
      ,[CustomAttribute1]
      ,[CustomAttribute2]
      ,[CustomAttribute3]
      ,[CustomAttribute4]
      ,[CustomAttribute5]
      ,[CustomAttribute6]
      ,[CustomAttribute7]
      ,[CustomAttribute8]
      ,[CustomAttribute9]
      ,[CustomAttribute10]
  FROM [billing].[User] u
  INNER JOIN [billing].UserPropertiesDaily upd on u.Id = upd.UserId
  WHERE u.[UserPrincipalName] = $user
  AND  upd.Date = convert(date,getutcdate())
  ```

A single row should be returned. Compare the data in this row with the data returned from PowerShell.

## Comparing AD Licenses PowerShell to SQL

This test is used to spot check that user license information is correctly imported. 

Run the following PowerShell to list all assigned licenses for a specified user:

```
$userUPN="peter.test@modalitysystems.com"
$licensePlanList = Get-AzureADSubscribedSku
$userList = Get-AzureADUser -ObjectID $userUPN | Select -ExpandProperty AssignedLicenses | Select SkuID 
$userList | ForEach { $sku=$_.SkuId ; $licensePlanList | ForEach { If ( $sku -eq $_.ObjectId.substring($_.ObjectId.length - 36, 36) ) { Write-Host $_.SkuPartNumber } } }

```

Run the following SQL, passing in the same user alias:

```
DECLARE $user varchar(100) = 'peter.test@modalitysystems.com'

SELECT
	us.Id AS UserId
	,ms.ServicePlanId AS SkuId
	,ms.ServicePlanName AS PartNumber
	,us.[Date]
	,us.AssignedFrom
FROM
	billing.[User] u
	JOIN billing.UserSkusLog us on u.Id = us.UserId
	JOIN billing.MicrosoftServicePlans ms ON us.SkuId = ms.ServicePlanId
WHERE u.UserPrincipalName = 'tom.morgan@modalitysystems.com'
AND  us.Date = convert(date,getutcdate())
GO

```

Note that TWA Billing Module does not import *all* licenses, only ones relavent to billing. When comparing license counts, discard any licenses which do not apply to billing.

# Comparing SQL to Power BI

## Total Licences of each type

Run the following SQL to output a total number of assigned users for each license, scoped to yesterday (to allow for PowerBI refresh)

```
SELECT	
	ms.ServicePlanName AS PartNumber
	,Count(*)
FROM
	
	 billing.UserSkusLog us 
	JOIN billing.MicrosoftServicePlans ms ON us.SkuId = ms.ServicePlanId
WHERE 
  us.Date = convert(date,getutcdate())
GROUP BY ms.ServicePlanName
GO
```



## Total cost for a month
to be completed


## Number of users of Custom Attribute 1

Run the following SQL to output a total number of users assgigned to each discrete value of Custom Attribute 1, scoped to yesterday (to allow for PowerBI refresh)

```
SELECT	
	upd.CustomAttribute1
	,Count(*)
FROM
	
	billing.[User] u
	INNER JOIN billing.UserPropertiesDaily upd on u.Id = upd.UserId
WHERE 
  upd.Date = convert(date,getutcdate())
GROUP BY upd.CustomAttribute1
GO
```
