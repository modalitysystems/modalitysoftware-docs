# Anonymisation of PII in Teams Analytics (TWA) Performance

TWA Performance collects and stores data from Microsoft Graph API and surfaces the data in reports.
This includes several pieces of PII relating to members, guests, and call participants.

If there is a requirement to avoid storing PII, e.g. to comply with the General Data Protection Regulation, then TWA Performance can be configured anonymise the data it collects.

## How Anonymisation is Configured

### Criteria

Anonymisation is configured using TWA Performance's Azure Storage Account, using a table named `UserAnonymisationCriteria`. This table instructs Teamwork Analytics to anonymise a users based on the values of their Active Directory attributes.

Changes can be made with the Microsot Azure Storage Explorer app or via https://portal.azure.com/

> Changes will not take effect until the M365 Process

> The table will not be present if the TWA Performance has never been allowed to run, in which case it is fine to create the table manually. All that will be required is the table name (`UserAnonymisationCriteria`).

The table uses the standardised column names, PARTITIONKEY and ROWKEY. These have the following meanings within the context of the table:

| Column name | Meaning |
| ------------ | ----------- |
| PARTITIONKEY | The name of an Active Directory property to test against each user |
| ROWKEY | A value that, when matching, will trigger anonymisation for a user |

Both columns are case-insensitive, but they must match spacing and punctuation of the data returned by Microsoft Graph API (practically speaking, they must match the values stored in your Active Directory). E.g. you must specify "CompanyName", not "Company Name".

Here is an example configuration. Using this example, TWA Performance would anonymise all users with their Country set to Germany or France, and all users in the Legal department.

| PARTITIONKEY | ROWKEY |
| ------------ | ----------- |
| Country | Germany |
| country | FRANCE |
| Department | Legal |

> Note: Custom user properties cannot currently be used as criteria.

### Register

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

### Call data

TWA Performance currently stores Organiser and Participant IDs. These can be anonymised using a Configuration setting named `UserAnonymisationEnabledForCallData` in the Call Parsing Function App.

When set to `true`, all Organiser and Participant IDs will be obfuscated.

## How Anonymisation Works

PII is obfuscated using a deterministic obfuscation algorithm. The PII is obfuscated during the collection process and is never be stored as plain text. The obfuscation is reversible upon request but requires Modality support, if required please contact software.support@modalitysystems.com

|PII|Examples|Examples (Anonymised)|
|---|---|---|
|Given name|*John*|*gbo9mS*|
|Surname|Smith*|*gGdp12U*|
|Email address|*John.Smith@example.com*|*Aa0lWbT5ibo9mS@example.com*|
|User principal name|*john.smith@example.onmicrosoft.com*|*Aa0lWbz5ibo9ma@example.onmicrosoft.com*|
|[As shown in reports]|*John Smith (John.Smith@example.com)*|*Anon (Aa0lWbT5ibo9mS@example.com)*|

### Key fields

"Key" fields allow data to be related from one part of Microsoft Graph API to another.

For example, User Principal Name is used as the key between Device usage statistics and Active Directory data. This allows for reports on, e.g., the number of people using Android in the Sales department.

When key fields contain PII, TWA Performance stores additional hashed<sup>†</sup> versions of the fields and uses these for relating data instead of the original. This gives TWA Performance the freedom to relate data from multiple sources without depending upon PII.

| Original                           | Replacement                                                  |
| ---------------------------------- | ------------------------------------------------------------ |
| john.smith@example.onmicrosoft.com | 932132B62E416813A1947914DB8BB807DFB9C671701DB6D08E8AEB966B67B3F4 |

<sup>†</sup>A hash is an anonymous string of letters and numbers calculated from the original value. The hashing algorithm used by TWA Performance is a case-insensitive version of SHA-256. For more information, see https://en.wikipedia.org/wiki/SHA-2
