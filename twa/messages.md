# Messages
There are two types of message.
1. Private Chat Message
2. Channel Message

Currently we only support Channel Messages

## Channel Messages

Variables configured in app.config
- boolean [UseMessageDeltas] default true
- integer [MessageDeltaWindowInDays] default 10
- integer [MessageFreshDeltaWindowInCalendarMonths] default 8

There are two different types of channel message query
1. Fresh Delta
2. Partial Delta

The decision for the type of channel message query can be made on a per channel basis. 
>eg. some channels may have a fresh Delta query whereas other channels may have a partial Delta query.

### Fresh Delta Query

A fresh Delta query will get all created, modified and deleted messages for that channel in the last [MessageFreshDeltaWindowInCalendarMonths] months. The window will always start on the first of the month.
>eg. if the current month is July 2020 and [MessageFreshDeltaWindowInCalendarMonths] is set to 8, then July 2020 minus 8 months = November 2019, so TWA will use the 1st November 2019 as the start date for channel messages. 

:exclamation: Microsoft Graph currently(as of 9th July 2020) only returns messages created, modified or deleted in the last 16 months. Therefore [MessageFreshDeltaWindowInCalendarMonths] has a maximum limit of 16.

Fresh Delta queries will happen in the following scenarios
1. When TWA is run for the very first time
2. When TWA has not been run in the previous [MessageDeltaWindowInDays] days
3. When there are no messages (created in the last [MessageDeltaWindowInDays] days), saved in the TWA database for the whole tenant 
4. When there are no message Delta tokens (created in the last [MessageDeltaWindowInDays] days), saved in the TWA database for that channel 
5. When [UseMessageDeltas] is set to false

#### Performance Optimisation
Keep [MessageFreshDeltaWindowInCalendarMonths] as low as acceptable to speed up a fresh delta scan.
Set [UseMessageDeltas] = true, to enable partial Delta queries.

### Partial Delta Query

A partial Delta query will get all created, modified and deleted messages for that channel in the last [MessageDeltaWindowInDays] days. This is more performant than a fresh Delta query as it does not return already saved messages older than [MessageDeltaWindowInDays] days. 

There are 2 exceptions to this rule.
1. When TWA has been running wihtout interuption for less than [MessageDeltaWindowInDays] days
   - If it is yet to scan that channel within [MessageDeltaWindowInDays] days, then it will fallback to a fresh Delta query for that channel.
   - If it has scanned that channel at least once in [MessageDeltaWindowInDays] days, TWA will only be getting the created, modified and deleted messages for that channel since the earliest occurance of that channel scan in [MessageDeltaWindowInDays] days.
2. When a new channel is created inside [MessageDeltaWindowInDays] days
   - TWA will only be getting the created, modified and deleted messages for that channel since it was created.
 

All of the following criteria is required for a partial Delta query to happen for a channel.

1. [UseMessageDeltas] is set to true
2. When the channel has been scanned before
3. When there are 1 or more message(s) (created in the last [MessageDeltaWindowInDays] days), for the whole tenant stored in the TWA database.
4. When there are 1 or more Delta token(s) (created in the last [MessageDeltaWindowInDays] days), for that channel stored in the TWA database.


#### Known issues
1. When a channel created more than 12 months ago has no messages in the last 16 months, TWA may fail to get a delta token for that channel and will continue performing fresh delta queries for that channel. This isn't an issue per-se because the fresh Delta query will be checking for any new messages. When a message is created, the partial delta queries will take over.
2. When a channel created more than 12 months ago has no licenced team users as members in it's team, TWA may fail to get a delta token for that channel and will continue performing fresh delta queries for that channel. This isn't an issue per-se because the fresh Delta query will be checking for any new messages. When a licenced user is added, the partial delta queries will take over.
3. Some messages older than [MessageFreshDeltaWindowInCalendarMonths] calendar months may be returned by graph. this is a microsoft bug and has no ill effect on the integrity of the TWA db
