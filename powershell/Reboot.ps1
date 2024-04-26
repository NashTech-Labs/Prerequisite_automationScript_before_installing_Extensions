$vm = Get-Azvm -Status

foreach($vms in $vm)
{
   $statuscheck = Get-AzVM -ResourceGroupName $vms.ResourceGroupName -Name $vms.Name -Status 
    if($statuscheck.Statuses.DisplayStatus[1] -eq "VM Running")
    {  

        Write-Output "Restarting virtual machine...$($vms.Name)"

        Restart-AzVM -ResourceGroupName $vms.ResourceGroupName -Name $vms.Name 
    }   
  
}
