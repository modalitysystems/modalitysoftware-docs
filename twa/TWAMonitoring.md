# Teamwork Analytics Monitoring

This page explains what customers should monitor when deploying Teamwork Analytics in the CAT (Customer Azure Tenant) model

To get a full understanding of the Architecture see documentation [here](/twa/TWA-Architecture-Overview.md).

## Monitoring on the Windows Virtual Machine that runs the Graph Collector

Please collect and report on the following metrics/events over time. If Windows performance appears to be constrained (persistently high CPU, IO or other metrics) please contact Modality Systems for sizing advice.

**Windows OS Generic Monitoring**

Reboots / online / offline

CPU Usage

RAM Usage

Disk IO

Disk size / % free

Network IO

Event logs for generic issues

**Teamwork Analytics Windows Service**

TWA Collector Service running

TWA collector event log events



## Monitoring of SQL

Monitor overall SQL performance. If SQL appears to be constrained (persistently high CPU, IO or other metrics) please contact Modality Systems for sizing advice.