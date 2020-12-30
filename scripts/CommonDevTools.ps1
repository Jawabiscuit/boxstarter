# Tools devs normally want
# NOTE: vscode is a separate script

choco install --limitoutput sysinternals
choco install --limitoutput dotnetcore-sdk
choco install --limitoutput javaruntime
choco install --limitoutput jdk8
choco install --limitoutput git.install -params "'/GitAndUnixToolsOnPath /WindowsTerminal /NoAutoCrlf'"
choco install --limitoutput python
choco install --limitoutput anaconda2
choco install --limitoutput cygwin
choco install --limitoutput 7zip.install

# File Xfer
choco install --limitoutput winscp
choco install --limitoutput putty
choco install --limitoutput filezilla

choco install chocolatey --limitoutput
choco install boxstarter --limitoutput

# pin apps that update themselves
choco pin add -n=vscode
