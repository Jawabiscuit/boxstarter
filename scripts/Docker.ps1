Enable-WindowsOptionalFeature -Online -FeatureName containers -All
RefreshEnv

choco install --limitoutput docker-for-windows
choco install --limitoutput vscode-docker

# pin apps that update themselves
choco pin add -n=docker-for-windows
