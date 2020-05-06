# Teamwork Analytics - Data Collected and Capabiliites

Modality Teamwork Analytics collects the following data (accross multiple modules) which allows various combinaitons of useful reports and automation triggers

It is useful to understand that the data collected and stored can be broken down into two types

- **Current State Data** - Where we are polling graph on a regular basis (looping at least daily) and storing the current state information, but we are not storing a history of changes in that information

- **Historical Change Data** - Mainly for per user usage data, we collect the per day usage information for each user for every day and store that 

Understanding the data TWA collected and holds helps inform the reporting and automation capabilities

## Current State Data

This data is collected on a continous loop and TWA stores the correct current information, but not a record of historical changes e.g. TWA can tell you the current owners of a team, but not the changes in ownership over time

### Team owners, members and guests
