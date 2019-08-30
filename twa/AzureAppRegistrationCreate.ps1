$hasModule = Get-Module -ListAvailable -Name "AzureAD"
If(-Not $hasModule) {
    throw 'This script requires the AzureAD module to run. See: https://docs.microsoft.com/en-us/powershell/azure/active-directory/install-adv2?view=azureadps-2.0'
}

#Variables

    $redirectUri = "https://login.live.com/oauth20_desktop.srf"

#Connect to Azure

    Connect-AzureAD

#Create API Permission List
#Best way to find these IDs is to add them manually to the app via the portal and then look at the ID via https://graph.microsoft.com/beta/applications

    $access = New-Object -TypeName "Microsoft.Open.AzureAD.Model.RequiredResourceAccess"
    $access.ResourceAccess = New-Object System.Collections.Generic.List[Microsoft.Open.AzureAD.Model.ResourceAccess]

    #Directory.Read.All
    $access.ResourceAccess.Add($(New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList "7ab1d382-f21e-4acd-a863-ba3e13f7da61","Role"))

    #Files.Read.All
    $access.ResourceAccess.Add($(New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList "01d4889c-1287-42c6-ac1f-5d1e02578ef6","Role"))

    #Group.Read.All
    $access.ResourceAccess.Add($(New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList "5b567255-7703-4780-807c-7be8301ae99b","Role"))

    #Reports.Read.All
    $access.ResourceAccess.Add($(New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList "230c1aed-a721-4c5d-9cb4-a90514e508ef","Role"))

    #Sites.Read.All
    $access.ResourceAccess.Add($(New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList "332a536c-c7ef-4017-ab91-336970924f0d","Role"))

    #User.Read.All
    $access.ResourceAccess.Add($(New-Object -TypeName "Microsoft.Open.AzureAD.Model.ResourceAccess" -ArgumentList "df021288-bdef-4463-88db-98f22de89214","Role"))

    $access.ResourceAppId = "00000003-0000-0000-c000-000000000000"

try
{

#Create Application

    $application = `
        New-AzureADApplication `
            -DisplayName "Modality Teamwork Analytics" `
            -HomePage "https://www.modalitysystems.com/software/teamwork-analytics" `
            -ReplyUrls @("https://login.live.com/oauth20_desktop.srf") `
            -RequiredResourceAccess $access


#Create Application Secret

    $startDate = Get-Date
    $endDate = $startDate.AddYears(10)
    $appKeyPwd = New-AzureADApplicationPasswordCredential -ObjectId $application.ObjectId -CustomKeyIdentifier "Primary" -StartDate $startDate -EndDate $endDate

}
catch
{
    Write-Host "An error occured creating application. Terminating script" -ForegroundColor Red
    exit
}

#Admin Consent

    Write-host "Application created successfully`r`n" -ForegroundColor Green
    Write-host "Would you like to grant admin consent now? This will open a browser window which an Azure AD global administration must grant to use the application. A Url to perform Admin consent will be provided at the end of this script (Default is Yes)" -ForegroundColor Yellow 
    $readhost = Read-Host " ( y / n ) " 
    Switch ($readhost) 
     { 
       Y {Write-host "Yes, Grant Admin Consent now"; $grantConsent=$true} 
       N {Write-Host "No, Grant Admin Consent later"; $grantConsent=$false} 
       Default {Write-Host "Default, Grant Admin Consent now"; $grantConsent=$true} 
     } 


    $consentUrl = "https://login.microsoftonline.com/common/oauth2/authorize?" + `
                    "client_id=$($application.AppId)" + `
                    "&response_type=code" + `
                    "&redirect_uri=$redirectUri" + `
                    "&response_mode=query" + `
                    "&state=12345" + `
                    "&prompt=admin_consent"

    if($grantConsent -eq $true)
    {
        Start-Process -FilePath $consentUrl
    }

#Output

    Write-Host "`r`n"
    Write-Host "Application ID = $($application.AppId)" -ForegroundColor Green
    Write-Host "Application Password = $($appKeyPwd.Value)" -ForegroundColor Green
    Write-Host "Application Redirect Uri = $redirectUri" -ForegroundColor Green
    Write-Host "Admin Consent Url = $consentUrl" -ForegroundColor Green
