## Teamwork Analytic Architecture Overview

This page gives an overview of the complete Teamwork Analytics Architecture.

It is a relatively simple architecture comprising of:

- PowerBI.com Apps
- Azure Windows virtual machine and Azure SQL
- Bot Framework

### PowerBI.com Apps

Starting from customer end user looking at reporting. Reporting is broken down into a number of destinct PowerBI.com apps. These are downloaded by the customer from Microsoft Appsource into the customers PowerBI.com tenant. It is recommended a single administrator downloads the PowerBI.com Apps, configurues them to connect to SQL (see below) and then distributes them to other users.

These PowerBI apps are available from [Microsoft AppSource](https://modalitysoftware.com/twa)

>[Teamwork Analytics Power BI Apps installation guide](twa/PowerBIAppsAdminInstallGuide.md)


#### Azure SQL

Customer data is stored in SQL Azure in the customers tenant. PowerBI.com Apps connect to this SQL to report on data. The connection is directly from the customers PowerBI.com to the customers Azure. No data is held or stored by Modality Systems.

The ARM template deploys this Azure SQL for the customer

#### Azure windows Virtual Machine
