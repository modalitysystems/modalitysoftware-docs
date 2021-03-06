# This PowerShell allows you to collect raw call records from graph with the call ID

## When prompted enter the appropriate details - a file will be generated with the name of the call id in the folder where the script is executed

```
$tenantId = $(Read-Host "Please enter your tenant ID (GUID)"`n)
$clientId = $(Read-Host "Please enter your TWA Application ID (GUID)"`n)
$clientSecret = $(Read-Host "Please enter your TWA Application Secret"`n)
$callId = $(Read-Host "Please enter your Call Id"`n)


Write-Host 'Authenticating...'
$accessToken =
    (Invoke-WebRequest `
        -Method Post `
        -Uri "https://login.microsoftonline.com/$($tenantId)/oauth2/v2.0/token" `
        -ContentType 'application/x-www-form-urlencoded' `
        -Body @{client_id=$clientId; client_secret=$clientSecret; scope='https://graph.microsoft.com/.default'; grant_type='client_credentials'} `
     | ConvertFrom-Json).access_token
Write-Host 'Authenticated!'
Write-Host ''


Write-Host '-------------------------------------------------------------------------------------------------------'



    $response = $null



    $uri = "https://graph.microsoft.com/v1.0/communications/callRecords/$($callId)?`$expand=sessions(`$expand=segments)"
    Write-Host 'v1.0 - ' $queryDate ' - ' $uri
    $response =
        Invoke-WebRequest `
            -Method Get `
            -Uri $uri `
            -Headers @{Authorization=$accessToken}

    $response.Content | ConvertFrom-Json | ConvertTo-Json | Out-File "$($callId).json"
    Write-Host ''
```
