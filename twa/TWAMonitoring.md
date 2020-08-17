# Teamwork Analytics Monitoring

This page explains what customers should monitor when deploying Teamwork Analytics in the CAT (Customer Azure Tenant) model

To get a full understanding of the Architecture see documentation here

## Monitoring on the Windows Virtual Machine that runs the Graph Colllector

Please collect and report on the following metrics/events over time.

**Windows Generic**

Reboots / online / offline

CPU Usage

RAM Usage

Disk IO

Disk size / % free

Network IO

Event logs for generic issues

**TWA Specific**

TWA Collector Service running

TWA collector event log events

If VM performance appears to be constrained (persistently high CPU, IO or other metrics) please contact Modality Systems for sizing advice.

## Monitoring of SQL

Monitor overall SQL performance. If SQL appears to be constrained (persistently high CPU, IO or other metrics) please contact Modality Systems for sizing advice.