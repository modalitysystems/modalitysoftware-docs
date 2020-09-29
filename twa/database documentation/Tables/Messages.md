#### 

[Tables](Tables.md) > dbo.Messages

# ![Tables](../images/Table32.png) [dbo].[Messages]

---

## <a name="#description"></a>MS_Description

Messages within Teams Channels.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_dbo.Messages: Id](../images/pkcluster.png)](#indexes) | Id | bigint | 8 | NOT NULL |  | _Unique Id of the message._ |
| [![Indexes IX_ParentMessageId](../images/Index.png)](#indexes) | ParentMessageId | bigint | 8 | NULL allowed |  | _Foreign Key to Id in dbo.Messages. Null if the message was the start of a thread. Has a value if the message was a reply._ |
|  | MessageType | nvarchar(max) | max | NULL allowed |  | _The type of chat message. The possible values are: message._ |
|  | CreatedDateTime | datetime2 | 8 | NOT NULL |  | _Timestamp of when the chat message was created._ |
|  | LastModifiedDateTime | datetime2 | 8 | NULL allowed |  | _Timestamp of when the chat message is created or edited, including when a reply is made (if it's a root chat message in a channe_ |
|  | DeletedDateTime | datetime2 | 8 | NULL allowed |  | _Timestamp at which the chat message was deleted, or null if not deleted._ |
|  | Deleted | bit | 1 | NOT NULL | ((0)) | _Whether this record is deleted._ |
|  | Importance | nvarchar(max) | max | NULL allowed |  | _The importance of the chat message. The possible values are: normal, high, urgent._ |
|  | Locale | nvarchar(max) | max | NULL allowed |  | _Locale of the chat message set by the client._ |
|  | ContentType | nvarchar(max) | max | NULL allowed |  | _The media type of the content._ |
| [![Indexes IX_ChannelId](../images/Index.png)](#indexes) | ChannelId | nvarchar(450) | 900 | NULL allowed |  | _Foreign Key to Id in dbo.Channels._ |
|  | TeamId | uniqueidentifier | 16 | NOT NULL |  | _Foreign Key to Id in dbo.Teams._ |
|  | NumberOfGifs | int | 4 | NOT NULL | ((0)) | _Number of Gifs in the message._ |
|  | NumberOfOtherImages | int | 4 | NOT NULL | ((0)) | _Number of images in the message excluding gifs._ |
| [![Indexes IX_UserId](../images/Index.png)](#indexes) | UserId | uniqueidentifier | 16 | NULL allowed |  | _Foreign Key to Id in dbo.Users. Null if the message was posted by an app._ |
| [![Indexes IX_AppId](../images/Index.png)](#indexes) | AppId | nvarchar(450) | 900 | NULL allowed |  | _Foreign Key to Id in dbo.Apps. Null if the message was posted by a user_ |
|  | LastUpdatedDateTime | datetime2 | 8 | NULL allowed |  | _The date the row was last updated._ |


---

###### Author:  Rob Taylor

###### Copyright 2020 - All Rights Reserved

###### Created: 26 June 2020 11:20:43

