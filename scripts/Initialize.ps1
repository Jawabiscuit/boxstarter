Disable-UAC

# Allow unattended reboots
$Boxstarter.RebootOk = $true
$Boxstarter.NoPassword = $false
$Boxstarter.AutoLogin = $true

# No confirmation i.e. --yes
choco feature enable --name=allowGlobalConfirmation

# Allow execution of powershell scripts
Update-ExecutionPolicy Unrestricted

# Disable Microsoft and Windows update
Disable-MicrosoftUpdate