# Custom User Attributes

In addition to basic user attributes like `id`, `country` and `department`, Teamwork Analytics allows you to report on _custom user attributes_ from your active directory.

## Gathering the attributes

The configure custom attributes, you must add their names to the `configuration.CustomUserProperties` table in the TWA SQL database.

The table has one column called `Name` which supports alphanumeric characters and underscores (`a-z`, `A-Z`, `0-9`, `_`), as in the following examples:

| Name |
| ---- |
| companyName |
| faxNumber |
| mailNickname |
| extension_b3438d3417634595a687eadbf73b5d45_MyAttribute1 |
| extension_b3438d3417634595a687eadbf73b5d45_MyAttribute2 |
| extension_b3438d3417634595a687eadbf73b5d45_MyAttribute3 |


The next time TWA queries user data it will search for these attributes and save any values it finds to the SQL database within the `dbo.UserProperties` table.

## Filtering by custom attributes in Power BI

TBC