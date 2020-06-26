#### 

[Tables](Tables.md) > dbo.TeamUsers

# ![Tables](../images/Table32.png) [dbo].[TeamUsers]

---

## <a name="#description"></a>MS_Description

Link table between dbo.Users and dbo.Teams. Can be used to identify which users are in each team.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_dbo.TeamUsers: TeamId\UserId](../images/pkcluster.png)](#indexes)[![Indexes IX_TeamId](../../../Images/Index.png)](#indexes) | TeamId | uniqueidentifier | 16 | NOT NULL |  | _Foreign Key to Id in dbo.Teams._ |
| [![Cluster Primary Key PK_dbo.TeamUsers: TeamId\UserId](../images/pkcluster.png)](#indexes)[![Indexes IX_UserId](../../../Images/Index.png)](#indexes) | UserId | uniqueidentifier | 16 | NOT NULL |  | _Foreign Key to Id in dbo.Users._ |
|  | UserType | nvarchar(max) | max | NULL allowed |  | _The type of membership to the team. For example owner or member._ |
|  | LastUpdatedDateTime | datetime2 | 8 | NULL allowed |  | _The date the row was last updated._ |
|  | Deleted | bit | 1 | NOT NULL | ((0)) | _Whether this record is deleted._ |


---

###### Author:  Rob Taylor

###### Copyright 2020 - All Rights Reserved

###### Created: 26 June 2020 11:20:43

