# reporting UsersBase

---

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Description |
|---|---|---|---|
| UserID | uniqueidentifier | 16 |
| Enabled | bit | 1 |
| Deleted | bit | 1 |
| IsGuest | bit | 1 |
| FriendlyIdentifier | nvarchar(450) | 900 |
| FullName | nvarchar(max) | max |
| UserPrincipalName | nvarchar(450) | 900 |
| Mail | nvarchar(450) | 900 |
| GivenName | nvarchar(max) | max |
| Surname | nvarchar(max) | max |
| PreferredLanguage | nvarchar(max) | max |
| UsageLocation | nvarchar(max) | max |
| OfficeLocation | nvarchar(max) | max |
| Department | nvarchar(max) | max |
| City | nvarchar(max) | max |
| Country | nvarchar(max) | max |
| JobTitle | nvarchar(max) | max |
| UserName | nvarchar(max) | max |
| DataType | varchar(5) | 5 |
| DomainName | nvarchar(450) | 900 |


