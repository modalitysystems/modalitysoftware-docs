# Files / Drive Items

Files are also know as Drive Items.

There are two types of message.
1. Private Files
2. Team Files

Currently we only support team files

## Team Files

Variables configured in app.config
- boolean [UseFileDeltas] default true
- integer [FileDeltaWindowInDays] default 10

There are two different types of team file query
1. Large Delta
2. Regular Delta (just called delta in config)

The decision for the type of team file query can be made on a per team basis. 
>eg. some teams may have a Large Delta query whereas other teams may have a regular Delta query.

### Large Delta Query

A Large Delta query will get all created, modified and deleted files for that team.

Large Delta queries will happen in the following scenarios
1. When TWA is run for the very first time
2. When TWA has not been run in the previous [FileDeltaWindowInDays] days
3. When there are no files (created in the last [FileDeltaWindowInDays] days), saved in the TWA database for the whole tenant 
4. When there are no file Delta tokens (created in the last [FileDeltaWindowInDays] days), saved in the TWA database for that team 
5. When [UseFileDeltas] is set to false

#### Performance Optimisation
Set [UseFileDeltas] = true, to enable regular Delta queries.

### Regular Delta Query

A regular Delta query will get all created, modified and deleted messages for that team in the last [FileDeltaWindowInDays] days. This is more performant than a Large Delta query as it does not return already saved files older than [FileDeltaWindowInDays] days. 

There are 2 exceptions to this rule.
1. When TWA has been running without interruptions for less than [FileDeltaWindowInDays] days
   - If it's yet to scan that team within [FileDeltaWindowInDays] days, then it will fallback to a Large Delta query for that team.
   - If it has scanned that team at least once in [FileDeltaWindowInDays] days, TWA will only be getting the created, modified and deleted files for that team since the earliest occurrence of that team file scan in [FileDeltaWindowInDays] days.
2. When a new team is created inside [FileDeltaWindowInDays] days
   - TWA will only be getting the created, modified and deleted files for that team since it was created.
 

All of the following criteria is required for a regular Delta query to happen for a team.

1. [UseFileDeltas] is set to true
2. When the team has been scanned before
3. When there are 1 or more file(s) (created in the last [FileDeltaWindowInDays] days), for the whole tenant stored in the TWA database.
4. When there are 1 or more Delta token(s) (created in the last [FileDeltaWindowInDays] days), for that team stored in the TWA database.
