Different types of scans can be scheduled. *

There are 5 types, which can be configured using the following Id's
- Id 0 = Main
- Id 1 = Reports
- Id 2 = Messages
- Id 3 = Files
- Id 4 = [Data Retention](DataRetention.md)

You can only have one of each Id.

These can be configured to run at different times
- -1 = Continuous
- 0 = 00:00 (midnight)
- 1 = 01:00 (1am)
- ...
- 12 = 12:00 (midday)
- 13 = 13:00 (1pm)
- ...
- 23 = 23:00 (11pm)

If a time is specified (0-23), then the scan for that type will be run everyday at that time, providing the last scan for that type has completed. If the scan for that type is still running, the next run will be triggered on the next occurrence of the time specified after its finished.
If -1 is specified, then the scan will run continuously.

When TWA is run, all scans scheduled will start immediately, then once complete, follow the scheduled time configured.

This is configured in the database table `configuration.ScanDefinitions`

The definition column is not used and you are free to rename as you see appropriate.

Changes to this configuration require a restart to take effect.
