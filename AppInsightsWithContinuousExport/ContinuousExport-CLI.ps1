<#
Required tools
1. Powershell 7.1 - https://github.com/PowerShell/PowerShell/releases/tag/v7.1.1
2. Azure Powershell = https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-5.3.0
3. Credentials and details from your azure storage account
#>

$resourceGroup = "bozy-demo-appinsights-rg"
$storageAcName = "bozy-demo-storageaccount" 
$storageAcKey = "yourstorageaccountkeygoeshere"
$containerName = "appinsightsexport"
$appInsightsName = "bozy-demo-appinsights"
$subscriptionId = "yoursubscriptioIdgoeshere"
$location = "southeastasia"

Connect-AzAccount
Set-AzContext -Subscription $subscriptionId


$ctx = New-AzStorageContext -StorageAccountName $storageAcName -StorageAccountKey $storageAcKey
#$ctx2 = Set-AzCurrentStorageAccount -ResourceGroupName $resourceGroup -AccountName $storageAcName

#Create the Storage Container
New-AzStorageContainer -Name $containerName -Context $ctx -Permission Off



#Link the newly created storage container to the Continuous Export setting of the application insights
$sastoken = New-AzStorageContainerSASToken -Name $containerName -Context $ctx -ExpiryTime (Get-Date).AddYears(20) -Permission w
#$sastoken = New-AzStorageContainerSASToken -Name $containerName -Policy $containerpolicy
$sasuri = "https://$storageAcName.blob.core.windows.net/$containerName" + $sastoken
Write-Host $sasuri
New-AzApplicationInsightsContinuousExport -ResourceGroupName $resourceGroup -Name $appInsightsName -DocumentType "Request", "Exception", "Custom Event", "Trace", "Metric", "Page Load", "Page View", "Dependency", "Availability", "Performance Counter" -StorageAccountId "/subscriptions/$subscriptionId/resourceGroups/$resourceGroup/providers/Microsoft.Storage/storageAccounts/$storageAcName" -StorageLocation $location -StorageSASUri $sasuri

