

# Teamwork Analytics Report Development Process

This page gives an insight into how data is collected and stored, and how the report devleopment process flows.

## Introduction

Teamwork Analytics provides automation and reporting to drive Microsoft Teams Usage, Governance and Performance. 

The underlying data comes from various Microsoft Graph API's, including but not limited to, Reporting API, Teams API and Call Records API. 
The API's constantly change and evolve.

This product is developed by two teams at Modality, the Reporting Team and the Backend Development Team.

# How data is stored

## Understanding how data is stored in Teamwork Analytics Usage and Governance

TBC

## Understanding how data is stored in Teamwork Analytics Performance

**JSON RAW **– not used for any reporting, just RAW JSON for reference/T-shoot

The following hare held in the **Data Schema**

**Call records** - “complete call records are held for X days” – 35 by default, 14 in EY. It is relatively easy to add more reports in this time range subject to Power BI’s performance limits

**User data **(names, AD attributes) – current state is stored

**Aggregates** holds select data, summed, for longer period of time. E.g. number of calls per user every day for a year 


# Understanding how Power BI Reporting works

The SQL has two Schemas, one optimised for data storage and one optimised for reporting.

The **Data Schema** is comprised of SQL Tables and SQL Views and the data, The backend development team design and maintain this
 This is where the build of the data is held. The Data schema is subject to regular changes and optimisation. Do not report from this.

The Data Schema Feeds the **Reporting Schema**

Power BI reports collect data from the from the **Reporting Schema**, never the Data Schema. The Reporting Schema is a collection of SQL Tables and SQL views, They are maintained not to change, so that existing reports are not broken.

The Reporting Team have input as to the design of the Reporting Schema, but it is ultimately maintained as part of the product by the Development Team.


# New Report Development Process

1.	Customer or PO says "I would like X thing" e.g., a report of all the recorded calls for X period. 

2. PO works with customer to refine requirement and works to a scope - they will work with the Development team and Reporting Team

3. A written requirements scope is developed and agreed.

Report Creation:

## **If data exists already** 

(including for the time range the customer needs), the report team can go ahead and create a report. They may need to develop a new table/or SQL view for the **Reporting Schema** to support the Report. 

Once complete the Reporting Team submit the Table/SQL view to Development team to bring into product and maintain so that it becomes part of the product for future versions and upgrades and is maintained.

## **If data dpes not exist** 

The reporting team (with PO) define what they need in data terms via  
-	SQL view or table
-	Or clearly defined written requirement

Once agreed and refined, Development team will accept this work into sprint work out how to get the data (into data schema) and present it in the **Reporting Schema** for the Reporting Team to use. 

Once the data is in the database, Reporting Team can develop their report.






