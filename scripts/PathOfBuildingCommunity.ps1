# Setup PoB-Community
$url = 'https://github.com/PathOfBuildingCommunity/PathOfBuilding/releases/download/v1.4.170.20/PathOfBuildingCommunity-Setup-1.4.170.20.zip'
$archiveName = 'pob-community-1.4.170.20.zip'
$installDir = Join-Path $env:UserProfile\Apps "Path of Building Community"
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
    Expand-Archive $archive -DestinationPath $zipfile.DirectoryName
} else {
    Write-Error "[installer.pob-community] Download failed"
}

# Pin items to the taskbar
Install-ChocolateyPinnedTaskBarItem "$installDir\Path of Building.exe"