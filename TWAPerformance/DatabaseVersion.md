Database Version
================

When a new version of TWA Performance is released, the database model will be updated with a version number with the following format `2021.01.23`.
The version number of a deployed database can be found by querying the `[dbo].[VersionNumber]` table using the following SQL query:

`SELECT [Value] FROM [dbo].[VersionNumber]`

The result will contain a single row in the following format:

|Value|
|-----|
|`2021.01.23`|
