#### 

[Tables](Tables.md) > dbo.Attachments

# ![Tables](../images/Table32.png) [dbo].[Attachments]

---

## <a name="#description"></a>MS_Description

Attached files/content to Messages.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_dbo.Attachments: Index\MessageId](../images/pkcluster.png)](#indexes) | Index | int | 4 | NOT NULL |  | _Unique Identifier for the Attachement within the message_ |
|  | ContentType | nvarchar(max) | max | NULL allowed |  | _The media type of the content attachment._ |
|  | ContentUrl | nvarchar(max) | max | NULL allowed |  | _URL for the content of the attachment._ |
|  | Name | nvarchar(max) | max | NULL allowed |  | _Name of the attachment._ |
|  | ThumbnailUrl | nvarchar(max) | max | NULL allowed |  | _URL to a thumbnail image._ |
| [![Cluster Primary Key PK_dbo.Attachments: Index\MessageId](../images/pkcluster.png)](#indexes)[![Indexes IX_MessageId](../images/Index.png)](#indexes) | MessageId | bigint | 8 | NOT NULL |  | _Foreign Key to Id in dbo.Messages._ |
|  | LastUpdatedDateTime | datetime2 | 8 | NULL allowed |  | _The date the row was last updated._ |
|  | Deleted | bit | 1 | NOT NULL | ((0)) | _Whether this record is deleted._ |


---

###### Author:  Rob Taylor

###### Copyright 2020 - All Rights Reserved

###### Created: 26 June 2020 11:20:43

