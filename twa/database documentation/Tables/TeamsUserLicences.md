#### 

[Tables](Tables.md) > dbo.TeamsUserLicences

# ![Tables](../images/Table32.png) [dbo].[TeamsUserLicences]

---

## <a name="#description"></a>MS_Description

History of Teams License assignment per user (from when TWA was installed). Use the max AssignedDateTime for the current license status.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_TeamsUserLicences: AssignedDateTime\UserId](../images/pkcluster.png)](#indexes) | AssignedDateTime | datetime2 | 8 | NOT NULL |  | _Timestamp for when the Teams License was assigned_ |
| [![Cluster Primary Key PK_TeamsUserLicences: AssignedDateTime\UserId](../images/pkcluster.png)](#indexes) | UserId | uniqueidentifier | 16 | NOT NULL |  | _Foreign Key to Id in dbo.Users._ |
|  | CapabilityStatus | nvarchar(max) | max | NOT NULL |  | _Whether the license is Enabled or Deleted (removed)._ |
|  | Deleted | bit | 1 | NOT NULL | ((0)) | _Whether this record is deleted._ |


---

###### Author:  Rob Taylor

###### Copyright 2020 - All Rights Reserved

###### Created: 26 June 2020 11:20:43

