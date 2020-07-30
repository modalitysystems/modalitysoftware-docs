# SQL Performance

The maximum count of concurrent SQL connections that TWA uses can be configured in the TWA configuration file.

MaximumSqlConnectionCount has a default of 95 and should be left at this unless advised otherwise.

In General:
- reducing this number could reduce performance.
- increasing this number could cause errors from clashing and deadlocks at the db and failure to refresh reports.

#

The command timeout used by TWA when using Sql Stored Procedures, typically for inserting/updating batches of data.

StoredProcedureTimeoutInSeconds has a default value of 120 seconds and should not be modified unless advised otherwise.