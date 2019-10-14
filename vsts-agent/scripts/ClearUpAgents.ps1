Param(
 [String]$personaltoken,
 [String]$companyname,
 [String]$poolid
)
$encodedtoken =[System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$($personaltoken)"))
$headers = @{authorization = "Basic $encodedtoken"}

$agents = Invoke-RestMethod -uri "https://dev.azure.com/$($companyname)/_apis/distributedtask/pools/$($poolid)/agents?api-version=5.1" -Method Get -Headers $headers
$agents.value |
    Where-Object { $_.status -eq 'offline' } |
    ForEach-Object {
        Invoke-RestMethod -uri "https://dev.azure.com/$($companyname)/_apis/distributedtask/pools/$($poolid)/agents/$($_.id)?api-version=5.1" -Method Delete -Headers $headers
    }