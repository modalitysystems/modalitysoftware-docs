#### 

[Tables](Tables.md) > dbo.Mentions

# ![Tables](../images/Table32.png) [dbo].[Mentions]

---

## <a name="#description"></a>MS_Description

Mentioned entities within Messages.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_dbo.Mentions: MessageId\Index](../images/pkcluster.png)](#indexes)[![Indexes IX_MessageId](../images/Index.png)](#indexes) | MessageId | bigint | 8 | NOT NULL |  | _Foreign Key to Id in dbo.Messages._ |
| [![Cluster Primary Key PK_dbo.Mentions: MessageId\Index](../images/pkcluster.png)](#indexes) | Index | int | 4 | NOT NULL | ((0)) | _Unique Id for the Mention within a message._ |
|  | Type | nvarchar(max) | max | NULL allowed |  | _The type of entity which was mentioned in the message._ |
| [![Indexes IX_UserId](../images/Index.png)](#indexes) | MentionedUserId | uniqueidentifier | 16 | NULL allowed |  | _Foreign Key to Id in dbo.Users. Null if a user was not mentioned._ |
| [![Indexes IX_AppId](../images/Index.png)](#indexes) | MentionedAppId | nvarchar(450) | 900 | NULL allowed |  | _Foreign Key to Id in dbo.Apps. Null if an app was not mentioned._ |
|  | MentionedChannelId | nvarchar(450) | 900 | NULL allowed |  | _Foreign Key to Id in dbo.Channels. Null if a channel was not mentioned._ |
|  | MentionText | nvarchar(max) | max | NULL allowed |  | _String used to represent the mention. For example, a user's display name, a team name._ |
| [![Indexes IX_TeamId](../images/Index.png)](#indexes) | TeamId | uniqueidentifier | 16 | NULL allowed |  | _Foreign Key to Id in dbo.Teams._ |
| [![Indexes IX_ChannelId](../images/Index.png)](#indexes) | ChannelId | nvarchar(450) | 900 | NULL allowed |  | _Foreign Key to Id in dbo.Channels._ |
|  | LastUpdatedDateTime | datetime2 | 8 | NULL allowed |  | _The date the row was last updated._ |
|  | Deleted | bit | 1 | NOT NULL | ((0)) | _Whether this record is deleted._ |


---

###### Author:  Rob Taylor

###### Copyright 2020 - All Rights Reserved

###### Created: 26 June 2020 11:20:43

