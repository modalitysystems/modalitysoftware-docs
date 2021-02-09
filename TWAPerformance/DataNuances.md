In the aggregate tables, it is possible to see a userid appear as both usertype = 1 and usertype = 2 (internal and external)
In the stream table it is also possible to see a userid appear as both usertype = 1 and usertype = 2 (internal and external)

This is because there are some bot endpoints (such as TogetherMode user/app id = 9cd07db6-fab5-438c-8e34-44117fac7650)that are registered under the same user/bot id in multiple tenants.

If your users join an externally hosted meeting, and one of their bots enters the meeting, a stream (and subsequently aggregate row), will appear for an external user(the bot), but with the same userId as already recorded as in your tenant.
