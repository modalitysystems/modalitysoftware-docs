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

> **Update Q4 2020**: we are planning to make some architectural changes in the next version of TWA Automation. This will result in some additional resources being required in Azure once the next version is available. This is to enable greater throughput of messages when deployed at scale. This release is expected by the end of CY2020, and the new required resources will be updated here. The ARM template will also be updated.

## Required Configuration Settings

As part of the setup process, the following configurations will be applied. These are required for the TWA Automation service to operate. The ARM Template deployment will configure these settings automatically; this list is provided for reference:

- The App Service should be publicly accessible via HTTPS 443, and also reachable by the TWA Bot Notification Service (usually installed alongside the Teamwork Analytics Windows Service on the same Virtual Machine). This is to ensure it is accessible to the Microsoft Bot Framework service, which is used to deliver both email and Microsoft Teams messages.

- The Application Registration created as part of the Bot Registration process should be set to Multi Tenant. Single Tenant registration will not work correctly for Bot Registrations.

- A service account will be needed in order to send emails from the Bot Registration service. This account should be enabled for sending emails, and should not be enabled for multi-factor authentication to enable the Bot Registration service to authenticate and send email.

Coming shortly, we will provide an [Azure ARM Template](https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/overview) describing these resources and their configuration. ARM Template is our preferred installation and configuration method.

![TWA Automation CAT Architecture](https://raw.githubusercontent.com/modalitysystems/modalitysoftware-docs/master/twa/images/TWA-Automation-CAT-Architecture-1.png)
