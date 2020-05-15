
## Data the database holds
The database holds:
- Daily per user activity for up to 14 days of the data we have (e.g. on the 27th, we may only have data until 25th, so you can visualise to the 11th
- Weekly is held for a year - weeks begin Monday
- Monthly activities summaries for infinate months (subject to storage) 
e.g. I can filter on a custom AD field for monthly usage for all time

Yearly for infinate years subject to storage (subject to storage)

Reprorts are either day report or month reports, you can't mix and match in a signle report

For tenant users we get all activity from the API (chat, channels, meetings, calls, other) for guests we only see their channel message activity (not private chat, meetings joined, calls made).

## Filtering by day, week or month in TWA reports (FUTURE NOT GA) for Usage Reports

Microsoft API's typicaly reports user usage data 48 hours to 72 hours behind. To ensure our data is accurate, we will only report on days, weeks or months with complete data.

Each report page is either a day, week or month report page. Users must only use the appropriate time filters on each page (day for day reports, "Calendar week" for weekly reports and "calendar Month" for monthly reports. If users use any other filters, they can expect possibly incorrect results.

Reports will not render a day, week or month until the data is complete. If you select a current or just past current period (for example a week one day after the week is complete, due to the 72-hour delay in data from Microsoft, the week will not render in the report.

Weeks start on a Sunday in Power BI  (ISO weeks)



## Active User

"Active User" to us is at least one of the following for a user for the period: Private chat Message, channel message, reaction, meeting join, call (Voip or PSTN). 

We do not count "other" actions as an active user: 

Microsoft define other as...


### Governance and Collab

## Team Users vs Owners vs Guests

Team Users - is the sum of owners, members and guests

Owners is explicitly owners not members or guests

Members - is explictly members (not owners of guests)

Guests is explicitly guests not owners or members

## Total Teams and Archived Teams

Our counts of total Teams always incudes Archied teams, we can also split out the number of archived teams

Our counts of teams do not include deleted teams

"Message(s) in Last 30 Days" is actually any message-related change in the last 30 days (e.g. liking an old message).
