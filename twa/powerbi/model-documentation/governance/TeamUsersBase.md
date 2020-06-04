# shared TeamUsersBase

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Description |
|---|---|---|---|
| TeamId | uniqueidentifier | 16 |
| UserId | uniqueidentifier | 16 |
| UserType | nvarchar(max) | max |
| LastUpdatedDateTime | datetime2 | 8 |
| Deleted | bit | 1 |
| IsOwner | bit | 1 |
| IsMember | bit | 1 |


