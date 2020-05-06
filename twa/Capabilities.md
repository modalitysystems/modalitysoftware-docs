# Teamwork Analytics - Data Collected and Capabiliites

Modality Teamwork Analytics collects the following data (accross multiple modules) which allows various combinaitons of useful reports and automation triggers

It is useful to understand that the data collected and stored can be broken down into two types

- **Current State Data** - Where we are polling graph on a regular basis (looping at least daily) and storing the current state information, but we are not storing a history of changes in that information

- **Historical Change Data** - Mainly for per user usage data, we collect the per day usage information for each user for every day and store that 

Understanding the data TWA collected and holds helps inform the reporting and automation capabilities.



## Current State Data

This data is collected on a continous loop and TWA stores the correct current information, but not a record of historical changes e.g. TWA can tell you the current owners of a team, but not the changes in ownership over time

## Active Directory Attributes for users

Throughout the reporting Active Directroy Attribibutes are used to group users for reporting purposes. 

TWA collects the following attributes for all users by default

In addition, TWA can collect up to 10 additional Active Directory attributes, including extended attributes that customers can define

For any report involving users they can be grouped by that attribute

Example Capabilities
- Which teams are directors members of
- How many meetings are UK users attending
- What percentage of France users are high calling users


### Team owners, members and guests

This allows reporting on the current numbers and names of owners, members and guests.

Example Capabilities
- Report on teams with guests, who the guests are and how active they are
- report on number of owners in particular AD groups
