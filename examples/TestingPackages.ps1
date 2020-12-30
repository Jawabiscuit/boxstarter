<#
The repository location can be found using the $boxstarter settings variable in
$Boxstarter.LocalRepo

This location can be changed using the Set-BoxstarterConfig command.
#>
Set-BoxStarterConfig -LocalRepo "c:\dev\Chocolatey-Packages"

<#
By changing the location of the boxstarter repository with Set-BoxstarterConfig all future
interactions with the Boxstarter repository will act on this location.

To temporarily change the repository location just for the current PowerShell session, one
can change the value of $Boxstarter.LocalRepo directly.

$Boxstarter.LocalRepo = "c:\dev\Chocolatey-Packages"
#>