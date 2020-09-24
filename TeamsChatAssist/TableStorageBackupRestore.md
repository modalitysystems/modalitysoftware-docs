# Backup and Restore Table Storage

Now that you have provisioned settings for your environment within table storage it would be a good idea to take a backup in case you ever need to restore your settings. The only way to do this is with a Microsoft utility called AzCopy. 

The latest version no longer supports backup of table storage so you need to be using [AzCopy Version 7.3](https://aka.ms/downloadazcopynet)

You will require the **Storage Account Name** and also the **Storage Account Key** which you would get from the [Azure Portal](https://portal.azure.com/#home)

# Backup

Once AcCopy has been installed change directory to "C:\Program Files (x86)\Microsoft SDKs\Azure\AzCopy" and run the following command for each table that you want to backup

AzCopy.exe /Source:"https://***StorageAccountName***.table.core.windows.net/***TableName***" /Dest:"***BackupPath***" /SourceKey:"***StorageAccountKey***" /Manifest:"***StorageAccountName***.***TableName***.manifest"

# Restore

To restore a table run the following command

AzCopy.exe /Source:"***BackupPath***" /Dest:"https://***StorageAccountName***.table.core.windows.net/***TableName***" /DestKey:"***StorageAccountKey***" /Manifest:"***StorageAccountName***.***TableName***.manifest" /EntityOperation:InsertOrReplace