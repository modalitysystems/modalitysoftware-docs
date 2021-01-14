# Monitoring Teamwork Analytics

## Monitoring by Modality (via PA Monitor)

This can be configured for you by installing a monitoring agent on the Teamwork Analytics virtual machine. Please reach out to software.support@modalitysystems.com to request this. Modality will proactively monitor the Teamwork Analytics Service and let you know if any issues are encountered.

## Custom Monitoring

If you require your own monitoring solution, you can base it on the following Powershell Script.

We would suggest you run the PowerShell script once daily, per scan. The scan it runs for can be configured by changing the "$ScanId" variable on the first line of the script. The scan IDs are as follows;

* 0 - Main Graph Scan
* 1 - Reports
* 2 - Team Messages
* 3 - Files

The script will alert if the a scan has not completed in the expected window (based on historical results so it may take a few scans to become accurate).

```powershell
$ScanId = 0

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

if($status -lt 0) 
{
    # Perform Custom Alerting Warning here via $statusMessage variable
}
```

This script assumes a standard deploy.
