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

## Comparing Organisation-level license counts and assignment levels

This test is used to ensure that the organisational-level totals of license and total numbers assigned are corectly imported.

This information can be viewed via the Microsoft 365 Admin Center (https://admin.microsoft.com/AdminPortal/Home#/licenses). This provides a list of all licenses, the total available and the total assigned.

Teamwork Analytics takes this data from Microsoft Graph. The specific call made is: https://graph.microsoft.com/v1.0/subscribedSkus. Use [Graph Explorer](https://developer.microsoft.com/en-us/graph/graph-explorer) to verify the numbers of available and assigned licenses. The values shown here should match those shown in the Microsoft 365 Admin Center.

Run the following SQL to list all imported license information:

```
select * from [billing].[SubscribedSkus] where ValidTo is null
```

Compare the number of enabled and assigned licenses for each license type.  Some licenses and their SkuPartNumbers are:

- MCOPSTN1 - Microsoft 365 Domestic Calling Plan
- MEETING_ROOM - Meeting Room
- MCOPSTNC - Communications Credits
- ENTERPRISEPREMIUM_NOPSTNCONF - Office 365 E5 without Audio Conferencing
- MCOMEETADV - Microsoft 365 Audio Conferencing

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
Use the linked PowerShell to get a list of users with a specific licence. The script will collect users with the license type specified in the variable at the top of the file.

- Teams Licence (TEAMS1)                                    57ff2da0-773e-42df-b2af-ffb7a2317929
- Comms Credits (MCOPSTNC)                                  505e180f-f7e0-4b65-91d4-00d670bbd18c
- Microsoft 365 Phone System (MCOEV)                        4828c8ec-dc2e-4779-b502-87ac9ce28ab7
- Microsoft 365 Audio Conferencing (MCOMEETADV)             3e26ee1f-8a5f-4d52-aee2-b81ce45c8f40
- Audio Conf PPM (MCOMEETACPEA)	                            bb038288-76ab-49d6-afc1-eaa6c222c65a

https://github.com/tomarbuthnot/PowerShell/blob/master/Get-Microsoft365-AssignedServicePlan-Count.ps1


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
