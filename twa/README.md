# Modality Systems Teamwork Analytics

Modality Systems’ Teamwork Analytics supports organisations with hundreds of thousands of Microsoft Teams users all over the world, driving adoption and managing the entire lifecycle of Teams to ensure best practice, governance, and security.

Teamwork Analytics combines a native Microsoft Teams app for team creation and lifecycle management through automation and Power BI reporting.

In preview is reporting for Microsoft PSTN Billing reporting.

Teamwork Analytics can be run by Modality Systems in Azure as software as a service (SaaS) or on a customer azure tenant (CAT).

This documentation gives full details of the deployment and configuration of Teamwork Analytics



# Teamwork Analytics - SaaS

As a global dedicated Microsoft Systems Integrator, Independent Software Vendor (ISV) and Cloud Solutions Provider (CSP) with 11 Gold competencies and multiple Global Partner of the Year awards, we are happy to offer Teamwork Analytics as a service run from Microsoft Azure.

Customers will need to grant access from their Office 365 tenant and each person at the customer that wants to review Power BI reporting will need Power BI Professional (just for users looking at reporting, not all users).

This is the quickest and easiest way to run Teamwork Analytics

### [Setting up Teamwork Analytics SaaS](/twa/SaaS/README.md)



# Teamwork Analytics -  Customer Azure Tenant (CAT)

For customers that have requirements to keep data and control within their own Microsoft tenant, Modality Systems fully supports Teamwork Analytics being deployed on customer azure tenant (CAT) via Azure Resource Manager (ARM) templates.

This allows Teamwork Analytics to be deployed without Modality Systems having any access to customer data.

Below are the steps to deploy CreateTeam and the Automation and Reporting

###  [CreateTeam Deployment CAT](CreateTeam/README.md)

### [Teamwork Analytics Data Backend Deployment CAT](twa/TeamworkAnalyticsDataCollectorDeployment.md)

### [Teamwork Analytics Upgrade Steps CAT](twa/UpgradingTeamworkAnalytics.md)

### [Teamwork Analytics Power BI Reports Deployment](twa/PowerBIAppsAdminInstallGuide.md)





## **Teamwork Analytics Architecture and FAQ**

###  [Teamwork Analytics Architecture](twa/TWA-Architecture-Overview.md)

### [Teamwork Analytics Data Collection Explained](twa/TeamworkAnalyticsDataCollectionExplained.md)

### [Teamwork Analytics Frequently Asked Questions](twa/TWA-FAQ.md)



# Teamwork Analytics Power BI Report Guides

PowerBI apps are available from [Microsoft AppSource](https://modalitysoftware.com/twa)

###  [Teams Usage Report Guide](/twa/Reports/TeamsUsage/TeamsUsageGuidance.md)

###  [Teams Governance Report Guide](/twa/Reports/TeamsGovernanceandSecurity/OperationsGovernanceandCompliance.md)



## Teamwork Analytics Teams Billing Preview

This module is deployed in select enterprise customers and provides full PSTN billing reports for Microsoft Teams calling plans and PSTN Audio Conferencing. This is currently bespoke reporting on a per customer basis.