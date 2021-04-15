# Monitoring Teamwork Analytics Usage and Governance (not Performannce)

## Monitoring by Modality (via PA Monitor) - Not using this script

This can be configured for you by installing a monitoring agent on the Teamwork Analytics virtual machine. Please reach out to software.support@modalitysystems.com to request this. Modality will proactively monitor the Teamwork Analytics Service and let you know if any issues are encountered.

## Custom Monitoring with a PowerShell Script (below)

If you require your own monitoring solution, you can base it on the following Powershell Script.

We would suggest you run the PowerShell script once daily, per scan (so you will need 4 instances of the script to cover all 4 scans). The scan it runs for can be configured by changing the "$ScanId" variable on the first line of the script. The scan IDs are as follows;

* 0 - Main Graph Scan
* 1 - Reports
* 2 - Team Messages
* 3 - Files

The script will alert if the a scan has not completed in the expected window (based on historical results so it may take a few scans to become accurate).

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
    
    Write-EventLog -LogName ScriptingGuys -Source scripts -Message “Dude, it works … COOL!” -EventId 0 -EntryType information
    
    
    
}




```

This script assumes a standard deployment. If you have changged install directories or SQL configuration the script will need to be adapted
