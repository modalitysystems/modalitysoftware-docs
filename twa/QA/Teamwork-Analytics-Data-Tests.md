
Gathering data from Microsoft Graph is complicated, there are different API endpoints for different data types (per user usage information, team information, file information).

Modality Systems perform extensive tests to ensure data is gathered correctly, but there are also sometimes per tenant or envrionmental factors that can influence data quality (am under performing SQL server for example).

Should you want to, here are a range of data validity quality assurance tests you can perform and an understanding of the results you should expect.

## Understanding Data Collection and Microsoft API Lag

Microsoft's Graph reporting API's, the one that gives us per user Teamns usage information (per user number of chats, team chats, meetings attended, calls made), is typicaly ~48 hours behind the current time. E.g. the users usage report for today will be avaialble in approximately 2 days.

On top of the API being 48 hours behind, there is a time over head to collect the data and put it into SQL (this is variable depending on the number of users in your teant from as little as an hour to ~24 hours for 300,000 users).

There is a third time overhead, which is Power BI gathering information from SQL into the Power BI reports. This is typcially done at scheduled times throught the day (customer confgure this).

The Graph API that gives us "team" information  (team names, memebers, guests, owners) also has a delay. typically less than 48 hours, but the same API to SQL and SQL to Power BI delay exists.

When testing for data accuracy it is important to take these delays into account.

Below we have outlined some useful checks you can perform to validate data is accurate.

There are two types of test. Controlled Tests allow you to completely control the data and make an exact comparison. Comparison tests compare Microsoft reports to Teamwork Analyitcs SQL data and Power BI reports, due to variables on how Microsoft present the data this can be harder to compare.

We have defined the best apporaches to comparison but welcome any feedback.

## Controlled Tests - Per Team Information (Owners, members, guests, channel count)

Create at least 2 control teams and once setup, do not change any variables until you have confirmed they are correct in SQL and Power BI. This will  mean setting them up and checking them 72 hours later

Example Starting Point:

Create a Prvate Teams with 5 channels, 2 Owners and 2 members

Create a Public Team with 3 Channels, 1 owner and 1 member

From here variables you could change
  - add or remove channels
  - add or remeove members or owners
  - delete team
  - change team from public to private
  
Please write down changes and date of change.

## Comparison Test 01 - Total User usage data (total chat messages, team messages, calls, meetings attended)

Pull your Excel Per user 30 usage report from  https://portal.office.com/adminportal/home#/reportsUsage/TeamsUserActivity on 20th

Sum the columns for Team Chat Message Count,	Private Chat Message Count,	Call Count,	Meeting Count,

The file name gives you the time you pulled the reprot. The column 1 gives you the date Microsoft say the data is up to.

Wait until 48 hours later for the data to come through the graph API and into SQL, and perform the SQL query that will perform the same date range.

Input the date from column 1. The SQ query 

The SQL only gives complete data - it checks for one record for the data after the data range, so we know the data range is complete. e.g. if you ask for ask for 30 days backwards from 17th, query will only work if we have at least some records for the 18th 

GOT SQL

## Comparison Test 02 - Active User Count, Inactive User Count

Using the same Portal 30 day user report, filter for any users with more than 0 activity in Team Chat Message Count,	Private Chat Message Count,	Call Count,	Meeting Count. Do not include other. Modality Systems Teamwork Analytics does not define "other" as active.

Note active are always going to be licenced and inactive will also be licened but inactive. Un licenced users are not counted.

Sum the excel user list.

Input the SQL with the same column 1 date. Check the sum of users 

Got SQL

## Comparison Test 03- Total Team Information (Total Teams, Private Teams, Public Teams, "hidden", Archived Teams)

Run the PowerShell Query. It will output with a date stamp. 48 hours later perform the SQL query. Compare numbers

Got SQL

## Comparison Test 04 - Pick specific Team and compare data (owners, memebers, guests, channel count)

Pick a team and compare in Teams client (most fresh data source). Take a screenshot of the membersip status and channel count.

48 hours later, run SQL comparison with team name

## Comparison Test 05 - Pick specific user and compare team data (ownerships, memberships)

Pick a user or users and run the PowerShell

48 hours later, run SQL comparison with team name

## Comparison Test 06 - Licenced User Count

PowerShell - still to do

SQL got



