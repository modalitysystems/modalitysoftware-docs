# Modality Managed Services with Azure-Lighthouse

Modality support follows a recognised shared responsibility framework and a principle of least privilege access across any Microsoft Tenant we manage. We employ Azure Lighthouse as this provides a level of separation and an access control method. Azure lighthouse is a Microsoft tool that provides MSPs and CSPs a level of agreed and controlled access to a customer’s Azure subscription or resources.

## Modality Benefits

Modality efficiently deliver our managed services across your Azure subscription or Azure resources securely. Other benefits include:

**Greater visibility and control for customers:** Customers have precise control over the scopes they delegate for management and the permissions that are allowed. Our customers can audit the actions that Modality undertake and remove access completely if desired.

**Azure delegated resource management:** The customer provides Modality access and permissions to manage their Azure subscriptions or resource groups, each are delegated to specified groups and roles and the customer still has the control to remove access if needed.

**Easy to onboard:** You do not need to be an Azure expert or Active directory guru. Modality have produced the required click-once-to-deploy ARM Templates making it easy for you to except and implement

> **NOTE:** Our customers maintain control over who can access their tenant, what resources they can access, and what actions can be taken.

![Modality Azure Managed Services Offering](https://github.com/mattmcevoy-modality/Azure-Lighthouse/blob/main/Images/Modality%20lighthouse%20offer.png)

## Modality Security Practices
Modality know It is important to consider security and access control. The Modality support team will have direct access to our customer’s subscriptions and resource groups. Modality take steps to maintain our customers tenant's security and we make sure we only allow the access that is needed to effectively manage our customer’s resources. 
> **We always insist on:**

**Azure Multi-Factor Authentication**
Azure Multi-Factor Authentication (also known as two-step verification) helps prevent attackers from gaining access to an account by requiring multiple authentication steps.

**Assign permissions to groups, using the principle of least privilege**
Azure Active Directory (Azure AD) groups for each role are required to manage a customer’s resources. This allows our customers to add or remove individual users to the group as needed, rather than assigning permissions directly to each user. 

This table is a typical example of a Modality user group deployment in Azure.

| Group Name | AD Type | Group Type | Azure Role Definition | Role Description |
| --- | --- | --- | --- | --- |
|**Modality Reader** |User Group|	Security|	Reader|	Can view all resources in a single subscription|
|**Modality Contributor**| User Group|	Security|	Contributor|	Create and manage all of types of Azure resources but does not allow you to assign roles in Azure RBAC. Cannot grant access to others|
|**Modality VM contributor**|	User Group|	Security|	VM Contributor|	Can manage virtual machines, but not access to them, and not the virtual network or storage account they are connected to.|

As a standard all Modality support professionals are held in the MODALITY READER group. Should our support members need to make changes to a resource then we follow an elevation process which requires the customers authority. This is typically managed through a change control. 
