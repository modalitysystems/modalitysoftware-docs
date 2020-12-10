# Data Retention

By default TWA will not run the data retention scan without being manually configured. To do so, a row in the `configuration.ScanDefinitions` table needs to be [added](scan-configuration.md). After doing this configurations in the `configuration.DataDeletionRules` table will now be used.

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

