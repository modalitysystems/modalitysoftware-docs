Anonymisation
=============

TWA collects and stores user data from Microsoft Graph API and surfaces the data in reports. This includes four pieces of personally identifiable information (PII) per user:

|PII|Examples|
|---|---|
|Given name|*John*|
|Surname|*Smith*|
|Email address|*John.Smith@example.com*|
|User principal name|*john.smith@example.onmicrosoft.com*|
|[As shown in reports]|*John Smith (John.Smith@example.com)*|

In order to assist our customers adhering to data protection and privacy regulations, such as GDPR, TWA supports anonymisation of this data via a deterministic obfuscation algorithm.

|PII|Examples (Anonymised)|
|---|---|
|Given name|*gbo9mS*|
|Surname|*gGdp12U*|
|Email address|*Aa0lWbT5ibo9mS@example.com*|
|User principal name|*Aa0lWbz5ibo9ma@example.onmicrosoft.com*|
|[As shown in reports]|*Anon (Aa0lWbT5ibo9mS@example.com)*|

The data is anonymised as it is received from Microsoft's API before any further processing and storage. The obfuscation is reversible upon request.

Configuration
-------------
Users are anonymised according to configurable rules stored in the TWA database. To configure this feature, simply insert rows to the table named `configuration.UserObfuscationCriteria` using Microsoft SQL Server Management Studio (or an alternative). This table instructs TWA to anonymise users based on their attributes, e.g. anonymise all users who have `Country` set to `Germany` (both case-insensitive).

|PropertyName|Value|
|---|---|
|Country|Germany|
|Country|Deutschland|
|Country|France|
|Country|UK|

The property names and values are case-insensitive, but they must match the values returned by Microsoft Graph API (practically speaking, they must match real values stored in your Active Directory). E.g. you must specify "CompanyName", not "Company Name".

> You can make use of [Custom User Attributes](CustomUserAttributes.md), provided they are configured correctly.

Example response from Graph API:

`{
    ...
    "city": "Norwich",
    "companyName": "Example",
    "country": "United Kingdom",
    "department": "Development (UK)",
    "displayName": "John Smith",
    "givenName": "John",
    "jobTitle": "Software Engineer",
    "mail": "John.Smith@example.com",
    "mailNickname": "John.Smith",
    "officeLocation": "Norwich",
    "postalCode": "ABC 123",
    "preferredDataLocation": null,
    "preferredLanguage": null,
    "state": "Norfolk",
    "surname": "Smith",
    "usageLocation": "GB",
    ...
}`

Once TWA has anonymised a user based on the rules above, it keeps a record of the user's User Principal Name (stored as a hash, see below). This is to ensure that the user continues to be anonymised even if the data is updated (for example if their `Country` is changed to another location).

If you wish to exclude a user from further anonymisation, you must locate them in the table named `dbo.Users`, copy their EID, then find and remove the same value from the `dbo.ObfuscatedUsers` table.

User Principal Name as a key
----------------------------
In some situations user data is related from one Microsoft source to another using User Principal Name as the "key". For example TWA relates users' daily Teams usage statistics to their department, city and country data using User Principal Name.

Because User Principal Names contain PII, TWA replaces them with an irreversible hash (SHA256 algorithm). This removes PII whilst still allowing for the data to be related. This is rule is applied to all users in any situation where User Principal Name is used as a key, regardless of configuration.

|Original|Replacement|
|---|---|
|john.smith@example.onmicrosoft.com|932132B62E416813A1947914DB8BB807DFB9C671701DB6D08E8AEB966B67B3F4|
