#### 

[Tables](Tables.md) > dbo.Reactions

# ![Tables](../images/Table32.png) [dbo].[Reactions]

---

## <a name="#description"></a>MS_Description

Reactions provided by users to Messages.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_dbo.Reactions: MessageId\UserId](../images/pkcluster.png)](#indexes)[![Indexes IX_MessageId](../images/Index.png)](#indexes) | MessageId | bigint | 8 | NOT NULL |  | _Foreign Key to Id in dbo.Messages. The Id of the message reacted to._ |
| [![Cluster Primary Key PK_dbo.Reactions: MessageId\UserId](../images/pkcluster.png)](#indexes)[![Indexes IX_UserId](../images/Index.png)](#indexes) | UserId | uniqueidentifier | 16 | NOT NULL |  | _Foreign Key to Id in dbo.Users. The User who made the reaction_ |
|  | Type | nvarchar(max) | max | NULL allowed |  | _The type of reaction.  Supported values are like, angry, sad, laugh, heart, surprised._ |
|  | CreatedDateTime | datetime2 | 8 | NOT NULL |  | _Timestamp of the reaction._ |
|  | LastUpdatedDateTime | datetime2 | 8 | NULL allowed |  | _The date the row was last updated._ |
|  | Deleted | bit | 1 | NOT NULL | ((0)) | _Whether this record is deleted._ |


---

###### Author:  Rob Taylor

###### Copyright 2020 - All Rights Reserved

###### Created: 26 June 2020 11:20:43

