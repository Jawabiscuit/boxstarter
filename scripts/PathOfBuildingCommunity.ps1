## Setup PoB-Community
$url = 'https://github.com/PathOfBuildingCommunity/PathOfBuilding/archive/master.zip'
$archiveName = 'pob-community-1.4.170.20.zip'
$installDir = "C:\tools\Path of Building Community"
$pobDir = Join-Path $installDir "PathOfBuilding-master"
$archive = Join-Path $installDir $archiveName

if (-not (Test-Path installDir)) {
    New-Item $installDir -ItemType Directory
}

if(!(Test-Path $archive)) {
    Write-Host "[installer.pob-community] Downloading..."
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -Uri "$url" -OutFile "$archive"
}

if(Test-Path "$archive") {
    $zipfile = Get-Item "$archive"
    Write-Host "[installer.pob-community] Downloaded successfully"
    Write-Host "[installer.pob-community] Extracting $archive to ${installDir}..."
    if (Test-Path $pobDir) {
        Remove-Item -Recurse -Force -Path $pobDir -ErrorAction SilentlyContinue
    }
    Expand-Archive $archive -DestinationPath $zipfile.DirectoryName
} else {
    Write-Error "[installer.pob-community] Download failed"
}

# Pin items to the taskbar
Install-ChocolateyPinnedTaskBarItem -TargetFilePath "$pobDir\Path of Building.exe"
