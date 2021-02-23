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

This allows you to remove either meta data about content (messages, reactions, user activity) or "structure" (channels, teams, members, owners) from the database. In most cases you will want to remove "data" but not "structure".

To remove channel message content:

This is baded 

| TableName | ColumnName | MaximumAgeInDays|
| --------- | ---- | ---- |
| [dbo].[Channels] | [LastUpdatedDateTime] | 365 |
| [dbo].[Attachments] | [LastUpdatedDateTime] | 365 |
| [dbo].[DriveItemDeltaTokens] | [CreatedDateTime] | 60 |
| [dbo].[ActivityUserDetails] | [ReportRefreshDate] | 90 |
| ... | ... | ... |

To remove user activity reports:



