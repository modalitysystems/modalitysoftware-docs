

# Teamwork Analytics Report Development Process

This page gives an insight into how data is collected and stored, and how the report development process flows.

## Introduction

Teamwork Analytics provides automation and reporting to drive Microsoft Teams Usage, Governance and Performance. 

The underlying data comes from various Microsoft Graph API's, including but not limited to, Reporting API, Teams API and Call Records API. 
The API's constantly change and evolve.

This product is developed by two teams at Modality, the Reporting Team and the Backend Development Team.


## Understanding how data is stored in Teamwork Analytics Usage and Governance

https://github.com/modalitysystems/modalitysoftware-docs/blob/master/twa/TWA-Data-Dictionary.md


## Understanding how data is stored and reported on in Teamwork Analytics Performance


### Data Schema

The Data Schema is the store of basic data. It is comprised of SQL Tables and SQL Views and the data. The backend development team design and maintain the data schema. The Data schema is subject to regular changes and optimisation. Reports do not directly access data from the Data Schema.

Data Schema includes:

**Call records** - All key fields from each call records, held for 35 days by default (configurable). Not all fields from JSON are held.

**User data** - Names, AD attributes – current state is stored

There is also a raw store of JSON, but this is just part of the architecture and feeds the Data Schema


### Reporting Schema

The Data Schema Feeds the **Reporting Schema**

Power BI reports collect data from the from the **Reporting Schema**, never the Data Schema. The Reporting Schema is a collection of SQL Tables and SQL views optimised for reporting. They are maintained by the development not to change what they output, so that existing reports are not broken.

The Reporting Team have heavy input as to the design of the Reporting Schema. it is ultimately maintained as part of the product by the Development Team.

The reporting schema contains data that is optimised/pre-calculated for reporting purposes including:

**Aggregates** holds select data, summed, for longer period of time. E.g. number of calls per user every day for a year 


# New Report Development Process

1.	Customer or Product Owner (PO) says "I would like X report" e.g. a report of all the recorded calls for X period. 

2. PO works with the customer to refine requirement into a written scope - they will work with the Development team and Reporting Team

3. A written requirements scope is developed and agreed.

Report Creation:

## **If data is already held in the data schema and/or reporting schema for the date range required** 

The report team can go ahead and create a report. They **may** need to develop a new table/or SQL view for the **Reporting Schema** to support the Report. 

Once complete, if the Reporting team created a new Reporting Schema Table or SQL View, Reporting Team submit the Table/SQL view to Development team to bring into product and maintain so that it becomes part of the product for future versions and upgrades and is maintained.

## **If data does not exist for the data range required** 

The reporting team (with PO) define what they need in data terms via  
-	SQL view or table proposed for the Reporting Schema
-	Or clearly defined written requirement of what Reporting want in the Reporting Schema

Once agreed and refined, Development team will accept this work into sprint work out how to get the data (into data schema) and present it in the **Reporting Schema** for the Reporting Team to use. The Development team may add aggrigates into the Reporting Schema.

Once the data is in the database, Reporting Team can develop their report.






