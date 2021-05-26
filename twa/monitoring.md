# Monitoring Teamwork Analytics Usage and Governance (not Performannce) *

## Monitoring by Modality (via PA Monitor) - Not using this script

Modlaity can perform monitoring for customers by installing a monitoring agent on the Teamwork Analytics virtual machine. 

Modality will proactively monitor the Teamwork Analytics Service and let you know if any issues are encountered. This is our recommended approach to monitoring.

Please reach out to software.support@modalitysystems.com to request this. 

## Custom Monitoring with a PowerShell Script (below)

If you do not want Modality to monitor your install, and require an ability to monitor with your own solutionData , you can base it on the following Powershell Script.

We would suggest you run the PowerShell script once daily, per scan (so you will need 4 instances of the script to cover all 4 scans). The scan it runs for can be configured by changing the "$ScanId" variable on the first line of the script. The scan IDs are as follows;

* 0 - Main Graph Scan
* 1 - Reports
* 2 - Team Messages
* 3 - Files

The script will alert if the a scan has not completed in the expected window (based on historical results so it may take a few scans to become accurate).

BEFORE RUNNING THE SCRIPT, and Administrator on the machine should create the event log source with this command in PowerShell

New-EventLog -LogName Application -Source "TWA Monitoring"

By default this script will output 55200 information event in the Windows Application event log for successful scans and 55404 Warning for an issue that support should look into.

```powershell
# Set this to the correct scan ID for this instance of the script
$ScanId = 0

# SQL login details are collected from the Config File (note if you have installed in a non standard directory, edit this path)
$XMLfile = "C:\Program Files\Modality\GraphETL\Modality.Graph.Etl.SingleTenant.Service.exe.config"
[XML]$configXml = Get-Content $XMLfile

$connectionString = $configXml.configuration.connectionStrings.add.connectionString


$conn = New-Object System.Data.SQLClient.SQLConnection($connectionString)
$conn.Open()

$command = New-Object System.Data.SQLClient.SQLCommand
$command.Connection = $conn

$command.CommandText = "exec monitoring.SpGetScanStatus @ScanId, @ToleranceHours"
$command.Parameters.Add($(New-Object System.Data.SqlClient.SqlParameter("@ScanId ",$ScanId)))
$command.Parameters.Add($(New-Object System.Data.SqlClient.SqlParameter("@ToleranceHours ",24)))

$reader = $command.ExecuteReader()

$reader.Read()

$status = $reader["Status"] -as [int]
$statusMessage = $reader["StatusMessage"]

# If status is less than 0, thats bad, if the status is 0 or above, good

if($status -lt 0) 
{
    # Perform Custom Alerting Warning here via $statusMessage variable - e.g. send an email or write a windows event log event
    
    Write-EventLog -LogName Application -Source "TWA Monitoring" -EventID 55404 -Message "Scan $ScanId $statusMessage -  Scan has not completed, please check your system and if needed contact Modality support software.support@modalitysystems.com" -EntryType Warning

    write-host "Status Less than 0 Event Triggered"

}

if($status -ge 0) 
{
    # Perform Custom Alerting Warning here via $statusMessage variable - e.g. send an email or write a windows event log event
    
    Write-EventLog -LogName Application -Source "TWA Monitoring" -EventID 55200 -Message "Scan $ScanId $statusMessage - Scan completed successfully" -EntryType Information

    write-host "Status Greater than or equal to 0 Event Triggered"

}






```

This script assumes a standard deployment. If you have changged install directories or SQL configuration the script will need to be adapted
