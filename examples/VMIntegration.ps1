# New-BoxstarterPackage -Name GameDev -Description "New machine configuration for game development." -Path "Q:\GitHub\boxstarter"

# $cred=Get-Credential domain\username "Boxstarter" | Enable-BoxstarterVM -Credential $cred | Install-BoxstarterPackage -PackageName boxstarter

$cred=Get-Credential domain\username
Enable-BoxstarterVM -VMName Boxstarter -Credential $cred -CheckPointName Checkpoint:BareOS | Install-BoxstarterPackage -PackageName GameDev