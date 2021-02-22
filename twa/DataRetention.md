# Data Retention

By default Teamwork analytics will retain all data. Some customers will want to limit the amount of data retained

There is a specific "scan type" that can be configured to control data retention.

To configure retention, a row in the `configuration.ScanDefinitions` table needs to be [added](scan-configuration.md). After doing this configurations in the `configuration.DataDeletionRules` table will be used.

## Configuring Data Deletion Rules

The DataDeletionRules has three columns that can be configured
- **TableName:** The Exact name of the Table. Including [] around both schema and table name is recommended as shown.
- **ColumnName:** The Column from the Table above, used when deciding deletion rules. Must be a Date column.
- **MaximumAgeInDays:** The amount of days to keep a row based off of the Date Column above.

| TableName | ColumnName | MaximumAgeInDays|
| --------- | ---- | ---- |
| [dbo].[Channels] | [LastUpdatedDateTime] | 365 |
| [dbo].[Attachments] | [LastUpdatedDateTime] | 365 |
| [dbo].[DriveItemDeltaTokens] | [CreatedDateTime] | 60 |
| [dbo].[ActivityUserDetails] | [ReportRefreshDate] | 90 |
| ... | ... | ... |

These represent the 4 data types of date bound data Teamwork Analytics holds:

**Channels** controls the amount of meta data about channel activity that is held. Changing this value will change the window for which you can report on channel activity, but not the data held about the Team, memberships or channel names. e.g. if set to 365 days, you will only see channel message activity reports for channel activity within the last 365 days.

**Attachments** controls how long details of channel message attachments (things like images pasted into a channel chat) are held, based on the creation time of the record about that file (which usually aligns to the data the file was added to the team) e.g. If set to 365 days, you will only see reports on channel message attachments for the last 90 days

**DriveItemDeltaTokens** controls how long information on files in teams are held. e.g. If set to 60 days, you will only see reports on files created in or added to the team within the last 60 days.

**ActivityUserDetails** controls how long user activity data, things like counts of private chat, channel chat, meetings and calls are held, based on the data of that activity e.g. if set to 90 days, TWA will be able to report on the previous 90 days of user activity.

As data can be delayed coming from Microsoft, if you want to report on a period like last 90 days, we recommend setting the retention to around 10 days higher, to account for the delay in Microsoft processing and providing details in some cases.