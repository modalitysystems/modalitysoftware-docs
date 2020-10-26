
This script will pull the latest data from the user usage reporting API. This can be used to vaidate how up to data the usage data is that Microsoft is providing from their API's, and therefore to Teamwork Analytics.

Please copy

$tenantId = $(Read-Host "Please enter your tenant ID (GUID)"`n)
$clientId = $(Read-Host "Please enter your TWA Application ID (GUID)"`n)
$clientSecret = $(Read-Host "Please enter your TWA Application Secret"`n)

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$overallStopwatch = new-object system.diagnostics.stopwatch
$overallStopwatch.Start()

Write-Host 'v1.0 Api'
Write-Host '-------------------------------------------------------------------------------------------------------'
for ($i=0; $i -lt 28; $i++) {

$queryDate = $(Get-Date).AddDays(-1 * $i).ToString("yyyy-MM-dd")
$uri = 'https://graph.microsoft.com/v1.0/reports/getTeamsUserActivityUserDetail(date=' + $queryDate + ')'

    $attempts = 0
    $success = $false

    while (!$success -and $attempts++ -lt 5) {

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

        Write-Host "Starting query: $($uri)"
        $stopwatch = new-object system.diagnostics.stopwatch
        $stopwatch.Start()
        $response = $null
        $responseBody = $null
        $contentType = $null
        try
        {
            $r = Invoke-WebRequest `
                -WarningAction Stop `
                -ErrorAction Stop `
                -Method Get `
                -Uri $uri `
                -Headers @{Authorization=$accessToken} `
                -TimeoutSec 0 `
                              
            $success = $true
            $response = $r.BaseResponse
            
            $contentType = if ($response.Headers.GetValues('Content-Type') -ne $null) { $response.Headers.GetValues('Content-Type')[0] } else { $null }
            $responseBody = If($contentType -eq 'application/octet-stream') { [System.Text.Encoding]::UTF8.GetString($r.Content) } else { $r.Content }
        }
        catch
        {
            $success = $false
            $response = $_.Exception.Response
            $responseStream = $response.GetResponseStream()
            $reader = New-Object System.IO.StreamReader($responseStream)
            $reader.BaseStream.Position = 0
            $reader.DiscardBufferedData()
            $responseBody = $reader.ReadToEnd();
        }

        $stopwatch.Stop()

        Write-Host "Finished."
        Write-Host "TotalMilliseconds = $($stopwatch.elapsed.TotalMilliseconds)"
        Write-Host "OverallTotalMilliseconds = $($overallStopwatch.elapsed.TotalMilliseconds)"
        Write-Host "Attempt = $($attempts)"
        Write-Host "Success = $($success)"
        Write-Host "StatusCode = $($response.StatusCode.value__)"
        Write-Host "StatusDescription = $($response.StatusDescription)"
        Write-Host "responseBody.Length = $($responseBody.Length)"
        
        Write-Host "ResponseHeaders ="
        for ($j = 0; $j -lt $response.Headers.Count; $j++) {
            Write-Host "    $($response.Headers.GetKey($j)) = $($response.Headers.GetValues($j))"
        }
        
        Write-Host "Content ="
        if ($responseBody.Length -gt 1000) {
                Write-Host "$($responseBody.Substring(0, 300))"
                Write-Host "..."
                Write-Host "$($responseBody.Substring($responseBody.Length - 301, 300))"
        }
        else {
            Write-Host $responseBody                
        }

        if (!$success) {
            $retryAfter = if ($response.Headers.GetValues('Retry-After') -ne $null) { [int]$response.Headers.GetValues('Retry-After')[0] } else { $null }
            $seconds = If ($retryAfter -ne $null) { $retryAfter[0] } else { 10 }
            Write-Host "Backing off after failed request. retryAfter = $($retryAfter)."
            Write-Host "Waiting for $($seconds) second(s)"
            Start-Sleep -Seconds $seconds
        }

        $requestsPer10Minutes = 14
        $secondsBetweenRequests = 1 / ($requestsPer10Minutes / 10 / 60)
        Write-Host "Limiting RPS. requestsPer10Minutes = $($requestsPer10Minutes)"
        Write-Host "Waiting for $($secondsBetweenRequests) second(s)"
        Start-Sleep -Seconds $secondsBetweenRequests

        Write-Host ''
        Write-Host '------'

    }

    $overallStopwatch.Stop()

    Write-Host ''
    Write-Host '-------------------------------------'
    Write-Host ''
    
}
