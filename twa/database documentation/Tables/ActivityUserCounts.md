#### 

[Tables](Tables.md) > dbo.ActivityUserCounts

# ![Tables](../images/Table32.png) [dbo].[ActivityUserCounts]

---

## <a name="#description"></a>MS_Description

Get the number of users by activity type. The activity types are number of teams chat messages, private chat messages, calls, or meetings.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_dbo.ActivityUserCounts: ReportDate](../images/pkcluster.png)](#indexes) | ReportDate | datetime2 | 8 | NOT NULL |  | _The date the usage occured._ |
|  | ReportRefreshDate | datetime2 | 8 | NOT NULL |  | _The date the usage data was retrieved from graph._ |
|  | TeamChatMessages | int | 4 | NOT NULL | ((0)) | _The number of users who sent Teams Channel Messages on this ReportDate._ |
|  | PrivateChatMessages | int | 4 | NOT NULL | ((0)) | _The number of users who sent Private Chat Messages on this ReportDate._ |
|  | Calls | int | 4 | NOT NULL | ((0)) | _The number of users who made calls on this ReportDate._ |
|  | Meetings | int | 4 | NOT NULL | ((0)) | _The number of users who attended meetings on this ReportDate._ |
|  | OtherActions | int | 4 | NOT NULL | ((0)) | _The number of users who performed other actions on this ReportDate._ |
|  | ReportPeriod | nvarchar(max) | max | NULL allowed |  | _The number of days requested when calling the graph endpoint._ |


---

###### Author:  Rob Taylor

###### Copyright 2020 - All Rights Reserved

###### Created: 26 June 2020 11:20:43

