# Revert No confirmation feature
choco feature disable --name=allowGlobalConfirmation

# Cleanup temporary directories
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "C:\eula*.txt"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "C:\install*"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "C:\vcredist*"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "C:\vc_red*"

# Clean environment variables
foreach($var in Get-EnvironmentVariableNames('Machine')) {
    $toRemove = $var.StartsWith("Boxstarter::")
    if($toRemove) {
        Remove-EnvironmentVariable $var 'Machine'
    }
}

foreach($var in Get-EnvironmentVariableNames('User')) {
    $toRemove = $var.StartsWith("Boxstarter::")
    if($toRemove) {
        Remove-EnvironmentVariable $var 'User'
    }
}

RefreshEnv
# if(Test-PendingReboot) { Invoke-Reboot }

# Enable Windows update
Start-UpdateServices
Write-BoxstarterMessage "Running Windows Update..."
Install-WindowsUpdate -AcceptEula

# Enable Microsoft Update
Enable-MicrosoftUpdate

Enable-UAC