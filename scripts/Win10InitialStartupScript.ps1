<#
Win10 Initial Startup Script

.Description
  Download git archive and preset file and run script to setup a new Windows 10 install.
  See https://github.com/Disassembler0/Win10-Initial-Setup-Script
.Example
  1) Open powershell as administrator
  2) `Set-ExecutionPolicy AllSigned -Force` to allow execution of scripts
  3) Find the raw URL to this gist
  4) Create your own preset and edit the `$presetUrl`
  4) `iex ((new-object net.webclient).DownloadString("https://gist.githubusercontent.com/<USER>/.../win10-iss.ps1")` to execute
#>

# Download the archive for the latest updates
$url = "https://github.com/Disassembler0/Win10-Initial-Setup-Script/archive/master.zip"
$presetUrl = "https://gist.githubusercontent.com/Jawabiscuit/31bce47c991528541b6a4fdedff7b15a/raw/685b9656163a52e754f8bbf546f1da841b749b67/win10-iss.preset"
$presetFile = "win10-iss.preset"
$archiveName = "master.zip"
$installDir = Join-Path $env:UserProfile "Tools\win10-initial-setup-script"
$archive = Join-Path $installDir $archiveName
$win10IssDir = Join-Path $installDir "Win10-Initial-Setup-Script-master"

if (-not (Test-Path $installDir)) {
    New-Item $installDir -ItemType Directory
}

if (!(Test-Path $archive)) {
    Write-Host "[installer.win10-initial-setup-script] Downloading..."
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -Uri "$url" -OutFile "$archive"
}

if (Test-Path "$archive") {
    $zipfile = Get-Item "$archive"
    Write-Host "[installer.win10-initial-setup-script] Downloaded successfully"
    Write-Host "[installer.win10-initial-setup-script] Extracting $archive to ${installDir}..."
    if (Test-Path $win10IssDir) {
        Remove-Item -Recurse -Force -Path $win10IssDir
    }
    Expand-Archive $archive -DestinationPath $zipfile.DirectoryName
} else {
    Write-Error "[installer.win10-initial-setup-script] Download failed"
}

if (Test-Path $win10IssDir) {
    cd $win10IssDir
    wget $presetUrl -outfile $presetFile
}

# Set policy before executing scripts
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

if (Test-Path $presetFile) {
    $script = '.\Win10.ps1'
    $params = '-include Win10.psm1 -preset ' + $presetFile
    iex "$script $params"
}

