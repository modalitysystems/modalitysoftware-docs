# SQL Performance

The maximum count of concurrent SQL connections that TWA uses can be configured in the TWA configuraiton file.

MaximumSqlConnectionCount has a default of 95 and should be left at this unless advised otherwise.

In General:
- reducing this number could reduce performance.
- increasing this number could cause errors from clashing and deadlocks at the db and failure to refresh reports.
