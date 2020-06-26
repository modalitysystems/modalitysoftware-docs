#### 

[Tables](Tables.md) > dbo.UserProperties

# ![Tables](../images/Table32.png) [dbo].[UserProperties]

---

## <a name="#description"></a>MS_Description

Custom User attributes. Will be empty if custom attributes are not configured.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_dbo.UserProperties: UserId\Path](../images/pkcluster.png)](#indexes) | UserId | uniqueidentifier | 16 | NOT NULL |  | _Foreign Key to Id in dbo.Users._ |
| [![Cluster Primary Key PK_dbo.UserProperties: UserId\Path](../images/pkcluster.png)](#indexes) | Path | nvarchar(450) | 900 | NOT NULL |  | _The ad attribute name_ |
|  | Value | nvarchar(max) | max | NULL allowed |  | _The value of the ad attibute._ |
|  | LastUpdatedDateTime | datetime2 | 8 | NULL allowed |  | _The date the row was last updated._ |
|  | Deleted | bit | 1 | NOT NULL | ((0)) | _Whether this record is deleted._ |


---

###### Author:  Rob Taylor

###### Copyright 2020 - All Rights Reserved

###### Created: 26 June 2020 11:20:43

