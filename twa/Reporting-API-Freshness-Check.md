
This script will output the latest data from the user usage reporting API. This can be used to validate how up to data the usage data is that Microsoft is providing from their API's, and therefore to Teamwork Analytics.

You can also check the reports on https://portal.office.com/adminportal/home#/reportsUsage to see how up to date they are.

```
$tenantId = $(Read-Host "Please enter your tenant ID (GUID)"`n)
$clientId = $(Read-Host "Please enter your TWA Application ID (GUID)"`n)
$clientSecret = $(Read-Host "Please enter your TWA Application Secret"`n)

Write-Host 'Authenticating...'
$accessToken =
    (Invoke-WebRequest `
        -Method Post `
        -Uri "https://login.microsoftonline.com/$($tenantId)/oauth2/v2.0/token" `
        -ContentType 'application/x-www-form-urlencoded' `
        -Body @{client_id=$clientId; client_secret=$clientSecret; scope='https://graph.microsoft.com/.default'; grant_type='client_credentials'} `
     | ConvertFrom-Json).access_token
Write-Host 'Authenticated!'


Write-Host '-------------------------------------------------------------------------------------------------------'


for ($i=0; $i -lt 28; $i++){

    $response = $null
    $queryDate = $(Get-Date).AddDays(-1 * $i).ToString("yyyy-MM-dd")
    $uri = 'https://graph.microsoft.com/beta/reports/getTeamsUserActivityUserDetail(date=' + $queryDate + ')?$format=application/json'

    Write-Host $queryDate ' - ' $uri


    $response =
        Invoke-WebRequest `
            -Method Get `
            -Uri $uri `
            -Headers @{Authorization=$accessToken} | ConvertFrom-Json
    
    Write-Host 'User Count (First Page) = ' $response.value.Length

    if($response.value.Length -gt 0)
    {
        Write-Host ''
        Write-Host 'Latest Graph Reporting API Data Date  = ' $queryDate
        break
    }

    Wri
```
