# Messages
There are two types of message.
1. Private Chat Message
2. Channel Message

Currently we only support Channel Messages

## Channel Messages

Variables configured in app.config
- boolean [UseMessageDeltas] default true
- integer [MessageDeltaWindowInDays] default 10
- integer [MessageLargeDeltaWindowInCalendarMonths] default 8

There are two different types of channel message query
1. Large Delta
2. Regular Delta

The decision for the type of channel message query can be made on a per channel basis. 
>eg. some channels may have a large Delta query whereas other channels may have a regular Delta query.

### Large Delta Query

A large Delta query will get all created, modified and deleted messages for that channel in the last [MessageLargeDeltaWindowInCalendarMonths] months. The window will always start on the first of the month.
>eg. if the current month is July 2020 and [MessageLargeDeltaWindowInCalendarMonths] is set to 8, then July 2020 minus 8 months = November 2019, so TWA will use the 1st November 2019 as the start date for channel messages. 

:exclamation: Microsoft Graph currently(as of 9th July 2020) only returns messages created, modified or deleted in the last 16 months. Therefore [MessageLargeDeltaWindowInCalendarMonths] has a maximum limit of 16.

Large Delta queries will happen in the following scenarios
1. When TWA is run for the very first time
2. When TWA has not been run in the previous [MessageDeltaWindowInDays] days
3. When there are no messages (created in the last [MessageDeltaWindowInDays] days), saved in the TWA database for the whole tenant 
4. When there are no message Delta tokens (created in the last [MessageDeltaWindowInDays] days), saved in the TWA database for that channel 
5. When [UseMessageDeltas] is set to false

#### Performance Optimisation
Keep [MessageLargeDeltaWindowInCalendarMonths] as low as acceptable to speed up a large delta scan.
Set [UseMessageDeltas] = true, to enable regular Delta queries.

### Regular Delta Query

A regular Delta query will get all created, modified and deleted messages for that channel in the last [MessageDeltaWindowInDays] days. This is more performant than a large Delta query as it does not return already saved messages older than [MessageDeltaWindowInDays] days. 

There are 2 exceptions to this rule.
1. When TWA has been running wihtout interuption for less than [MessageDeltaWindowInDays] days
   - If it is yet to scan that channel within [MessageDeltaWindowInDays] days, then it will fallback to a large Delta query for that channel.
   - If it has scanned that channel at least once in [MessageDeltaWindowInDays] days, TWA will only be getting the created, modified and deleted messages for that channel since the earliest occurance of that channel scan in [MessageDeltaWindowInDays] days.
2. When a new channel is created inside [MessageDeltaWindowInDays] days
   - TWA will only be getting the created, modified and deleted messages for that channel since it was created.
 

All of the following criteria is required for a regular Delta query to happen for a channel.

1. [UseMessageDeltas] is set to true
2. When the channel has been scanned before
3. When there are 1 or more message(s) (created in the last [MessageDeltaWindowInDays] days), for the whole tenant stored in the TWA database.
4. When there are 1 or more Delta token(s) (created in the last [MessageDeltaWindowInDays] days), for that channel stored in the TWA database.


#### Known issues
1. When a channel created more than 12 months ago has no messages in the last 16 months, TWA may fail to get a delta token for that channel and will continue performing large delta queries for that channel. This isn't an issue per-se because the large Delta query will be checking for any new messages. When a message is created, the regular delta queries will take over.
2. When a channel created more than 12 months ago has no licenced team users as members in it's team, TWA may fail to get a delta token for that channel and will continue performing large delta queries for that channel. This isn't an issue per-se because the large Delta query will be checking for any new messages. When a licenced user is added, the regular delta queries will take over.
3. Some messages older than [MessageLargeDeltaWindowInCalendarMonths] calendar months may be returned by graph. this is a microsoft bug and has no ill effect on the integrity of the TWA db
