# Teamwork Analytics Performance ARM Deployment

1. Download the [RefreshFunctions.ps1](https://github.com/modalitysystems/TWAPerformanceGABuilds/releases/download/RefreshFunctions/RefreshFunctions.ps1) powershell script

2. Ensure that you have [Az Powershell module](https://docs.microsoft.com/en-us/powershell/azure/new-azureps-module-az) installed on your machine and run the script

3. When prompted Log into Azure

4. Enter the Subscription ID where Teamwork Analytics Performance has been deployed

5. Enter the Resource Group name that Teamwork Analytics Performance has been deployed to

6. Wait until all functions have been successfully synchronised

   ![Progress](images/RefreshFunctions.png)

## Deployment Complete

1. The deployment of Teamwork Analytics Performance is now complete. You should now start to see data appear in the SQL Database.
   
   - Users for your company should start to appear in the **Users** table within a minute or so
   - Calls made by users of your company should start to appear in the **Calls** table within 15 minutes of a call ending
   
## Health Endpoint

Each function app has it's own health endpoint that displays information regarding the status of that function app [read more on how to find and view this.](FunctionHealth.md)