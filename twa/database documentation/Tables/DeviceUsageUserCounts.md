#### 

[Tables](Tables.md) > dbo.DeviceUsageUserCounts

# ![Tables](../images/Table32.png) [dbo].[DeviceUsageUserCounts]

---

## <a name="#description"></a>MS_Description

Get the number of daily unique users by device type.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_dbo.DeviceUsageUserCounts: ReportDate](../images/pkcluster.png)](#indexes) | ReportDate | datetime2 | 8 | NOT NULL |  | _The date the usage occured._ |
|  | ReportRefreshDate | datetime2 | 8 | NOT NULL |  | _The date the usage data was retrieved from graph._ |
|  | Web | int | 4 | NOT NULL | ((0)) | _Number of Users accessing Teams via the web during the Report Period._ |
|  | WindowsPhone | int | 4 | NOT NULL | ((0)) | _Number of Users accessing Teams via Windows Phone during the Report Period._ |
|  | AndroidPhone | int | 4 | NOT NULL | ((0)) | _Number of Users accessing Teams via an Android Device during the Report Period._ |
|  | Ios | int | 4 | NOT NULL | ((0)) | _Number of Users accessing Teams via an iOS device during the Report Period._ |
|  | Mac | int | 4 | NOT NULL | ((0)) | _Number of Users accessing Teams via a Mac during the Report Period._ |
|  | Windows | int | 4 | NOT NULL | ((0)) | _Number of Users accessing Teams via a Windows device during the Report Period._ |
|  | ReportPeriod | nvarchar(max) | max | NULL allowed |  | _The number of days requested when calling the graph endpoint._ |


---

###### Author:  Rob Taylor

###### Copyright 2020 - All Rights Reserved

###### Created: 26 June 2020 11:20:43

