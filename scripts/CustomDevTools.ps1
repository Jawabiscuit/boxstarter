## Custom Dev Tools
# Tools that vary from by machine and developer

# Editor
choco install emacs --version 24.5.0.20191123

choco install pandoc
choco install miktex
choco install vcxsrv

# Database
# Temporarily enable/disable features to bypass checksums
# choco feature disable -n=checksumFiles
# choco feature enable -n=allowEmptyChecksums
# 
# try {
#     # TODO: This is taking too long, something not right...
#     choco install pgadmin4
#     choco install postgresql10
# }
# finally {
#     choco feature enable -n=checksumFiles
#     choco feature disable -n=allowEmptyChecksums
# }

# Terminal
# TODO: This is hanging after install!
# choco install microsoft-windows-terminal    

# Package Mgmt
# choco install --limitoutput nugetpackageexplorer

# TODO: Radeon or NVidia graphics? #
# choco install evga-precision-xoc

# System Nfo & Tuner
choco install cue
choco install cpu-z
choco install gpu-z
choco install hwinfo
# TODO: Test on Win Pro
# choco install intel-rst-driver
# choco install intel-xtu
choco install gpg4win
choco install treesizefree