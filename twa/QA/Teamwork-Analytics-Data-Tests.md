

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

## Comparison Test 01 - Tenant Total user usage for 30 days

This test compares Microsoft's portal.office.com report of 30 days

Download the per user 30 usage excel report from https://portal.office.com/adminportal/home#/reportsUsage/TeamsUserActivity

Sum the columns for Team Chat Message Count, Private Chat Message Count, Call Count, Meeting Count. 

Note meeting count is meetings attended per user.

The file name of the excel report gives you the time you pulled the report. Column 1 gives you the date up until which Microsoft have given you the usage data. These dates are different. Microsoft native reporting is also typically around 48 hours behind current date.

Allow around a day for the same usage information to be collected and stored in TWA SQL. Then input the data from Column 1 into the SQL query and it will sum the same previous 30 days of usage information.

The SQL query will only complete once SQL has some data for the day after this date. That way we know the data for the data in question and previous 30 days including that date has been reported by Microsoft Graph API. This avoids the test completing with partial data for that day.

E.g. If you ask for ask for 30 days backwards from 17th, query will only work if we have at least some records for the 18th.

SQL is complete - LINK

## Comparison Test 02 - Active User Count

This test compares Microsoft's portal.office.com report of active users for the last 30 days to TWA SQL.

Download the per user 30 usage excel report from https://portal.office.com/adminportal/home#/reportsUsage/TeamsUserActivity

Microsoft define "active" as having performed at least one of the of the following for the period: Team Chat Message, Private Chat Message, Call, Meeting Attended, "Has Other Action". 

Has other action includes loading and minimising the Teams client. Modality Systems do not consider this real activity so do not count this as "active".

To get a count of active users count from excel

- Filter for contains 0 for Team Chat Message, Private Chat Message, Call, Meeting Attended
- Delete all these rows with 0 usage for all those features
- Sum the remaining user count - Sum the UPNs column. The number of rows is your number of active users

Got SQL

## Comparison Test 03 - Sum Team Information - PowerShell

Total Teams, Private Teams, Public Teams, "hidden", Archived Teams

Run the PowerShell Query. It will output with a date stamp. 48 hours later perform the SQL query. Compare numbers

Compare to SQL 48 hours later.

Got SQL

## Comparison Test 04 - Team spot check - Teams Client

Pick a team and compare in Teams client (most fresh data source). Take a screenshot of the membership status and channel count.

Compare to SQL report 48 hours later

## Comparison Test 05 - User number of ownerships and memberships spot check

Pick a user or users and run the PowerShell

48 hours later, run SQL comparison with team name



# Comparing Teamwork Analytics SQL and Teamwork Analytics Power BI - FUTURE

Write one SQL query that gathers all key stats to compare to Power BI - consider refresh delay.

SQL output vs Check the numbers on reports with report codes
- 1 SQL query to compare to all reports


