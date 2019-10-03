## Teamwork Analytics Data Collection Explained

Teamwork Analytics uses a number of different API's to collect data for reporting, mostly via Microsoft Graph

All data is not available from a single API, so we often have to combine data sources to get the detail we want for reporting

This section explains some of the different API's we use and data we collect, and its impact on avaialble reports

## Microsoft Teams Data Collection

In all cases we collect metadata of activity (time of posting, channel, team poster, number of posts/reactions) not the actual content of messages.

### Collecting Microsoft Teams Summary Activity Reports - Private Chat, Calls and Meetings (getTeamsUserActivityCounts)

Our Microsoft Teams reporting uses Microsoft Teams and SharePoint Graph API's to get detailed reports of Microsoft Teams Activity

Microsoft surface some detail in summary reports which are correct at time of pulling from the API. These are what you typically see in out of the box Office 365 reporting. The supported values for collecting a summary period are: 7 days, 30 days, 90 days, and 180 days. 

For these we cannot query for a particular period in the past, only the last 7, 30, 90 or 180 days at the time of API query. So when Teamwork Analytics is deployed we daily pull the metrics over time can build a cacluaotion of the difference. For example if we pull the 7 day period every day, we can get a daily change on the metric.

Therefore for these metrics we will build more data to report on from when Teamwork Analytics is installed. Most notablly this is how we get usage information on 

- Private Chat Messages
- Calls
- Meetings

So any report page that reports on these will build data over time from when Teamwork Analytics is installed.

### Collectiong Microsoft Teams Detailed Activity Metadata for Teams and Channels (List channel messages)

For Teams/Channels and SharePoint/File Activity, the API's allow us to poll for the actual messages posted in every single channel since each Team and channels creation (provided the data has not been deleted by a retention policy). For this reason we can report on Team/Channel activity right from when the first team was created in your organisation, straight after install. This data does not need to "build up" like Private Chat, Calls and Meetings data.

It is this detailed activity metadata that lets us report in granualr detail on team activty by active directory group.

We hope/envisagte that as the API's offer more access we will be able to report in even more detail in the future
