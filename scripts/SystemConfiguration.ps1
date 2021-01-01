## System Configuration

$computername = "vrexton2"

# Regional Settings
& "$env:windir\system32\tzutil.exe" /s "Eastern Standard Time"
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sShortDate -Value 'dd MM yy'
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sShortTime -Value 'HH:mm tt'
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sTimeFormat -Value 'HH:mm:ss tt'

# Enable developer mode on the system
Set-ItemProperty -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\AppModelUnlock -Name AllowDevelopmentWithoutDevLicense -Value 1

# Turn off screensaver
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name ScreenSaveActive -Value 0

# Disable UAC popups
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name EnableLUA -Value 0 -Force

# Requires restart, or add the -Restart flag
if ($env:computername -ne $computername) {
	Rename-Computer -NewName $computername
}
    
# Set DNS upstreams
# Set-DNSClientServerAddress -InterfaceIndex $(Get-NetAdapter | Where-object {$_.Name -like "*Wi-Fi*" } | Select-Object -ExpandProperty InterfaceIndex) -ServerAddresses "8.8.8.8", "1.1.1.1", "2001:4860:4860::8888", "2001:4860:4860::8844"

Set-StartScreenOptions -EnableBootToDesktop

if (Test-PendingReboot) { Invoke-Reboot }
