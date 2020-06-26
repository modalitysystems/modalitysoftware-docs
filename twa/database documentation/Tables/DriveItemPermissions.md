#### 

[Tables](Tables.md) > dbo.DriveItemPermissions

# ![Tables](../images/Table32.png) [dbo].[DriveItemPermissions]

---

## <a name="#description"></a>MS_Description

Permissions granted on files.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_dbo.DriveItemPermissions: Id\DriveItemId\SortKey](../images/pkcluster.png)](#indexes) | Id | nvarchar(450) | 900 | NOT NULL |  | _The unique identifier of the permission among all permissions on the item_ |
| [![Cluster Primary Key PK_dbo.DriveItemPermissions: Id\DriveItemId\SortKey](../images/pkcluster.png)](#indexes) | DriveItemId | nvarchar(450) | 900 | NOT NULL |  | _Foreign Key to Id in dbo.DriveItems._ |
| [![Cluster Primary Key PK_dbo.DriveItemPermissions: Id\DriveItemId\SortKey](../images/pkcluster.png)](#indexes) | SortKey | nvarchar(50) | 100 | NOT NULL |  | _Key for permission within the drive item permission set._ |
|  | Type | nvarchar(30) | 60 | NOT NULL |  | _The type of the permission_ |
|  | Scope | nvarchar(30) | 60 | NOT NULL |  | _The scope of the permission_ |
|  | DisplayName | nvarchar(450) | 900 | NULL allowed |  | _Name of the User the permission relates to._ |
|  | Email | nvarchar(450) | 900 | NULL allowed |  | _Email of the User the permission relates to._ |
|  | UserId | uniqueidentifier | 16 | NULL allowed |  | _Foreign Key to Id in dbo.Users._ |
|  | LastUpdatedDateTime | datetime2 | 8 | NULL allowed |  | _The date the row was last updated._ |
|  | Deleted | bit | 1 | NOT NULL | ((0)) | _Whether this record is deleted._ |


---

###### Author:  Rob Taylor

###### Copyright 2020 - All Rights Reserved

###### Created: 26 June 2020 11:20:43

