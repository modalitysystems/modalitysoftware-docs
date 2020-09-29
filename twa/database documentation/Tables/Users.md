#### 

[Tables](Tables.md) > dbo.Users

# ![Tables](../images/Table32.png) [dbo].[Users]

---

## <a name="#description"></a>MS_Description

Users within the organisations Asure Active Directory.

## <a name="#columns"></a>Columns

| Key | Name | Data Type | Max Length (Bytes) | Nullability | Default | Description |
|---|---|---|---|---|---|---|
| [![Cluster Primary Key PK_dbo.Users: Id](../images/pkcluster.png)](#indexes) | Id | uniqueidentifier | 16 | NOT NULL |  | _The unique identifier for the user._ |
|  | Eid | nvarchar(64) | 16 | NOT NULL |  | _The unique identifier for the user for usage tables._ |
|  | GivenName | nvarchar(max) | max | NULL allowed |  | _The given name (first name) of the user._ |
|  | Surname | nvarchar(max) | max | NULL allowed |  | _The user's surname (family name or last name)._ |
|  | JobTitle | nvarchar(max) | max | NULL allowed |  | _The user’s job title._ |
|  | OfficeLocation | nvarchar(max) | max | NULL allowed |  | _The office location in the user's place of business._ |
|  | PreferredLanguage | nvarchar(max) | max | NULL allowed |  | _The preferred language for the user. Should follow ISO 639-1 Code; for example "en-US"._ |
|  | UsageLocation | nvarchar(max) | max | NULL allowed |  | _A two letter country code (ISO standard 3166). Required for users that will be assigned licenses due to legal requirement to che_ |
|  | City | nvarchar(max) | max | NULL allowed |  | _The city in which the user is located._ |
|  | Country | nvarchar(max) | max | NULL allowed |  | _The country/region in which the user is located; for example, "US" or "UK"._ |
|  | Department | nvarchar(max) | max | NULL allowed |  | _The name for the department in which the user works._ |
| [![Indexes IX_IsDeleted_UserPrincipalName dbo_Users_UserPrincipalName IX_UserPrincipalName](../images/Index.png)](#indexes)(3) | UserPrincipalName | nvarchar(450) | 900 | NULL allowed |  | _The user principal name (UPN) of the user. The UPN is an Internet-style login name for the user based on the Internet standard R_ |
|  | Mail | nvarchar(450) | 900 | NULL allowed |  | _The SMTP address for the user, for example, "jeff@contoso.onmicrosoft.com"._ |
|  | Enabled | bit | 1 | NOT NULL | ((0)) | _Whether the user is enabled._ |
|  | LastUpdatedDateTime | datetime2 | 8 | NULL allowed |  | _The date the row was last updated._ |
| [![Indexes IX_IsDeleted_UserPrincipalName](../images/Index.png)](#indexes) | Deleted | bit | 1 | NOT NULL | ((0)) | _Whether this record is deleted._ |


---

###### Author:  Rob Taylor

###### Copyright 2020 - All Rights Reserved

###### Created: 26 June 2020 11:20:43

