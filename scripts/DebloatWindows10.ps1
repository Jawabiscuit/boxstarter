<#
Debloat Windows 10
.Description
  Download git archive and run scripts to debloat a new Windows 10 install.
.Example
  1) Open powershell as administrator
  2) `Set-ExecutionPolicy AllSigned -Force` to allow execution of scripts
  3) Find the raw URL to this gist
  4) `iex ((new-object net.webclient).DownloadString("https://gist.githubusercontent.com/<USER>/.../debloat-windows-10.ps1")` to execute
#>

# Download the archive for the latest updates
$url = "https://github.com/Jawabiscuit/Debloat-Windows-10/archive/master.zip"
$archiveName = "master.zip"
$installDir = Join-Path $env:UserProfile "Tools\debloat-windows-10"
$archive = Join-Path $installDir $archiveName
$debloatDir = Join-Path $installDir "Debloat-Windows-10-master"

if (-not (Test-Path installDir)) {
    New-Item $installDir -ItemType Directory
}

if(!(Test-Path $archive)) {
    Write-Host "[installer.debloat-windows-10] Downloading..."
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -Uri "$url" -OutFile "$archive"
}

if(Test-Path "$archive") {
    $zipfile = Get-Item "$archive"
    Write-Host "[installer.debloat-windows-10] Downloaded successfully"
    Write-Host "[installer.debloat-windows-10] Extracting $archive to ${installDir}..."
    if (Test-Path $debloatDir) {
        Remove-Item -Recurse -Force -Path $debloatDir
    }
    Expand-Archive $archive -DestinationPath $zipfile.DirectoryName -Force
} else {
    Write-Error "[installer.debloat-windows-10] Download failed"
}

# Set policy before importing modules or executing scripts
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

# Hard code module names for now
$mod_fnames = @(
    "New-FolderForced.psm1",
    "take-own.psm1"
)
$modules = @()
$moduleDir = Join-Path $debloatDir "lib"
foreach ($m in $mod_fnames) {
    $modules += (Join-Path $moduleDir $m)
}

foreach ($mod in $modules) {
    if (Test-Path $mod) {
        Import-Module $mod
    } else {
        Write-Error "[installer.debloat-windows-10] Error missing module: $mod"
    }
}

# Get scripts to run
$filenames = @(
    "remove-default-apps.ps1",
    "remove-onedrive.ps1"
)

$scripts = @()
$scriptsDir = Join-Path $debloatDir "scripts"
foreach ($f in $filenames) {
    $scripts += (Join-Path $scriptsDir $f)
}

# Execute the scripts
foreach ($s in $scripts) {
    if (Test-Path $s) {
        try {
            iex ((Get-Content $s) -join [environment]::newline)
        } catch {
            Write-Host "[installer.debloat-windows-10] Warning: Error occurred running $s"
        }
    }
}