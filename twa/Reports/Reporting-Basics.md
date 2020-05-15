
## Data the database holds
The database holds:
- Daily per user activity for up to 14 days of the data we have (e.g. on the 27th, we may only have data until 25th, so you can visualise to the 11th
- Weekly is held for a year - weeks begin Monday
- Monthly activities summaries for infinate months (subject to storage) 
e.g. I can filter on a custom AD field for monthly usage for all time

Yearly for infinate years subject to storage (subject to storage)

Reprorts are either day report or month reports, you can't mix and match in a signle report

For tenant users we get all activity from the API (chat, channels, meetings, calls, other) for guests we only see their channel message activity (not private chat, meetings joined, calls made).

## Total Teams and Archived Teams

Our counts of total Teams always incudes Archied teams, we can also split out the number of archived teams

Our counts of teams do not include deleted teams

## Team Users vs Owners vs Guests

Team Users - is the sum of owners, members and guests

Owners is explicitly owners not members or guests

Members - is explictly members (not owners of guests)

Guests is explicitly guests not owners or members

"Users" will always include any guests in totals

## Active User

"Active User" to us is at least one of the following for a user for the period: Private chat Message, channel message, reaction, meeting join, call (Voip or PSTN). 

We do not count "other" actions as an active user: 

Microsoft define other as...

"Message(s) in Last 30 Days" is actually any message-related change in the last 30 days (e.g. liking an old message).

# In development/aspirational

We will only show a month in a month date picker, if we have complete information for that month

