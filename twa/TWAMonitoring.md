# Teamwork Analytics Monitoring and Alerting

This page explains what customers should monitor and alert on when running Teamwork Analytics in the CAT (Customer Azure Tenant) model

To get a full understanding of the Architecture see documentation [here](/twa/TWA-Architecture-Overview.md).

## Monitoring and Alerting on the Windows Virtual Machine that runs the Graph Collector

Please collect and report on the following metrics/events over time. If Windows performance appears to be constrained (persistently high CPU, IO or other metrics) please contact Modality Systems for sizing advice.

**Windows virtual machine/Operating System Monitoring**

Reboots / online / offline - alert on any unexpected/un planned reboot

CPU Usage - alert when CPU usage persists over 80% for more than 1 hour

RAM Usage - alert when CPU usage persists over 80% for more than 1 hour

Disk IO 

Disk size / % free  - alert when less than 10% free disk space

Network IO

Event logs for generic issues - ensure all events are keep for up to 30 days for historical troubleshooting

**Teamwork Analytics Windows Service**

TWA Collector Service running - alert if not running

TWA collector event log events - ensure all events are keep for up to 30 days for historical troubleshooting



## Monitoring and Alerting of SQL

Monitor overall SQL performance. If SQL appears to be constrained (persistently high CPU, IO or other metrics) please contact Modality Systems for sizing advice.

Alert if SQL is offline