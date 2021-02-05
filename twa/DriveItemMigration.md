## DriveItem Migration

When upgrading a collector from version ```twa-2021.1.28.5``` or below to anything above, then a migration script will need to be ran beforehand. This migration script prepares the database for a change to the DriveItems table. In which the CreatorEmail column in the DriveItem table is replaced with _HashCreatorEmail, an encrypted version of the initial value. As well as a new _HashMail column to the Users table for use with table joins. If the dacpac is successfully deployed before this, then you will lose all data in the CreatorEmail column.

The process goes as follows.
-   Stop the service and ensure it does not automatically start back up.
-   Run the migration script.
-   Upgrade TWA using prefered [method](/twa/UpgradingTeamworkAnalytics.html)
-   Start the service and configure to start automatically if required.

If you have tried to update without first running the migration script you should find your Service is failing to start. Your error log should contain a sql exception that tells you to run the migration script first. Please ensure you follow the steps above, making sure the TWA Service is not running and will not automatically start back up during the migration.