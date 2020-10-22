# Teams Diagnostics Configuration Notes

## Application Insights

### Data Sampling Ratio
By Default we have set up Application Insights with Ingestion Sampling at 12.5% to minimse costs. This should be reviewed after a two weeks of install and increased if possible. Detail about ingestion sampling can be found [here](https://docs.microsoft.com/en-us/azure/azure-monitor/app/sampling#ingestion-sampling)

Moving to Adaptive Sampling is in the product roadmap.

### Data Retention
By Default, data retention is set to 90 days as this incurrs no additional cost ([see Application Insights section here for details](https://azure.microsoft.com/en-gb/pricing/details/monitor/)). This should not be changed.
