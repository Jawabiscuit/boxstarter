## File Explorer
# Currenly rely on Win10-Initial-Setup-Script for these settings
# Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar -DisableOpenFileExplorerToQuickAccess -DisableShowRecentFilesInQuickAccess -DisableShowFrequentFoldersInQuickAccess -EnableExpandToOpenFolder -EnableShowRibbon

Set-BoxstarterTaskbarOptions -Size Small -Dock Bottom -Combine Always -MultiMonitorOn -MultiMonitorMode All -MultiMonitorCombine Always

# Sets window corner navigation options for Windows 8/8.5
# Set-CornerNavigationOptions -EnableUpperRightCornerShowCharms -EnableUpperLeftCornerSwitchApps -EnableUsePowerShellOnWinX

# Taskbar where window is open for multi-monitor
# Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name MMTaskbarMode -Value 2
