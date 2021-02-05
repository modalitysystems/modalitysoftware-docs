

# Teamwork Analytics Service Description



## Solution Overview

Modality Teamwork Analytics is software that collects Microsoft Teams related data from Microsoft Graph to provide reporting and automation to optimise your Microsoft Teams environment.

This is used to drive adoption ensure good governance and. currently in preview report on audio and video performance for calls and meetings.

Performance reporting and automation is currently in development/preview. Due for general availability Q2 2021. 



## Teamwork Analytics Automation Overview

Teamwork Analytics Automation allows you to trigger emails or direct teams messages to end users from any combination of usage/governance/performance data.

Triggers and message content are customisable.

Example Governance Automations:

- Minimum 2 Owners per team
- Remind Teams Owners of guests
- Notify Owners of inactive teams to delete/archive
- Notify owners or members of a deleted team

Example Usage Automations:

- Encourage collaboration
- Encourage use of video

Example Performance Automations:

- Remind users to use certified headsets, not PC mic and speakers
- Let users know when they have persistently poor network conditions



## Power BI Reporting Overview

Teamwork Analytics offers many Power BI reports, use cases for the reports break down into

- Usage 
- Governance
- Performance (Preview)

**Usage Reports include:**

- Reporting on use of Private Chat, Team Channel Chat, Calls and Meetings
- Report by any active directory grouping including customer defined attributes
- DAU, WAU, MAU - Daily, Weekly and Monthly Average Usage
- Percentile based activity grouping
- Report by actual usage, averages and percentages
- Month on month trends
- Compare licensed users to activity
- Drill-down for deep analysis
- Identify Teams Champions
- Identify groups of users who need more support
- Report on device usage
- Deep reporting on the Teams element of Microsoft Teams
- Report on Channel Messages, Reactions, File and Apps
- Contracts Team Membership to actual use
- Measure who is really collaborating
- Drive cross group collaboration
- Drill-down to Owners and Channels
- Per team use profiles



**Governance Reports include:**

- Team creation and status
- Traffic light security metrics
- Public, Private, Hidden teams
- Guest access and activity
- Drill-down to Team and User
- Unowned teams
- Sensitivity labelling
- Files by type and 'last modified' date



**Performance Reports include:**

- Dashboard - Overview of Usage and Quality Trends, 
- Modality Scores
- Statistics - Overall usage, total calls, call duration, subnets, users, locations, anomalous calls by issue
- Client details and device details
- Call counts site overview
- Site summary report
- Site to site Modality Score
- Pack loss Reports
- Jitter Reports
- Round trip Reports
- NMOS Reports



### How it works - Architecture

Teamwork Analytics relatively simple architecture comprising of:

- PowerBI.com Apps on customer tenant for reporting
- Azure infrastructure for data collection
- Azure Bot Service

**There are 3 deployment models**

- SaaS - Software as a Service - Modality run the infrastructure on Azure and customer brings PowerBI.com
- CSP - Cloud Solutions Provider - Modality deploy and run the infrastructure on customer CSP and customer brings PowerBI.com
- CAT - Customer Azure Tenant - Infrastructure is completely deployed on customer azure tennt via ARM template 

As a global dedicated Microsoft Systems Integrator, Independent Software Vendor (ISV) and Cloud Solutions Provider (CSP) with 11 Gold competencies and multiple Global Partner of the Year awards, we are happy to offer Teamwork Analytics as a service run from Microsoft Azure.

For customers that have requirements to keep data and control within their own Microsoft tenant, Modality Systems fully supports Teamwork Analytics being deployed on customer azure tenant (CAT) via Azure Resource Manager (ARM) templates.



## What is included?

**SaaS and CSP**

	-	Modality will setup and provide backend infrastructure
	-	Modality will provide Power BI reports
	-	Modality will provide an initial overview of reports
	-	Modality will assist with automation scenario configuration

**CAT**

 -	Modality will provide ARM templates to deploy solution
 -	Custom will provide Azure infrastructure and cover Azure costs
 -	Modality will provide an initial overview of reports
 -	Modality will assist with automation scenario configuration

## What is not included?

CAT

- Azure costs

All deployment models:

- In all models customers must provide a Power BI pro licence for each of their users who wants to consume reports



## Customer Obligations

- Authorise access to the Microsoft Graph API for their tenant