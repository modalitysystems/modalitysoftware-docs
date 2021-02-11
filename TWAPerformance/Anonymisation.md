# Anonymisation of Personally identifiable information (PII) in Teams Analytics (TWA) Performance

TWA Performance collects and stores data from Microsoft Graph API and surfaces the data in reports.
This includes several pieces of PII relating touser and call/meeting participants.

If there is a requirement to avoid storing PII for some or all users , e.g. to comply with the General Data Protection Regulation, then TWA Performance can be configured anonymise some of the data it collects.

## How Anonymisation Works

PII is obfuscated using a deterministic obfuscation algorithm. The PII is obfuscated during the collection process and is never be stored as plain text.

|PII|Examples|Examples (Anonymised)|
|---|---|---|
|Given name|*John*|*gbo9mS*|
|Surname|Smith*|*gGdp12U*|
|Email address|*John.Smith@example.com*|*Aa0lWbT5ibo9mS@example.com*|
|User principal name|*john.smith@example.onmicrosoft.com*|*Aa0lWbz5ibo9ma@example.onmicrosoft.com*|
|[As shown in reports]|*John Smith (John.Smith@example.com)*|*Anon (Aa0lWbT5ibo9mS@example.com)*|

Note, due to the way Graph API works we cannot obfuscate users phone numbers selectively. TWA does not pull phone numbers from Active Directory attributes (they are rarely 100% right or accurate) so does not store users phone numbers as user attributes. Graph API presents the phone numbers in call records. Since we can't tie phone numbers to specific users, we can't seletively obfuscated just some phone numbers from the database. It would be possible to obfuscated all phone numbers, but this would be a future feature request if required.

## How Anonymisation is Configured

### Configuration

Anonymisation is configured using TWA Performance's Azure Storage Account, using a table named `AnonymisationCriteria`. This table can be configured to anonymise Users, Calls and Streams by defining and a Routine. The Currently supported Routines are:

- CheckUserAnonymiseUser - Anonymise incoming Users based on the values of their Active Directory attributes.
- CheckCallAnonymiseCallOrganiser - Anonymise the OrganiserId of a Call in the Call Table based on other columns.
- CheckStreamAnonymiseStreamUser - Anonymise the UserId of a Stream in the Stream Table based on other columns.
- CheckStreamAnonymiseStreamOrganiser - Anonymise the OrganiserId of a Stream in the Stream Table based on other columns.

Changes can be made with the Microsot Azure Storage Explorer app or via https://portal.azure.com/

> The table will not be present if the TWA Performance has never been allowed to run, in which case it is fine to create the table manually. All that will be required is the table name (`AnonymisationCriteria`).

The table uses 3 additional named columns, Routine, PropertyName, ValueToMatch as well as the standard columns PARTITIONKEY and ROWKEY. These have the following meanings within the context of the table:

| Column name | Meaning |
| ------------ | ----------- |
| PARTITIONKEY | Not used in Anonymisation but must be a unique in combination with ROWKEY. |
| ROWKEY | Not used in Anonymisation but must be a unique in combination with PARTITIONKEY. |
| Routine | Select one of the Routines mentioned above this will define the Table to anonymise as well as what part will be anonymised. |
| PropertyName | The name of an Active Directory property to test against in the case of Users. Or the Table Columns to test against in the case of Calls and Streams.  |
| ValueToMatch |  A value that, when matching, will trigger anonymisation for that Routine. |

Both columns are case-insensitive, but they must match spacing and punctuation of the data returned by Microsoft Graph API (practically speaking, they must match the values stored in your Active Directory). E.g. you must specify "CompanyName", not "Company Name".

Here is an example configuration. Using this example, TWA Performance would anonymise all users with their Country set to Germany or France, and all users in the Legal department.

| PARTITIONKEY | ROWKEY | Routine | PropertyName | ValueToMatch |
| ------------ | ----------- | ----------- | ----------- | ----------- |
| 1 | | CheckUserAnonymiseUser | Country | Germany |
| 2 | | CheckUserAnonymiseUser | Department | Legal |
| 3 | | CheckCallAnonymiseCallOrganiser | OrganiserUserType | 2 |
| 4 | | CheckStreamAnonymiseStreamUser | UserType | 0 |
| 5 | | CheckStreamAnonymiseStreamOrganiser | OrganiserUserType | 3 |

> Note: Custom user properties cannot currently be used as criteria.

### PII Register

If a user is anonymised due to matching Criteria then their ID is added to a register. The register is used to ensure that the user's PII continues to be anonymised even if their attributes change such that they no longer match the Criteria. (The ID itself is stored as an anonymous hash, not plain text).

This register is kept on TWA Performance's Azure Storage Account, in a table named `UserAnonymisationRegister`.

If required, you can manually remove users from the register with Microsot Azure Storage Explorer app, or via https://portal.azure.com/

You must first you must locate the desired user in the TWA Performance SQL database, in the table named `dbo.Users`, and copy the value from the column called `_HashUserId`. Then find the same value in `UserAnonymisationRegister` under the ROWKEY column, and delete the entire row.

Here is an example of data in the `UserAnonymisationRegister` table: 

| PARTITIONKEY | ROWKEY |
| ------------ | ----------- |
| HashUserId | 409E09A65CD24665A6EF4E8EEC0AAEB7F627F058F6475269B0C699DEEA553E2B |
| HashUserId | 3FDDE7DDA7C39BE5E4A6BEB3CCEEB258A908C89933D71FECD90B7829BB25A579 |
| HashUserId | 42F4E4BB5453E54CB5F51CF1EADBFA51BDAEDDB21F998C8A8AA109F43D0971EE |
| HashUserId | 524FD0DBF6B35E5C3477FA7A5E9CAAF8793ED7CE44F0D198D944F08D0AE77ED7 |
| HashUserId | 4A5D7A23C8B543CB2CC0F4CC13847AD72D3EB37AE8AA163E786613312EE5672A |
| HashUserId | 3F4A6FF1C7ADAD7426B107E8FE44BCACD291540CCB7F60F281FD600425665745 |

### Key fields

"Key" fields allow data to be related from one part of Microsoft Graph API to another.

For example, User Principal Name is used as the key between Device usage statistics and Active Directory data. This allows for reports on, e.g., the number of people using Android in the Sales department.

When key fields contain PII, TWA Performance stores additional hashed<sup>†</sup> versions of the fields and uses these for relating data instead of the original. This gives TWA Performance the freedom to relate data from multiple sources without depending upon PII.

| Original                           | Replacement                                                  |
| ---------------------------------- | ------------------------------------------------------------ |
| john.smith@example.onmicrosoft.com | 932132B62E416813A1947914DB8BB807DFB9C671701DB6D08E8AEB966B67B3F4 |

<sup>†</sup>A hash is an anonymous string of letters and numbers calculated from the original value. The hashing algorithm used by TWA Performance is a case-insensitive version of SHA-256. For more information, see https://en.wikipedia.org/wiki/SHA-2
