#### 

[Tables](Tables.md) > dbo.Channels

# ![Tables](../images/Table32.png) [dbo].[Channels]

---

## <a name="#description"></a>MS_Description

Teams Channels in the organisation.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_dbo.Channels: Id](../images/pkcluster.png)](#indexes) | Id | nvarchar(450) | 900 | NOT NULL |  | _The channel's unique identifier._ |
|  | DisplayName | nvarchar(max) | max | NULL allowed |  | _Channel name as it will appear to the user in Microsoft Teams._ |
|  | Description | nvarchar(max) | max | NULL allowed |  | _Optional textual description for the channel._ |
| [![Indexes IX_TeamId](../images/Index.png)](#indexes) | TeamId | uniqueidentifier | 16 | NOT NULL |  | _Foreign Key to Id in dbo.Teams._ |
|  | LastUpdatedDateTime | datetime2 | 8 | NULL allowed |  | _The date the row was last updated._ |
|  | Deleted | bit | 1 | NOT NULL | ((0)) | _Whether this record is deleted._ |


---

###### Author:  Rob Taylor

###### Copyright 2020 - All Rights Reserved

###### Created: 26 June 2020 11:20:43

