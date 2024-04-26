param
(

    [Parameter(HelpMessage="Storage Account Name")]
    [string] $storageAccountName = "Dev",

    [Parameter(HelpMessage="Resource Group Name")]
    [string] $resourceGroupName = "foo",

    [Parameter(HelpMessage="Container Name")]
    [string] $containerName = "xyz"

)

# Check if the storage account exists, if not, create it
if (!(Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -ErrorAction SilentlyContinue)) {
    New-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName -SkuName Standard_LRS -Location "your_location"
}

# Get the storage account context
$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName
$ctx = $storageAccount.Context

# Check if the container already exists
if (!(Get-AzStorageContainer -Context $ctx -Name $containerName -ErrorAction SilentlyContinue)) {
    # If the container doesn't exist, create it
    New-AzStorageContainer -Name $containerName -Context $ctx -Permission Off
    Write-Output "Container '$containerName' created successfully."
} else {
    Write-Output "Container '$containerName' already exists."
}
