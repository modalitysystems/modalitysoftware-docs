#### 

[Tables](Tables.md) > dbo.DriveItems

# ![Tables](../images/Table32.png) [dbo].[DriveItems]

---

## <a name="#description"></a>MS_Description

Files in Teams.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_dbo.DriveItems: Id](../images/pkcluster.png)](#indexes) | Id | nvarchar(450) | 900 | NOT NULL |  | _The unique identifier of the item._ |
|  | _HashCreatorEmail | nvarchar(64) | 900 | NULL allowed |  | _The Hashed email of the user which created the file._ |
|  | FileMimeType | nvarchar(450) | 900 | NULL allowed |  | _The mime type of the file._ |
|  | CreatedDateTime | datetime2 | 8 | NOT NULL |  | _Date and time of item creation._ |
|  | LastModifiedDateTime | datetime2 | 8 | NOT NULL |  | _Date and time the item was last modified._ |
|  | TeamId | uniqueidentifier | 16 | NOT NULL |  | _Foreign Key to Id in dbo.Teams._ |
|  | LastUpdatedDateTime | datetime2 | 8 | NULL allowed |  | _The date the row was last updated._ |
|  | Deleted | bit | 1 | NOT NULL | ((0)) | _Whether this record is deleted._ |
|  | FileSizeInBytes | bigint | 8 | NULL |  | _The Size of the File._ |

---

###### Author:  Rob Taylor

###### Copyright 2020 - All Rights Reserved

###### Created: 26 June 2020 11:20:43

