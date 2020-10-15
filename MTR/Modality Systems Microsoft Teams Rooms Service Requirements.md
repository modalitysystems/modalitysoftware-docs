# Modality Systems Microsoft Teams Rooms Service - Customer Requirements

Modality Systems offer a complete managed service for Microsoft Teams Rooms, it covers remote monitoring, alerting, reporting and patching. It does not cover physical room system deployment.

This service is built on 4 elements

- A windows monitoring agent on the MTR for Windows ([PA Server monitor)](https://www2.poweradmin.com/products/server-monitoring/)
- Access to the [Microsoft Teams Admin Center](https://docs.microsoft.com/en-us/microsoftteams/devices/device-management) for device administration and management 
- Access to [Microsoft Call Quality Dashboard](https://docs.microsoft.com/en-us/microsoftteams/turning-on-and-using-call-quality-dashboard) and a Power BI workspace for Microsoft and Modality CQD Power BI reports
- Access to customers preferred MTR for Windows patch management system

For security it is recommended Modality Systems use customer provisioned accounts with limited relevant role based access only. This page details the requirements for each component of the service. Typically this is 4 named accounts in our services team. Modality are happy to use VPN and or multi-factor authentication as required.

This service covers MTR for Windows and MTR for Android. It does not cover IP Phones, Teams Displays or other Microsoft Teams devices. Modality Systems have parallel service options available for all other device types if required.

## Complete list of customer Azure AD account requirements

For ease, here is a complete list of the account requirements

4 customer Azure AD accounts with the following access

- [Teams Device Administrator role](https://docs.microsoft.com/en-us/microsoftteams/using-admin-roles)
- [Teams Communications Support Engineer](https://docs.microsoft.com/en-us/microsoftteams/using-admin-roles)
- Access to Windows patching Server (WSUS)
- Access to a customer Power BI workspace
- Power BI Pro licences
- Access to Power BI Server if deployed on customer tenant-
- Optional, direct remote access to MTR Systems

Details of each requirement are explained below.

## Windows Monitoring Agent

An agent installed on the MTR for windows allows us to monitor the device health, alert on issues such as being offline, failed sign in or USB/HDMI device unplugged and collect windows event log and performance information for deeper analysis via Modality Power BI reports (installed on customer PowerBI.com)

Modality Systems use a commercial agent, PA Server monitor. This is used on all our managed service customers to manage and monitor servers, gateways and other devices and ties into our managed services team reporting and alerting. The software is licenced by Modality as part of the service.

For MTR for Android (previously called Collaboration bars) there is no option to install 3rd party agents. Modality can leverage reporting in the Teams Admin Center for these devices.

Customers can choose to simply install just the "satellite" agent on their MTR for Windows and have it report back to our Azure instance of PA Server monitor over TLS 443 out, or for larger customers we can install a dedicated instance of PA Server monitor on their Azure to keep monitoring, reporting and alerting 100% in their environment.

Steps to install the satellite agent on the MTR for Windows are [here](/MTR/Install and configure the satellite monitor on Microsoft Teams Room.html).



### Dedicated PA Server for Monitoring within customers Tenant/Environment/Network

If customers wish to have a dedicated PA Server instance, we require an Azure virtual machine to the following requirements:

- Windows Server 2016 or 2019
- SQL installed on the Virtual Machine or a SQL instance
- 100GB HDD
- 4 core CPU
- 8GB RAM
- Open to 443 inbound from the Microsoft Teams Rooms (either on network or over the internet as preferred by customer)
- Customer AD accounts to log onto the VM and administer monitoring and alerting. Modality are happy to use VPN and or multi-factor authentication as required
- Secure Access to Exchange Online for Email Alerting


## Teams Admin Center Access, CQD and Power BI

Modality Systems require a number of customer Azure AD accounts with the Teams Device Administrator role and the Teams Communications Support Specialist role.

[Teams Device Administrator role](https://docs.microsoft.com/en-us/microsoftteams/using-admin-roles) allows access to manage device configuration and updates, review device health and status of connected peripherals, set up and apply configuration profiles, and restart devices.

[Teams Communications Support Engineer](https://docs.microsoft.com/en-us/microsoftteams/using-admin-roles) allows user profile page for troubleshooting calls in Call Analytics for the specific user being searched for. This is used to troubleshoot any quality issues from Teams Admin Center as soon as they are reported (CQD reports can take longer to populate)

Teams Communications Support Specialist allows us to, monitor, and troubleshoot tenant's call quality and reliability using Call Quality Dashboard (CQD).

Modality Systems also require a Power BI workspace on the customers tenant to upload Microsoft and Modality Power BI reports. Each Modality Customer account requires a Power BI Pro licence.

Modality are happy to use VPN and or multi-factor authentication as required.



## Microsoft Teams Room Patch Management

Microsoft Teams Rooms for Android patch management is handled through the Teams Admin Center

Microsoft Teams Rooms for windows require the following patch management:

- Windows Operating System Updates (Windows Update or WSUS)
- MTR App updates (Windows Store)

By default, MTR's update directly from Windows Update. If a customer uses WSUS to manage patching, Modality Systems require customer Azure AD accounts with access to patch just the MTR devices, or, if preferred Modality Systems can install and manage a dedicated WSUS instance.

If Managing MTR for Windows patch management, we recommend Modality customer AD accounts have login access to the MTR devices from inside the customer network.

