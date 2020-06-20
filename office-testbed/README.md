# Office Test Bed ARM Deployment

Office Test Bed ARM Deployment allows you to quickly spin up an Azure VM based on a selectable set of Windows/Office versions and starts the required resources in your Azure subscription.

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fofficedeploy.blob.core.windows.net%2Fdeploy%2FmainTemplate.json" target="_blank">
  <img src="https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true" alt="Deploy To Azure" style="max-width:100%;">
</a>
<a href="http://armviz.io/#/?load=https://officedeploy.blob.core.windows.net/deploy/mainTemplate.json" target="_blank">
  <img src="https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/visualizebutton.svg?sanitize=true" alt="Visualize" style="max-width:100%;">
</a>

> Note: For an introduction to Azure Resource Manager see [docs.microsoft.com](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-overview).

This ARM Template will install resources in your Azure tenant. The template will deploy the following resources:

# Windows Size

| Size             | Specification                   | Monthly Cost [Unless De-allocated] |
| ---------------- | ------------------------------- | -----------------------------------|
| Standard_D2s_v3  | 2 vCPUS, 8GiB RAM, 3200 IOPS    | £63.11                             |
| Standard_D4s_v3  | 4 vCPUS, 16GiB RAM, 6400 IOPS   | £126.33                            |
| Standard_D8s_v3  | 8 vCPUS, 32GiB RAM, 12800 IOPS  | £252.45                            |
| Standard_D16s_v3 | 16 vCPUS, 64GiB RAM, 25600 IOPS | £504.90                            |

# Windows Version

Professional or Enterprise

  ![Windows](images/windows.png)

# Windows Edition

- Enterprise
- Professional

# Office Version

Delivered by C2R installer

- Office 365 
- Office 2019
- Office 2016
- Office 2013

# Office Focus

Choose to install Teams 64bit or Skype for Business

- Teams
- SFBO
- SFBS

> SFBO and SFBS installs the same but the name of the VM is different

# Office Bitage

- 64 bit
- 32 bit

# Office Channel

This is the update ring that Office 365 installations are put on. Microsoft have recently changed the names of these

  ![Updates](images/update-channels.png)

# Visual Studio

Installed by chocolatey

- 2017 Enterprise
- 2019 Enterprise

# Azure DevOps Deployment Group

Configure the VM to be part of an Azure DevOps Deployment group. Leave defaults if not required.