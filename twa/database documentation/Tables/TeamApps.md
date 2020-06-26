#### 

[Tables](Tables.md) > dbo.TeamApps

# ![Tables](../images/Table32.png) [dbo].[TeamApps]

---

## <a name="#description"></a>MS_Description

Link table between dbo.Teams and dbo.Apps. Can be used to identify teams installed in an app.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_dbo.TeamApps: AppId\TeamId](../images/pkcluster.png)](#indexes)[![Indexes IX_AppId](../../../Images/Index.png)](#indexes) | AppId | nvarchar(450) | 900 | NOT NULL |  | _Foreign Key to Id in dbo.Apps_ |
| [![Cluster Primary Key PK_dbo.TeamApps: AppId\TeamId](../images/pkcluster.png)](#indexes)[![Indexes IX_TeamId](../../../Images/Index.png)](#indexes) | TeamId | uniqueidentifier | 16 | NOT NULL |  | _Foreign Key to Id in dbo.Teams_ |
|  | LastUpdatedDateTime | datetime2 | 8 | NULL allowed |  | _The date the row was last updated._ |
|  | Deleted | bit | 1 | NOT NULL | ((0)) | _Whether this record is deleted._ |


---

###### Author:  Rob Taylor

###### Copyright 2020 - All Rights Reserved

###### Created: 26 June 2020 11:20:43

