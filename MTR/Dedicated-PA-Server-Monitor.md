
Customer Dedicated PA Server Monitor Instance in Customer Azure Tenant

Some customers prefer to keep MTR monitoring and reporting within their environment/tenant. For larger enterprise customers Modality Systems can deploy, configure and manage a dedicated PA Server monitor.

As a Tier 1 certified Microsoft Cloud Solutions provider Modality Systems can deploy this on your Azure tenant in a dedicated, isolated and secure Modality Azure Zone. This is a specific CSP subcription from Modality Systems which provides an isolated area to deploy the relevant compute resources.

Alternatively customers can deploy the relevant compute in their Azure subscription and grant accounts for Modality Systems to access.

If customers wish to have a dedicated PA Server instance, we require an Azure virtual machine to the following requirements:

Windows Server 2016 or 2019
100GB HDD OS
128GB HDD for application
4 core CPU
8GB RAM

If customer wants a hot standby PA monitoring agents can auto failover to another server. A second server in a different Azure region of the same specificaiton and configuration is required.

Modality Systems will install PA Server Monitor which uses SQL Express. This spec has been tested to scale up to over 500 monitored endpoints/MTR's.

This VM will have Power BI Gateway installed. This is required to connect the logging information to the customers PowerBI.com 

Power BI Gateway has the following software requirements Modality Systems will install: https://docs.microsoft.com/en-us/data-integration/gateway/service-gateway-install

Power BI Gateway has the following network requirements: https://docs.microsoft.com/en-us/data-integration/gateway/service-gateway-communication#enable-outbound-azure-connections - Thse are *required* for Power BI reporting to work.

VM must be open to 443 inbound from the Microsoft Teams Rooms (either on network or over the internet as preferred by customer). Typically this means putting it on a publicly accessible IP or an internal IP that can route to all MTR's.

VM must have SMTP relay access to email alerting

Customer AD accounts to log onto the VM and administer monitoring and alerting. 

Modality are happy to use VPN and or multi-factor authentication as required

