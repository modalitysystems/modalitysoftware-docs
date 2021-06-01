# TWA Performance Running Costs

Because TWA is a Microsoft Azure cloud hosted solution there are additional costs to keep it running. Below are the different Azure Services types and their prices for a given CPS (Calls Per Second), CPD (Calls Per Day) and CPM (Calls Per Month). By summing the price of each section where you expect your average call throughput to be, you will get your monthly cost estimate.

The prices listed in the below sections are estimates from extended performance tests in various load ranges. They are also based on an average participant count per call of 3. Having a higher participant count per call will proportionally increase the amount of segments and data streams per call. This in turn will increase the operation counts and data storage across all services so please try to keep this in mind when summing everything together. These prices are by no means definite, expect real prices to vary. The prices of some of more expensive services can potentially be lessened with certain packages or disabling certain features.

## SQL Database Pricing

The Sql Database is where raw and aggregate data is stored and where reports pull their data from. Below is a table with different Sql tiers, their prices and their maximum tested throughput. These throughput values, except where noted, are at close to 100% Database Utilization so some additional headroom would be needed to include the performance costs of using the reports and running the aggregate function. 

When figuring out which tier is best for you, keep in mind your CPS during business hours as that's likely higher than the average over the whole day. This can negatively effect performance if your CPS during those business hours is higher than the rated maximum of the Sql DB Tier.

Please also note that while each tier was seen to run at this throughput level for an extended amount of time, your results may vary due to location, service/peak time spikes and any number of other factors. 

|Sql DB Tier<sup>1</sup>|Max<sup>2</sup> CPS|Max<sup>2</sup> CPD|250GB Price<sup>3</sup>|500GB Price<sup>3</sup>|1TB Price<sup>3</sup>|
|---|---|---|---|---|---|
|Standard 0 (10 DTUs)|5|432K|£14|n/a|n/a|
|Standard 1 (20 DTUs)|10|864K|£28|n/a|n/a|
|Standard 2 (50 DTUs)|20|1.72M|£70|n/a|n/a|
|Standard 3 (100 DTUs)|30|2.59M|£140|£180|£260|
|Standard 4 (200 DTUs)|50|4.32M|£280|£320|£400|
|Standard 6 (400 DTUs)|50+<sup>4</sup>|4.32M+<sup>4</sup>|£560|£600|£680|
|Premium 1 (125 DTUs)|50|4.32M|£430|£430|£600|
|Premium 2 (250 DTUs)|50+<sup>4</sup>|4.32M+<sup>4</sup>|£870|£870|£1,030|
|General Purpose (2 vCores)|50+<sup>4</sup>|4.32M+<sup>4</sup>|£240|£280|£340|
|Business Critical (2 vCores)|50+<sup>4</sup>|4.32M+<sup>4</sup>|£490|£560|£710|

> <sup>1</sup> Higher Sql DB tiers will include additional features, not listed here, that may be useful.

> <sup>2</sup> This is the maximum amount of calls that can be processed using this Sql DB tier. **This does not include any head room for reporting**.

> <sup>3</sup> Prices are in £ per month. Please note that these are the advertised estimates for these Sql tiers. Real prices can vary.

> <sup>4</sup> This is currently the maximum throughput that TWA Performance can handle. These Sql DB Tiers are below 50% Utilization and could potentially handle more.

## Storage Account Pricing

The Storage accounts are used by Azure functions to save meta data and Graph responses to be processed into Sql Storage. The majority of the costs come from writing the graph responses into blob storage. Second to that would be the accumulated storage size which can be managed by the [storage accounts retention policy and our retention function.](Configuration.md) 

|CPD|CPM|Price|
|---|---|---|
|1K|30K|<£1|
|10K|300K|£6|
|50K|1.5M|£30|
|100K|3M|£61|
|500K|15M|£302|
|1M|30M|£609|
|5M|150M|£3,080|

## Azure Function Pricing

Azure functions are priced on the amount of MB per second used which is calculated by multiplying together the execution count, MB of memory used per execution and execution time in Milliseconds. Azure functions also incur a storage account cost, but this has been included in the storage Account pricing above.

Microsoft allow a certain amount of executions and MB per second free. The prices below are estimates based on the amount of calls and the average completion time of a function execution calculated during extended performance testing. Keep in mind that the prices can vary based on slower function execution times during service/peak time spikes and other factors. 

|CPD|CPM|Price|
|---|---|---|
|5K|150K|Free|
|10K|300K|<£1|
|50K|1.5M|£2|
|100K|3M|£16|
|500K|15M|102|
|1M|30M|£210|
|5M|150M|£1,060|

## Service Bus Pricing

Service busses are scalable queues that are typically used in TWA Performance to join 2 or more functions together with built in retry logic. The price is calculated per service bus operation including messages and requests. The cost per million operations goes lower after set tiers and there's a minimum cost for keeping a service bus up 24/7. Because TWA Performance makes use of service bus topics, standard is the lowest tier that can be used.

The cost can increase if there's a period of service failures causing messages to retry. By default every message can retry up to 10 times. 

|CPD|CPM|Price|
|---|---|---|
|1K|30K|£7|
|10K|300K|£11|
|50K|1.5M|£57|
|100K|3M|£94|
|500K|15M|£358|
|1M|30M|£748|
|5M|150M|£2,034|

## Application Insights Pricing

Application Insights is where the different services used in TWA Performance send their logs to. These are useful when reporting on the health of TWA Performance and troubleshooting problems. Insights is charged per GB and includes 5GB for free per Billing Account. There are many additional services and features that can be enabled but by default there is only basic log collection and a 90 Day retention. These extra features, such as alerts or custom metrics will usually incur additional costs.

The cost of application insights can become quite high at larger volumes and if exception logs are left to grow.This is why there are features enabled by default that restrict the amount of logs. By default the daily data cap is set at 3GB and data sampling is set to 12.5%. These can be changed if necessary but disabling these is not recommended. The prices below are with no Data Cap or Sampling enabled and assuming this is the only Application Insight used in the registered billing account.

|CPD|CPM|Size Estimate|Price|
|---|---|---|---|
|1K|30K|150MB|Free|
|10K|300K|1.5GB|Free|
|50K|1.5M|7.3GB|£5|
|100K|3M|14.6GB|£21|
|500K|15M|73GB|£147|
|1M|30M|146GB|£304|
|5M|150M|732GB|£1,562|
