# Hosting TWA Automation in Customer Azure Tenant (CAT) Configuration

This page describes the architecture required for hosting TWA Automation in CAT Configuration. In this configuration, the Modality-managed cloud solution that brokers and delivers messages to users is replicated within a customer's own Azure tenant.

> **Important**: because this configuration results in all parts of the TWA Automation service being hosted within a customer's Azure tenant, the customer assumes responsibility for monitoring of the service and raising any issues with Modality for investigation. It may be nessecary to export log files or temporoarily provide access to installed components for troubleshooting.

## Required Components

The following Azure resources are required to install TWA Automation:

- 1 x Bot Registration S1 Standard
- 1 x App Service Plan S1
- 1 x App Service
- 1 x Application Insights
- 1 x Storage Account General Purpose v2 Hot

> **Important**: the App Service should be publicly accessible via HTTPS 443, and also reachable by the TWA Bot Notification Service (usually installed alongside the Teamwork Analytics Windows Service on the same Virtual Machine). This is to ensure it is accessible to the Microsoft Bot Framework service, which is used to deliver both email and Microsoft Teams messages.

Coming shortly, we will provide an [Azure ARM Template](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/overview) describing these resources and their configuration. ARM Template is our preferred installation and configuration method.

![TWA Automation CAT Architecture](https://github.com/modalitysystems/modalitysoftware-docs/blob/master/twa/images/TWA-Automation-CAT-Architecture-1.png)
