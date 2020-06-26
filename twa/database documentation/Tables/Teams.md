#### 

[Tables](Tables.md) > dbo.Teams

# ![Tables](../images/Table32.png) [dbo].[Teams]

---

## <a name="#description"></a>MS_Description

Teams within the organisation.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_dbo.Teams: Id](../images/pkcluster.png)](#indexes) | Id | uniqueidentifier | 16 | NOT NULL |  | _The unique identifier for the team._ |
|  | DisplayName | nvarchar(max) | max | NULL allowed |  | _The name of the team._ |
|  | Description | nvarchar(max) | max | NULL allowed |  | _ An optional description for the team._ |
|  | IsArchived | bit | 1 | NOT NULL |  | _Whether this team is archived mode._ |
|  | Visibility | nvarchar(max) | max | NULL allowed |  | _Specifies the visibility of the team. Possible values are: Private, Public, or Hiddenmembership; blank values are t_ |
|  | CreatedDateTime | datetime2 | 8 | NOT NULL |  | _Timestamp of when the group was created_ |
|  | LastUpdatedDateTime | datetime2 | 8 | NULL allowed |  | _The date the row was last updated._ |
|  | Deleted | bit | 1 | NOT NULL | ((0)) | _Whether this record is deleted._ |


---

###### Author:  Rob Taylor

###### Copyright 2020 - All Rights Reserved

###### Created: 26 June 2020 11:20:43

