# Online Meetings Report Module (Preview)

> This module is in Preview. Preview offerings include early and future projects which are not yet ready for general availability. As such Preview projects are not part of Modality Systems standard product or support agreements and are subject to change at short notice. 

## Introduction

The [Online Meetings Report](https://modalitysoftware.com/organisation-wide-online-meeting-usage-report) module enables organisations to view usage of online meetings, not just Microsoft Teams or Skype for Business meetings, but all major meeting platforms.

## Deployment Prerequisites

* Azure SQL Database: Single Database, DTU purchase model, Standard tier, S2: 50 DTUs, 250 GB included storage per DB, 1 Database(s) x 730 Hours, 5 GB retention
* Azure Virtual Machine: 1 B2MS (2 vCPU(s), 8 GB RAM) x 730 Hours; Windows – (OS only); Pay as you go; 1 managed OS disks – P10
* Access to Azure Activity Directory to register an application and grant admin consent for application permissions (User.Read, User.Read.All, Calendars.Read)
* Service user with PowerBI Pro License (these details will need to be shared with Modality Systems during deployment configuration)
