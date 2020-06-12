
Gathering data from Microsoft Graph is complicated, there are different API endpoints for different data types (per user usage information, team information, file information).

Modality Systems perform extensive tests to ensure data is gathered correctly, but there are also sometimes per tenant or envrionmental factors that can influence data quality (am under performing SQL server for example).

Should you want to, here are a range of data validity quality assurance tests you can perform and an understanding of the results you should expect.

## Understanding Data collection and Microsoft API Lag

Microsoft reporting API, the one that gives us per user usage, is typicaly ~48 hours behind. Then there is additional time for Modality to Query the API, write to SQL, then there is the variable of Power BI refresh.

The "team" information API (team names, memebers, guests, owners) is t


## Controlled Tests - Per Team Information (Owners, members, guests, channel count)

set these manually, don't change them wait 72 hours and check

comparison tests are harder, there is a variable


## Comparison Tests - Total User usage data (total chat messages, team messages, calls, meetings attended)

Pull your CSV on 20th, the excel column 1 gives you a data, thats your period. 

The SQL only gives complete data - it checks for one record for the data after the data range, so we know the data range is complete. e.g. if you ask for ask for 30 days backwards from 17th, query will only work if we have at least some records for the 18th 

## Comparison Tests - Total Team Information (Total Teams, Private Teams, Public Teams, Archived Teams)

PS vs SQL,

PS has a pull date, 

## Comparison Tests - per team test

## Comparison Tests - per user test

## Comparison Tests - Licenced Users

## Comparison Tests - Licenced and Active User Count, Licenced and Inactive User Count


