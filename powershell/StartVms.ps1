$vm = Get-Azvm -Status

foreach($vms in $vm)
{
   $statuscheck = Get-AzVM -ResourceGroupName $vms.ResourceGroupName -Name $vms.Name -Status 
    if($statuscheck.Statuses.DisplayStatus[1] -eq "VM deallocated")
    {  

        Write-Output "Starting virtual machine...$($vms.Name)"

        Start-AzVM -ResourceGroupName $vms.ResourceGroupName -Name $vms.Name 
    }   
    else
    {
        Write-output "Virtual machine $($vms.Name) is already in running state"
    }
}
