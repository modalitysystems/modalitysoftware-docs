#### 

[Tables](Tables.md) > dbo.DeviceUsageUserDetails

# ![Tables](../images/Table32.png) [dbo].[DeviceUsageUserDetails]

---

## <a name="#description"></a>MS_Description

Get details about Microsoft Teams device usage by user.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_dbo.DeviceUsageUserDetails: UserPrincipalName\ReportRefreshDate](../images/pkcluster.png)](#indexes)[![Indexes IX_UserPrincipalName](../images/Index.png)](#indexes) | UserPrincipalName | nvarchar(450) | 900 | NOT NULL |  | _Foreign Key to UserPrincipalName in dbo.Users_ |
| [![Cluster Primary Key PK_dbo.DeviceUsageUserDetails: UserPrincipalName\ReportRefreshDate](../images/pkcluster.png)](#indexes)[![Indexes IX_ReportRefreshDate IX_ReportRefreshDate_IsDeleted](../images/Index.png)](#indexes)(2) | ReportRefreshDate | datetime2 | 8 | NOT NULL |  | _The date the usage data was retrieved from graph._ |
|  | LastActivityDate | datetime2 | 8 | NULL allowed |  | _The last activity date for the user within the period._ |
| [![Indexes IX_ReportRefreshDate_IsDeleted](../images/Index.png)](#indexes) | IsDeleted | bit | 1 | NOT NULL | ((0)) |  |
|  | DeletedDate | datetime2 | 8 | NULL allowed |  |  |
| [![Indexes IX_ReportRefreshDate_IsDeleted](../images/Index.png)](#indexes) | UsedWeb | bit | 1 | NOT NULL | ((0)) | _Whether the user used a Web device to access Teams within the report period._ |
| [![Indexes IX_ReportRefreshDate_IsDeleted](../images/Index.png)](#indexes) | UsedWindowsPhone | bit | 1 | NOT NULL | ((0)) | _Whether the user used a Windows Phone device to access Teams within the report period._ |
| [![Indexes IX_ReportRefreshDate_IsDeleted](../images/Index.png)](#indexes) | UsediOs | bit | 1 | NOT NULL | ((0)) | _Whether the user used an iOS device to access Teams within the report period._ |
| [![Indexes IX_ReportRefreshDate_IsDeleted](../images/Index.png)](#indexes) | UsedMac | bit | 1 | NOT NULL | ((0)) | _Whether the user used a Mac device to access Teams within the report period._ |
| [![Indexes IX_ReportRefreshDate_IsDeleted](../images/Index.png)](#indexes) | UsedAndroidPhone | bit | 1 | NOT NULL | ((0)) | _Whether the user used an Android Phone device to access Teams within the report period._ |
| [![Indexes IX_ReportRefreshDate_IsDeleted](../images/Index.png)](#indexes) | UsedWindows | bit | 1 | NOT NULL | ((0)) | _Whether the user used a Windows device to access Teams within the report period._ |
|  | ReportPeriod | nvarchar(max) | max | NULL allowed |  | _The number of days requested when calling the graph endpoint._ |


---

###### Author:  Rob Taylor

###### Copyright 2020 - All Rights Reserved

###### Created: 26 June 2020 11:20:43

