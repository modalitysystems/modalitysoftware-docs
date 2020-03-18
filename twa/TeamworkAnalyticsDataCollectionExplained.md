## Teamwork Analytics Data Collection Explained

Teamwork Analytics uses several different API's for each reporting app to collect data, mostly via Microsoft Graph.

All data is not available from a single API, so we often have to combine data sources to get the detail we want for reporting.

This section explains some of the different API's we use and data we collect, and its impact on available reports.

## Microsoft Teams Data Collection

In all cases, we collect metadata of activity (time of posting, channel, team poster, number of posts/reactions) not the actual content of messages.

## Microsoft Teams Data Collection Update Interval

Our process contantly collects data from Microsoft Graph on a loop (to the speed Microsoft allow us before throttling). Once the process has worked through all data and Teams, it immedatgely starts again working through for any changes.

In smaller organisations (a few thousand users) this can take hours, so the data is updated in SQL multiple times a day), in larger customers ~250,000+ this complete update can take up to 24 hours in the worst cases (heveay usage, lots of Microsoft throttling).

From a reporting point of view, the worst case is to assume a 24 to 48 hour latency from time of activity, but typically it is less than this. This accounts for Graph, SQL and Power BI refresh times.

### Collecting Microsoft Teams Detailed Activity Metadata for Teams and Channels (List channel messages)

For Teams/Channels and SharePoint/File Activity, the API's allow us to poll for the actual messages posted in every single channel since each Team and channels creation (provided the data has not been deleted by a retention policy). For this reason, we can report on Team/Channel activity right from when the first team was created in your organisation, straight after install. This data does not need to "build up" like Private Chat, Calls and Meetings data.

It is this detailed activity metadata that lets us report in granular detail on team activity by active directory group. So reports on Team activity will have more detail, more filters and will have history to the extent to which the customer wants to store it.

### Collecting Microsoft Teams Summary Activity Reports - Private Chat, Calls and Meetings (getTeamsUserActivityUserDetail)

Our Microsoft Teams reporting uses Microsoft Teams and SharePoint Graph API's to get detailed reports of Microsoft Teams Activity.

Microsoft provide some usage detail in **summary reports** which are correct at time of pulling from the API. These are what you typically see in out of the box Office 365 reporting. The supported values for collecting a summary period are last 7 days, 30 days, 90 days, and 180 days, relative to the time you pull from the API. These to not breakdown the usage by user.

You can also get specify a date range on this API for which you would like to view the users who performed any activity. This report is only available for the past 30 days. We use this data source as it gives us the user detail which allows us to report in more detail.

The data returned gives us daily user usage information for the 30 day historical period. Meaning at point of install we can report on the previous 30 days. From install forward, we pull this summary daily to get daily change in the database, which then allows us to report weekly and monthly usage/change.

Most notably this is how we get usage information on

- Private Chat Messages
- Calls
- Meetings

So any report page that reports on Private Chat, Calls or Meetings will initially report on the previous 30 days, then build data over time from when Teamwork Analytics is installed.

We hope/envisage that as the API's offer more access we will be able to report in even more detail in the future.
