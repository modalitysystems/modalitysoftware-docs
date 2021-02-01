# Teamwork Analytics Performance ARM Deployment

1. Download the following powershell script
   
   - [RefreshFunctions.ps1](http://docs.modalitysoftware.com/TWAPerformance/images/RefreshFunctions.ps1)
  
1. Ensure that you have [Az Powershell module](https://docs.microsoft.com/en-us/powershell/azure/new-azureps-module-az) installed on your machine and run the script

1. When prompted Log into Azure

1. Enter the Subscription ID where Teamwork Analytics Performance has been deployed

1. Enter the Resource Group name that Teamwork Analytics Performance has been deployed to

1. Wait until all functions have been successfully synchronised

   ![Progress](images/RefreshFunctions.png)

## Deployment Complete

1. The deployment of Teamwork Analytics Performance is now complete. You should now start to see data appear in the SQL Database.