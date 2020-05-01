# CreateTeam ARM Deployment Scripts

To facilitate a faster and more consistent CreateTeam deployment process we have developed a set of deployment scripts that can be run by a customer to deploy CreateTeam within their own Azure Subscription. This set of deployment scripts comes in the form of 3 powershell scripts:

| Script Name             | Description                                                                                            |
| ------------------------| ------------------------------------------------------------------------------------------------------ |
| PreARMDeployScript.ps1  | Creates 2 Azure AD Application Registrations and links them together by Exposing the API to the Client |
| ARMDeploy.ps1           | Performs an ARM deployment or upgrade of CreateTeam, adds logo if present                              |
| PostARMDeployScript.ps1 | Applies graph permissions, creates roles, sets redirect URI's, generates key vault certificate, creates tables and teams manifest |

Each script is signed and will require [Azure PowersShell](https://docs.microsoft.com/en-us/powershell/azure/install-az-ps) to be installed first.

> Note: For an introduction to Azure Resource Manager see [docs.microsoft.com](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-overview).

This ARM Template will install resources in your Azure tenant. The template will deploy the following resources:

| Service Type         | Description                                                                                            |
| -------------------- | ------------------------------------------------------------------------------------------------------ |
| Web App Service      | S1, 100 Total ACU, 1.75GB memory, A-Series Compute Equivalant                                          |
| Key Vault            | Securely stores Web App Secret                                                                         |
| Storage Accounts     | Block Blob Storage, General Purpose V2, RA-GRS Redundancy, 1,000 GB Capacity, 100 Storage transactions |
| [Application Insights] | [Logs for Web App Bot and Web App Service] Not installed by default*                                 |

> Important: **Remote Application Logging. By default the application will configure itself to send logging and telemetry data to Modality Systems using an Application Insights instance securely hosted in Microsoft Azure. This enables Modality Systems to investigate and remediate any reported issues remotely. By exception it may be possible instead to keep logging data within the customer's tenant but this may have licensing and support implications which you should discuss with Modality Systems to fully understand.**

## Installation