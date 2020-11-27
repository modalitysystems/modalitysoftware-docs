# Teams Diags Data Lake Identity & Access Management

** Use Azure Active Directory (Azure AD) to authorize access to blob data **
Create a new AD security group called -  DatalakeReader
	Provide a description for the group – 
Create a new user account in AD called – XXXXXXXDLread
	Assign this account to the new Security group you created in the previous step

In the portal locate the resource Group and the Data-lake named (XXXXXXXXXXXXXXXXX) and follow the instructions below.

## Assign an Azure built-in role

*The procedure shown here assigns a role scoped to a container:*
** The built-in Data Reader roles provide read permissions for the data in a container.**
1. In the Azure portal, go to your storage account and display the Overview for the account.
2. Under Services, select Data Lake Storage.
3. Locate the container for which you want to assign a role, and display the container's settings.
4. Select Access control (IAM) to display access control settings for the container. Select the Role assignments tab to see the list of role assignments.
### THIS IS AN EXMPLE SCREENSHOT ONLY 

!(images/accesscontrol.png)

5. Click the Add role assignment button to add a new role.

6. In the Add role assignment window, select the Azure Storage role (Storage-Blob-Data-Reader) that you want to assign. Then search to locate the security principal to which you want to assign that role. -  _**Security group created previously.**_

!(images/roleassignment.png)

7. Click Save. The identity to whom you assigned the role appears listed under that role. For example, the following image shows that the user added now has read permissions to data in the container named sample-container.

### THIS IS AN EXMPLE SCREENSHOT ONLY

!(images/rolepreview.png)
