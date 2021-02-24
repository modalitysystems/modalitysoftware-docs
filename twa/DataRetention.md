# Data Retention

By default Teamwork analytics will retain all data. Some customers will want to limit the amount of data retained

There is a specific "scan type" that can be configured to control data retention.

To configure retention, a row in the `configuration.ScanDefinitions` table needs to be [added](scan-configuration.md). After doing this configurations in the `configuration.DataDeletionRules` table will be used.

## Configuring Data Deletion Rules

The DataDeletionRules has three columns that can be configured
- **TableName:** The Exact name of the Table. Including [] around both schema and table name is recommended as shown.
- **ColumnName:** The Column from the Table above, used when deciding deletion rules. Must be a Date column.
- **MaximumAgeInDays:** The amount of days to keep a row based off of the Date Column above.


The model allows us to delete specific sets of data in the database. Some or all can be used.

This allows you to remove either meta data about content (messages, reactions, user activity) or "structure" (channels, teams, members, owners) from the database. In most cases you will want to remove "data" but not "structure". Some examples of what should be added to the `configuration.DataDeletionRules` table are as follows;

### To remove channel message content older than 1 year (365 days):

| TableName | ColumnName | MaximumAgeInDays|
| --------- | ---- | ---- |
| [dbo].[Messages] | [CreatedDateTime] | 365 |
| [dbo].[Reactions] | [CreatedDateTime] | 365 |
| [dbo].[Mentions] | [LastUpdatedDateTime] | 365 |
| [dbo].[Attachments] | [LastUpdatedDateTime] | 365 |
| ... | ... | ... |

### To remove user activity reports older than 1 year (365 days):

| TableName | ColumnName | MaximumAgeInDays|
| --------- | ---- | ---- |
| [dbo].[ActivityCounts] | [ReportDate] | 365 |
| [dbo].[ActivityUserCounts] | [ReportDate] | 365 |
| [dbo].[ActivityUserDetails] | [ReportRefreshDate] | 365 |
| [dbo].[DailyActivityUserDetails] | [ReportDate] | 365 |
| [dbo].[DeviceUsageDistributionUserCounts] | [ReportRefreshDate] | 365 |
| [dbo].[DeviceUsageUserCounts] | [ReportDate] | 365 |
| [dbo].[DeviceUsageUserDetails] | [ReportRefreshDate] | 365 |
| ... | ... | ... |

