# Get all resource groups
$resourceGroups = Get-AzResourceGroup

# Create an array to store the content for list.txt
$listContent = @()

# Iterate through each resource group
foreach ($resourceGroup in $resourceGroups) {
    $resourceGroupName = $resourceGroup.ResourceGroupName

    # Get VMs in the resource group
    $vms = Get-AzVM -ResourceGroupName $resourceGroupName

    # Output resource group and its VMs in the specified format if VMs exist
    if ($vms) {
        $vmNames = $vms.Name | ForEach-Object { '"{0}"' -f $_ }
        $vmsString = $vmNames -join ','
        $listContent += "resource_groups_name: $resourceGroupName"
        $listContent += "vms: [$vmsString]"
        $listContent += ""
    }
}

# Save the content to list.txt
$listFilePath = "test.txt"
$listContent | Out-File -FilePath $listFilePath

Write-Output "Output has been saved to test.txt."
