#### 

[Tables](Tables.md) > dbo.Apps

# ![Tables](../images/Table32.png) [dbo].[Apps]

---

## <a name="#description"></a>MS_Description

Apps installed across all Teams in the organisation.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_dbo.Apps: Id](../images/pkcluster.png)](#indexes) | Id | nvarchar(450) | 900 | NOT NULL |  | _A unique id (not the teams appid)_ |
|  | Name | nvarchar(max) | max | NULL allowed |  | _The name of the app provided by the app developer._ |
|  | Version | nvarchar(max) | max | NULL allowed |  | _The version number of the application._ |
|  | LastUpdatedDateTime | datetime2 | 8 | NULL allowed |  | _The date the row was last updated._ |
|  | Deleted | bit | 1 | NOT NULL | ((0)) | _Whether this record is deleted._ |


---

###### Author:  Rob Taylor

###### Copyright 2020 - All Rights Reserved

###### Created: 26 June 2020 11:20:43

