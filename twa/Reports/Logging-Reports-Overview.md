# Logging Reports Overview

## Checking on Data Collection (Scan) Progress/Status

 

The Teamwork Analytics data collection from graph process (sometimes called a scan) breaks down into 3 types which all run concurrently on different schedules:

- Per User Usage **Reporting** – Microsoft Graph API Reporting Endpoints - Per user number of private chat messages, channel chat, meetings attended, calls made
- Team details (**Main**) – Collaboration Team Details - Name, Public, Private, Members / Owners / Guests
- Team Channel **Messages** – Collects Channel Data so Messages / Mentions / Reactions / Attachments

They can all complete at different times depending on the amount of data/users.

To check if the messages scan has completed you can either check the Logging reports or run a SQL query.

To use the logging / troubleshooting report. Go to the page titled “Troubleshooting (Scan History)” and use the “Scan Type” filter to select Messages – in the scan history you are looking for a scan with a completion time.

To check using SQL Query on the TWA database 

```
SELECT *

 FROM [monitoring].[TenantScan]

 where ScanDefinitionId = 2

 order by Id desc
```

This will return a list of all message scans. You are looking for a scan with “End” populated to indicate the scan as completed (see screenshot below) 



## Understanding Guests

Tenant Wide:

*Guests User* Type = Guests

*External-Members* - these are external users that have been made members - UPN has EXT but they are members

Teams specific - the ones TWA gets

*Guests User* that are members of Teams, even if no activity (Type = Guests)

*External-Members* that are members of Teams these are external users that have been made members, even if no activity ( - UPN has EXT but they are members


## User Check

Guests = Guest User and External Members that are members of Teams - correct at time of data pull, e.g. "Current state"

Tenant Users - on the tennat (no EXT in name) and members or owners of at least 1 team

We do not get per guest usage summary activity (e.g. calls, pchat, team chat, meetings)

## Team Check

All Teams on the whole tennat either Live or Archived

showing public, private and non-discoverable (private)

users = internal members, owners and guests
guests = guest members only
owners = owners only

## Admin Center Check

Total Active Users = users have 1 or more of anything including "other" - Microsoft do not define "other

How we get to these totals. We pull per user totals, per day for the period. We then sum these. 

The API allows us to ask for a 30 data total for all usage on the tenant, broken down by user (e.g. Bob's activity summed for 30 days) - we have found this total is different to taking bob's activity day by day for the same 30 day period. In particular the sum of meetings attended is always seems to be higher. Hence when you compare our Total user activity for 30 days to portal/admin report for 30 days, the number of meetings in our report will be lower than Microsoft's.

#######



