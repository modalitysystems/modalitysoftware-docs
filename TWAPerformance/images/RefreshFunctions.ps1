Connect-AzAccount
Get-AzSubscription | Select-Object Id, Name, State | Sort-Object Name | Format-Table

$SubscriptionId = $(Read-Host "Please enter the subscription id where Teamwork Analytics Performance has been deployed"`n)

$AzContext = Set-AzContext -Subscription $SubscriptionId
Get-AzResourceGroup | Select-Object ResourceGroupName, Location, ProvisioningState | Sort-Object Name | Format-Table

$ResourceGroupName = $(Read-Host "Please enter the Resource Group name where Teamwork Analytics Performance has been deployed to"`n)

$Functions = Get-AzResource -ResourceGroupName $ResourceGroupName -ResourceType Microsoft.Web/sites

foreach ($Function in $Functions) {
    Write-Host "Syncing function $($Function.Name)"
    $Command = Invoke-AzResourceAction -ResourceGroupName $ResourceGroupName -ResourceType Microsoft.Web/sites -ResourceName $Function.Name -Action syncfunctiontriggers -Force
	Write-Host $Command.status
}
pause