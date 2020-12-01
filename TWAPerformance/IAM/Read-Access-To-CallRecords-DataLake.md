# Granting Users or Third Parties Access to the Modality Call Records API Data Lake



Customers may wish to grant other users or systems access to read from the Modality Call Records API data lake.

These are the steps to complete to grant that access. Please substitute your own group/account naming convention as required.



## Create a new Azure AD Security Group

Use Azure Active Directory (Azure AD) to authorize access to blob data 

Create a new AD security group called -  **CallRecordsDatalakeReader**
Group Description –  "Read Access to the Modality Call Records Data Lake"

Add the 1 or more Azure AD accounts you want to grant access to this data to this security group. We recommend 1 unique Azure AD account per user/service reading from the data lake.

## Assign the built-in Azure Data Reader role to the CallRecordsDatalakeReader security group

The built-in Data Reader roles provide read permissions for the data in a container. Theses steps assign the **CallRecordsDatalakeReader** group, and any accounts within that group, read access.

1. In the Azure portal, go to the relevant storage account and display the overview for the account.
2. Under Services, select Data Lake Storage.
3. Locate the container for which you want to assign a role, and display the container's settings.
4. Select Access control (IAM) to display access control settings for the container. Select the Role assignments tab to see the list of role assignments.

Example screenshot:

![access control](https://github.com/modalitysystems/modalitysoftware-docs/blob/master/TWAPerformance/IAM/Images/accesscontrol.png)

5. Click the **Add role assignment** button to add a new role.
6. In the Add role assignment window, select the Azure Storage role **Storage-Blob-Data-Reader**. Then add **CallRecordsDatalakeReader** security group

Example screenshot:

![role assignment](https://github.com/modalitysystems/modalitysoftware-docs/blob/master/TWAPerformance/IAM/Images/roleassignment.png)

7. Click Save. 

   

The identity to whom you assigned the role appears listed under that role. For example, the following image shows that the user added now has read permissions to data in the container named sample-container

Example screenshot:

![role preview](https://github.com/modalitysystems/modalitysoftware-docs/blob/master/TWAPerformance/IAM/Images/rolepreview.png)
