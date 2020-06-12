
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

set these manually, don't change them wait 72 hours and check

comparison tests are harder, there is a variable


## Comparison Tests - Total User usage data (total chat messages, team messages, calls, meetings attended)

Pull your CSV on 20th, the excel column 1 gives you a data, thats your period. 

The SQL only gives complete data - it checks for one record for the data after the data range, so we know the data range is complete. e.g. if you ask for ask for 30 days backwards from 17th, query will only work if we have at least some records for the 18th 

## Comparison Tests - Total Team Information (Total Teams, Private Teams, Public Teams, Archived Teams)

PS vs SQL,

PS has a pull date

## Comparison Tests - Pick specific Team and compare data (owners, memebers, guests, channel count)

## Comparison Tests - Pick specific user and compare team data (ownerships, memberships)

## Comparison Tests - Licenced User Count

## Comparison Tests - Licenced and Active User Count, Licenced and Inactive User Count


