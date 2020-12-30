choco install --limitoutput visualstudio2017community

choco pin add -n=visualstudio2017community

# Workloads for game development in engines like UE4
choco install --limitoutput visualstudio2017-workload-manageddesktop
choco install --limitoutput visualstudio2017-workload-nativedesktop
choco install --limitoutput visualstudio2017-workload-universal
choco install --limitoutput visualstudio2017-workload-universalbuildtools
choco install --limitoutput visualstudio2017-workload-datascience
choco install --limitoutput visualstudio2017-workload-nativegame
choco install --limitoutput visualstudio2017-workload-managedgame
choco install --limitoutput visualstudio2017-workload-nativecrossplat

Install-ChocolateyPinnedTaskBarItem "$($Boxstarter.programFiles86)\Microsoft Visual Studio\Community\Common7\IDE\devenv.exe"