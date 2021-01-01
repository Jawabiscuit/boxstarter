## Visual Studio 2017 - GameDev
choco install visualstudio2017community

choco pin add -n=visualstudio2017community

# Workloads for game development in engines like UE4
choco install visualstudio2017-workload-manageddesktop --cacheLocation "C:\vs_cache"
choco install visualstudio2017-workload-nativedesktop --cacheLocation "C:\vs_cache"
choco install visualstudio2017-workload-universal --cacheLocation "C:\vs_cache"
choco install visualstudio2017-workload-universalbuildtools --cacheLocation "C:\vs_cache"
# choco install visualstudio2017-workload-datascience --cacheLocation "C:\vs_cache"
choco install visualstudio2017-workload-nativegame --cacheLocation "C:\vs_cache"
choco install visualstudio2017-workload-managedgame --cacheLocation "C:\vs_cache"
choco install visualstudio2017-workload-nativecrossplat --cacheLocation "C:\vs_cache"

Install-ChocolateyPinnedTaskBarItem -TargetFilePath "${env:ProgramFiles(x86)}\Microsoft Visual Studio\2017\Community\Common7\IDE\devenv.exe"
