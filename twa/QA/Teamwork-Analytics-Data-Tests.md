

# Introduction

Gathering data from Microsoft Graph API is complicated. "Microsoft Graph" is not a single API; there are different Graph API endpoints for different data types (per user usage information, team information, file information). The different endpoints return data differently and have different throttling limits.

Modality Systems perform extensive tests to ensure data is gathered correctly, but there can  sometimes per tenant or environmental factors that can influence quality and completeness of data returned. Examples might be a specific tenant issue or your organisations SQL, collector VM or proxy or firewall having issues.

Should you want to, here are a set of quality assurance tests you can perform to validate the data collected against Microsoft native reporting.



# Understanding Graph API Data Collection and Microsoft Data Lag

## Per UPN Microsoft Teams user usage reports

Microsoft's Graph reporting API endpoints, the API endpoints that gives per user Microsoft Teams usage information (E.g. for each UPN the number of private chats, team chats, meetings attended and calls made for a period) are typically ~48 hours behind the current time.

Therefore data collected from the API on 15th of the month will reflect user usage up to 13th of the month.

There are two other time overheads to consider when comparing reporting data:

- The time is takes to collect the data a and put it into SQL. This is variable depending on the number of users/amount of data to collect. It can be as little as an hour to ~24 hours for 300,000 users.

- The delay between data inbeing in SQL and being reported on in PowerBI.com reports. Typically we recommend regular scheduled updates of Power BI data throughout the day. PowerBI.com reports on cached data, it is not a live report from the SQL database.

## Collaboration Team information - Team name, owners, members, guests

The Graph API that gives us "team" information  (team names, members, guests, owners) also has a delay. typically less than 48 hours, but the same API to SQL and SQL to Power BI delay exists.

## How API data delay impacts data testing

When testing for data accuracy it is important to take these delays into account.

Below we have outlined some checks you can perform to validate data is accurate.

There are two types of test. 

- **Control Tests** allow you to completely control the variables and make an exact comparison.
- **Data Comparison Tests** compare Microsoft native reports to Teamwork Analytics SQL data and Power BI reports, due to variables on how Microsoft present the data this can be harder to compare.

We have defined the best approaches to comparison but welcome any feedback.

It is recommended to Perform all SQL queries from an account with Read Only access and all PowerShell with Global Reader (read only access) to avoid any risk of data or config changes.

# Comparing Microsoft Native Reporting and Teamwork Analytics SQL Database

These tests focus on comparing Microsoft native reporting/data to Teamwork Analytics SQL and ignore any variables of Power BI reports or Power BI refresh time.

## Control Test - Team Information (Owners, members, guests, channel count)

Create at least 2 control teams and once setup, do not change any variables until you have confirmed they are correct in SQL and Power BI. This will  mean setting them up and checking them 72 hours later

Example Starting Point:

Create a Private Teams with 5 channels, 2 Owners and 2 members

Create a Public Team with 3 Channels, 1 owner and 1 member

From here variables you could change
  - add or remove channels
  - add or remove members or owners
  - delete team
  - change team from public to private

Please write down changes and date of change.

After 48 hours you can check the data is the same in the database with this SQL query

#### Validation SQL Query - Control Test Team Information

```
-- Version Number do not change
declare @VersionNo nvarchar(20) = '2020-06-11'

--Change the Team Name here (note it has to be exact to match the database)
declare @TeamName nvarchar(400) = 'Team Display Name'

Select	t.Id as TeamId
		,DisplayName as TeamName
		,Visibility
		,IsArchived
		,(SELECT COUNT(*) FROM dbo.Channels c where c.TeamId = t.Id) as Channels
		,SUM(CASE WHEN tu.UserType = 'Owner' AND CHARINDEX('#EXT#', u.UserPrincipalName) = 0 then 1 else 0 end) as Owners
		,SUM(CASE WHEN tu.UserType = 'Member' AND CHARINDEX('#EXT#', u.UserPrincipalName) = 0 then 1 else 0 end) as Members
		,SUM(CASE WHEN  CHARINDEX('#EXT#', u.UserPrincipalName) > 0 then 1 else 0 end) as Guests
		,GETUTCDATE() as [ExecutionDate]
		,@VersionNo as VersionNo
FROM	dbo.TeamUsers tu
JOIN	dbo.Users u on tu.UserId = u.Id
JOIN	dbo.Teams t on tu.TeamId = t.Id
WHERE	tu.Deleted = 0
AND		LOWER(t.DisplayName) = LOWER(@TeamName)
AND		u.Deleted = 0
AND		u.[Enabled] = 1
Group By
	t.Id
	,DisplayName
	,Visibility
	,IsArchived

Select	t.Id as TeamId
		,DisplayName as TeamName
		,u.UserPrincipalName
		,CASE WHEN tu.UserType = 'Owner' AND CHARINDEX('#EXT#', u.UserPrincipalName) = 0 then 1 else 0 end as IsOwner
		,CASE WHEN tu.UserType = 'Member' AND CHARINDEX('#EXT#', u.UserPrincipalName) = 0 then 1 else 0 end as IsMember
		,CASE WHEN  CHARINDEX('#EXT#', u.UserPrincipalName) > 0 then 1 else 0 end as IsGuest
		,GETUTCDATE() as [ExecutionDate]
		,@VersionNo as VersionNo
FROM	dbo.TeamUsers tu
JOIN	dbo.Users u on tu.UserId = u.Id
JOIN	dbo.Teams t on tu.TeamId = t.Id
WHERE	tu.Deleted = 0
AND		u.Deleted = 0
AND		u.[Enabled] = 1
AND		LOWER(t.DisplayName) = LOWER(@TeamName)
```



## Comparison Test 01 - Tenant Total user usage for 30 days

This test compares Microsoft's portal.office.com report of 30 days

Download the per user 30 usage excel report from https://portal.office.com/adminportal/home#/reportsUsage/TeamsUserActivity

Sum the columns for Team Chat Message Count, Private Chat Message Count, Call Count, Meeting Count. 

Note meeting count is meetings attended per user.

The file name of the excel report gives you the time you pulled the report. Column 1 gives you the date up until which Microsoft have given you the usage data. These dates are different. Microsoft native reporting is also typically around 48 hours behind current date.

Allow around a day for the same usage information to be collected and stored in TWA SQL. Then input the data from Column 1 into the SQL query and it will sum the same previous 30 days of usage information.

The SQL query will only complete once SQL has some data for the day after this date. That way we know the data for the data in question and previous 30 days including that date has been reported by Microsoft Graph API. This avoids the test completing with partial data for that day.

E.g. If you ask for ask for 30 days backwards from 17th, query will only work if we have at least some records for the 18th.

#### Validation SQL Query - Comparison Test 01

```sql
-- Version Number do not change
declare @VersionNo nvarchar(20) = '2020-06-11'

-- Configure the Date Value here;
declare @30DaysUpToDate date = '2020-06-08'


IF(@30DaysUpToDate > dateadd(day, -1, (SELECT MAX(ReportDate) as LatestDate from [dbo].[DailyActivityUserDetails])))
	RAISERROR('You have selected a date more recent than the data collected by Teamwork Analytics', 18, 1)


SELECT		@30DaysUpToDate As ReportDate
			,SUM(D.[TeamChatMessageCount]) As [TeamChatMessageCount]
			,SUM(D.[PrivateChatMessageCount]) As [PrivateChatMessageCount]
			,SUM(D.[CallCount]) As [CallCount]
			,SUM(D.[MeetingCount]) As [MeetingCount]
			,MIN(D.ReportDate) as FromDate
			,MAX(D.ReportDate) as ToDate
			,GETUTCDATE() as [ExecutionDate]
			,@VersionNo as VersionNo
FROM		[dbo].Users u
LEFT JOIN	[dbo].[DailyActivityUserDetails] D on D.UserPrincipalName = u.UserPrincipalName 
				AND u.Deleted = 0 
				AND D.ReportDate > dateadd(day, -30,@30DaysUpToDate) 
				AND D.ReportDate <= @30DaysUpToDate 
```



## Comparison Test 02 - Active User Count

This test compares Microsoft's portal.office.com report of active users for the last 30 days to TWA SQL.

Download the per user 30 usage excel report from https://portal.office.com/adminportal/home#/reportsUsage/TeamsUserActivity

Microsoft define "active" as having performed at least one of the of the following for the period: Team Chat Message, Private Chat Message, Call, Meeting Attended, "Has Other Action". 

Has other action includes loading and minimising the Teams client. Modality Systems do not consider this real activity so do not count this as "active".

To get a count of active users count from excel

- We need to remove all users with 0 count for Team Chat Message and 0 count for Private Chat Message, and 0 count for Calls, and 0 count for meetings Meeting Attended - these users have 0 for all 4 activity types so are not active
- The easiest way to do this is to add a colum to sum all 4 and if the sum is greater than 0, that is your count of active users

#### Validation SQL Query - Comparison Test 02

```sql
-- Version Number do not change
declare @VersionNo nvarchar(20) = '2020-06-11'

-- Configure the Date Value here;
declare @30DaysUpToDate date = '2020-06-08'


IF(@30DaysUpToDate > dateadd(day, -1, (SELECT MAX(ReportDate) as LatestDate from [dbo].[DailyActivityUserDetails])))
	RAISERROR('You have selected a date more recent than the data collected by Teamwork Analytics', 18, 1)


SELECT		@30DaysUpToDate As ReportDate
			,count(distinct D.UserPrincipalName) as ActiveUsers
			,count(distinct (CASE WHEN D.UserPrincipalName is Null then U.UserPrincipalName Else Null End)) as InActiveUsers
			,GETUTCDATE() as [ExecutionDate]
			,@VersionNo as VersionNo
FROM		[dbo].Users u
JOIN		[dbo].[TeamsUserLicences] l on l.UserId = u.Id 
				AND l.CapabilityStatus = 'Enabled' 
				AND l.Deleted = 0
LEFT JOIN	[dbo].[DailyActivityUserDetails] D on D.UserPrincipalName = u.UserPrincipalName 
				AND u.Deleted = 0 
				AND D.ReportDate > dateadd(day, -30,@30DaysUpToDate) 
				AND D.ReportDate <= @30DaysUpToDate 
```



## Comparison Test 03 - Sum Team Information - PowerShell

Total Teams, , Archived Teams, Non-Achieved Teams, Private Teams, Public Teams, Private Hidden

Run the PowerShell Query. Screenshot the output and note the date

```powershell
# Use script at your own risk
# Connect to Microsoft Teams PowerShell before running script

# Define a new object to gather output
$OutputCollection=  @()

Write-Verbose "Getting Team Names and Details"
$teams = Get-Team 

$Archived = $teams | Where Archived -Match True

$NonArchived = $teams | Where Archived -Match False

write-host ""
Write-Host "Total Teams count is $($teams.Count)"
Write-Host ""
Write-host "Archieved Teams count is $($Archived.Count)"
write-host ""
Write-Host "Non Archived Teams count is $($NonArchived.Count)"
write-host ""
Write-Host "Private Teams count is $($NonArchived.Count)"
write-host ""      
Write-Host "Public Teams count is $($NonArchived.Count)"
write-host ""   
Write-Host "Private HiddenMembership Teams count is $($NonArchived.Count)"
write-host ""                    

```

Compare to SQL 48 hours later.

#### Validation SQL Query - Comparison Test 03

```sql
-- Version Number do not change
declare @VersionNo nvarchar(20) = '2020-06-11'

SELECT	COUNT(*) as TotalTeams
		,SUM(CASE WHEN Visibility = 'Public' then 1 else 0 end) as PublicTeamCount
		,SUM(CASE WHEN Visibility = 'HiddenMembership' then 1 else 0 end) as HiddenMembershipTeamCount
		,SUM(CASE WHEN Visibility = 'Private' then 1 else 0 end) as PrivateTeamCount
		,SUM(CASE WHEN IsArchived = 1 then 1 else 0 end) as ArchivedTeamCount
		,GETUTCDATE() as [ExecutionDate]
		,@VersionNo as VersionNo
FROM	dbo.Teams
WHERE	Deleted = 0
```



## Comparison Test 04 - Team spot check - Teams Client

Pick a team and compare in Teams client (most fresh data source). Take a screenshot of the membership status and channel count.

Compare to SQL report 48 hours later

#### Validation SQL Query - Comparison Test 04

```sql
-- Version Number do not change
declare @VersionNo nvarchar(20) = '2020-06-11'

--Change the Team Name here (note it has to be exact to match the database)
declare @TeamName nvarchar(400) = 'Team Display Name'

Select	t.Id as TeamId
		,DisplayName as TeamName
		,Visibility
		,IsArchived
		,(SELECT COUNT(*) FROM dbo.Channels c where c.TeamId = t.Id) as Channels
		,SUM(CASE WHEN tu.UserType = 'Owner' AND CHARINDEX('#EXT#', u.UserPrincipalName) = 0 then 1 else 0 end) as Owners
		,SUM(CASE WHEN tu.UserType = 'Member' AND CHARINDEX('#EXT#', u.UserPrincipalName) = 0 then 1 else 0 end) as Members
		,SUM(CASE WHEN  CHARINDEX('#EXT#', u.UserPrincipalName) > 0 then 1 else 0 end) as Guests
		,GETUTCDATE() as [ExecutionDate]
		,@VersionNo as VersionNo
FROM	dbo.TeamUsers tu
JOIN	dbo.Users u on tu.UserId = u.Id
JOIN	dbo.Teams t on tu.TeamId = t.Id
WHERE	tu.Deleted = 0
AND		LOWER(t.DisplayName) = LOWER(@TeamName)
AND		u.Deleted = 0
AND		u.[Enabled] = 1
Group By
	t.Id
	,DisplayName
	,Visibility
	,IsArchived

Select	t.Id as TeamId
		,DisplayName as TeamName
		,u.UserPrincipalName
		,CASE WHEN tu.UserType = 'Owner' AND CHARINDEX('#EXT#', u.UserPrincipalName) = 0 then 1 else 0 end as IsOwner
		,CASE WHEN tu.UserType = 'Member' AND CHARINDEX('#EXT#', u.UserPrincipalName) = 0 then 1 else 0 end as IsMember
		,CASE WHEN  CHARINDEX('#EXT#', u.UserPrincipalName) > 0 then 1 else 0 end as IsGuest
		,GETUTCDATE() as [ExecutionDate]
		,@VersionNo as VersionNo
FROM	dbo.TeamUsers tu
JOIN	dbo.Users u on tu.UserId = u.Id
JOIN	dbo.Teams t on tu.TeamId = t.Id
WHERE	tu.Deleted = 0
AND		u.Deleted = 0
AND		u.[Enabled] = 1
AND		LOWER(t.DisplayName) = LOWER(@TeamName)
```

>NOTE: This query returns two result sets, one a summary, and the other a list of members

## Comparison Test 05 - User number of ownerships and memberships spot check PowerShell

Pick a user or users and run the PowerShell

```powershell

# Use Script at your own risk

# Simple per user Ownership and Membership report

# Connect to Microsoft Teams with PowerShell before running this script

#input correct user UPN
$user = "peter.test@modalitysystems.com"

# Define a new object to gather output
$OutputCollection=  @()

$TeamsUserIsIn = Get-Team -User $user

Foreach ($team in $TeamsUserIsIn)
    {
    
    $ownersandmembers = Get-TeamUser -GroupId $($team.GroupID)

    $userownerormember = $ownersandmembers | Where-Object {$_.User -eq $user}

    write-host ""
    $team.DisplayName
    $userownerormember
    write-host ""

                    $output = New-Object -TypeName PSobject 

                    $output | Add-Member NoteProperty "User" -Value $($userownerormember.User)
                    $output | Add-Member NoteProperty "Role" -Value $($userownerormember.Role)
                    $output | Add-Member NoteProperty "TeamDisplayName" -Value $($team.DisplayName)
                    $output | Add-Member NoteProperty "TeamGroupID" -Value $($team.GroupId)
                    $output | Add-Member NoteProperty "TeamArchived" -Value $($team.Archived)

                    $OutputCollection += $output

    }

$NumberofTeamsWhereMember = $OutputCollection | Where-Object {$_.Role -eq "member"}
$NumberofTeamsWhereOwner = $OutputCollection | Where-Object {$_.Role -eq "owner"}

$NumberofTeamsWhereMemberArchived = $OutputCollection | Where-Object {$_.Role -eq "member" -and $_.TeamArchived -eq "False"}
$NumberofTeamsWhereOwnerArchived = $OutputCollection | Where-Object {$_.Role -eq "owner" -and $_.TeamArchived -eq "False"}


Write-host ""
Write-Host "$user is owner of $($NumberofTeamsWhereOwner.Count) Teams including Archived Teams"
Write-Host "$user is member of $($NumberofTeamsWhereMember.Count) Teams including Archived Teams"

Write-host ""
Write-Host "$user is owner of $($NumberofTeamsWhereOwnerArchived.Count)  Archived Teams"
Write-Host "$user is member of $($NumberofTeamsWhereMemberArchived.Count) Archived Teams"

```

48 hours later, run SQL comparison with team name

#### Validation SQL Query - Comparison Test 05

```sql
-- Version No do not change
declare @VersionNo nvarchar(20) = '2020-06-11'

--Change the User Principal Name here (note it has to be exact to match the database)
declare @UserPrincipalName nvarchar(400) = 'user@domain.com'

Select	COUNT(DISTINCT TeamId) AS TeamsJoined
		,SUM(CASE WHEN tu.UserType = 'Owner' then 1 else 0 end) as AsOwner
		,SUM(CASE WHEN tu.UserType = 'Member' then 1 else 0 end) as AsMember
		,@UserPrincipalName as [User]
		,GETUTCDATE() as [ExecutionDate]
		,@VersionNo as VersionNo
FROM	dbo.TeamUsers tu
JOIN	dbo.Users u on tu.UserId = u.Id
WHERE	tu.Deleted = 0
AND		LOWER(u.UserPrincipalName) = LOWER(@UserPrincipalName)

Select	Distinct
		DisplayName as TeamName
		,tu.UserType as Role
		,GETUTCDATE() as [ExecutionDate]
		,@VersionNo as VersionNo
FROM	dbo.TeamUsers tu
JOIN	dbo.Users u on tu.UserId = u.Id
JOIN	dbo.Teams t on tu.TeamId = t.Id
WHERE	tu.Deleted = 0
AND		LOWER(u.UserPrincipalName) = LOWER(@UserPrincipalName)
```
>NOTE: This query returns two result sets, one a summary, and the other a list of team memberships



# FUTURE - Comparing Teamwork Analytics SQL and Teamwork Analytics Power BI - FUTURE

Future Tests to compare SQL numbers to report numbers
