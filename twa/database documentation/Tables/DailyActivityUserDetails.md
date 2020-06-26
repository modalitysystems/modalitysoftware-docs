#### 

[Tables](Tables.md) > dbo.DailyActivityUserDetails

# ![Tables](../images/Table32.png) [dbo].[DailyActivityUserDetails]

---

## <a name="#description"></a>MS_Description

Get details about Microsoft Teams user activity by user per day.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_dbo.DailyActivityUserDetails: UserPrincipalName\ReportDate](../images/pkcluster.png)](#indexes)[![Indexes IX_UserPrincipalName](../../../Images/Index.png)](#indexes) | UserPrincipalName | nvarchar(450) | 900 | NOT NULL |  | _Foreign Key to UserPrincipalName in dbo.Users._ |
| [![Cluster Primary Key PK_dbo.DailyActivityUserDetails: UserPrincipalName\ReportDate](../images/pkcluster.png)](#indexes)[![Indexes IX_ReportDate](../../../Images/Index.png)](#indexes) | ReportDate | datetime2 | 8 | NOT NULL |  | _The date the usage occured._ |
|  | LastActivityDate | datetime2 | 8 | NULL allowed |  | _The last activity date for the user within the period._ |
|  | TeamChatMessageCount | int | 4 | NOT NULL | ((0)) | _The number of Teams Channel Messages on this ReportDate._ |
|  | PrivateChatMessageCount | int | 4 | NOT NULL | ((0)) | _The number of Private Chat Messages on this ReportDate._ |
|  | CallCount | int | 4 | NOT NULL | ((0)) | _The number of Calls on this ReportDate._ |
|  | MeetingCount | int | 4 | NOT NULL | ((0)) | _The number of Meetings on this ReportDate._ |
|  | HasOtherAction | bit | 1 | NOT NULL | ((0)) | _Whether the user performed any Teams action on this report date._ |


---

###### Author:  Rob Taylor

###### Copyright 2020 - All Rights Reserved

###### Created: 26 June 2020 11:20:43

