#### 

[Tables](Tables.md) > dbo.ActivityUserDetails

# ![Tables](../images/Table32.png) [dbo].[ActivityUserDetails]

---

## <a name="#description"></a>MS_Description

Get details about Microsoft Teams user activity by user.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_dbo.ActivityUserDetails: UserPrincipalName\ReportRefreshDate](../images/pkcluster.png)](#indexes)[![Indexes IX_UserPrincipalName](../../../Images/Index.png)](#indexes) | UserPrincipalName | nvarchar(450) | 900 | NOT NULL |  | _Foreign Key to UserPrinicipalName in dbo.Users._ |
| [![Cluster Primary Key PK_dbo.ActivityUserDetails: UserPrincipalName\ReportRefreshDate](../images/pkcluster.png)](#indexes) | ReportRefreshDate | datetime2 | 8 | NOT NULL |  | _The date the usage data was retrieved from graph._ |
|  | LastActivityDate | datetime2 | 8 | NULL allowed |  | _The last activity date for the user within the period._ |
|  | IsDeleted | bit | 1 | NOT NULL | ((0)) |  |
|  | DeletedDate | datetime2 | 8 | NULL allowed |  |  |
|  | TeamChatMessageCount | int | 4 | NOT NULL | ((0)) | _The number of Teams Channel Messages._ |
|  | PrivateChatMessageCount | int | 4 | NOT NULL | ((0)) | _The number of Private Chat Messages._ |
|  | CallCount | int | 4 | NOT NULL | ((0)) | _The number of Calls._ |
|  | MeetingCount | int | 4 | NOT NULL | ((0)) | _The number of Meetings._ |
|  | HasOtherAction | bit | 1 | NOT NULL | ((0)) | _Whether the user performed any Teams action._ |
|  | ReportPeriod | nvarchar(max) | max | NULL allowed |  | _The number of days requested when calling the graph endpoint._ |


---

###### Author:  Rob Taylor

###### Copyright 2020 - All Rights Reserved

###### Created: 26 June 2020 11:20:43

