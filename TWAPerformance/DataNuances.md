## User Id in multiple tenants

In the aggregate tables, it is possible to see a userid appear as both usertype = 1 and usertype = 2 (internal and external)
In the stream table it is also possible to see a userid appear as both usertype = 1 and usertype = 2 (internal and external)

This is because there are some bot endpoints (such as TogetherMode user/app id = 9cd07db6-fab5-438c-8e34-44117fac7650)that are registered under the same user/bot id in multiple tenants.

If your users join an externally hosted meeting, and one of their bots enters the meeting, a stream (and subsequently aggregate row), will appear for an external user(the bot), but with the same userId as already recorded as in your tenant.

> These will mostly be hidden from reporting because the records don't match back to an actual registered user in AD (they are bots, not users)

## Calls with default end times (negative duration)

A very small number of Call Records are returned from Microsoft with default end times (e.g. `0001-01-01 00:00:00` rather than `2021-01-20 20:30:14`). These may be superseeded by newer versions of the Call Record returned by Microsoft. Call Records with default end times are considered imcomplete data, and so TWA Performance discards them to avoid skewing its datasets.
