# TODO: Decide if a drive should be dedicated to just source code.
function New-SourceCodeFolder {
    $sourceCodeFolder = 'GitHub'
    if (Test-Path env:\BoxStarter:SourceCodeFolder) {
        $sourceCodeFolder = $env:BoxStarter:SourceCodeFolder
    }
    if ([System.IO.Path]::IsPathRooted($sourceCodeFolder)) {
        $sourceCodePath = $sourceCodeFolder
    }
    else {
        $drivePath = Get-DataDrive
        $sourceCodePath = Join-Path "$drivePath`:" $sourceCodeFolder
    }
    if (-not (Test-Path $sourceCodePath)) {
        New-Item $sourceCodePath -ItemType Directory
    }
    return $sourceCodePath
}

function New-InstallCache {
    param
    (
        [String]
        $InstallDrive
    )
    $tempInstallFolder = Join-Path $InstallDrive "temp\install-cache"
    if (-not (Test-Path $tempInstallFolder)) {
        New-Item $tempInstallFolder -ItemType Directory
    }
    return $tempInstallFolder
}

function Move-WindowsLibrary {
    param(
        $libraryName,
        $newPath
    )
    if (-not (Test-Path $newPath)) {
        Move-LibraryDirectory -libraryName $libraryName -newPath $newPath
    }
}

# TODO: Make VM drives? Do this when not creating VM? Multiple media/data drives?
function Move-WindowsLibraries {
    if(-not (Test-Path Env:\BoxStarter:CustomiseFolders)) {
        return
    }
   
    # Set-Volume -DriveLetter $sytemDrive -NewFileSystemLabel "OS"

    $dataDriveLetter = Get-DataDrive
    $dataDrive = "$dataDriveLetter`:"
    $mediaDriveLetter = Get-MediaDrive
    $mediaDrive = "$mediaDriveLetter`:"

    # if (Get-SystemDrive -eq $dataDriveLetter) {
    #     return
    # }

    Write-BoxstarterMessage "Configuring Data and Media drives"

    Set-Volume -DriveLetter $dataDriveLetter -NewFileSystemLabel "Data"
    Set-Volume -DriveLetter $mediaDriveLetter -NewFileSystemLabel "Media"

    Move-WindowsLibrary -libraryName "Personal" -newPath (Join-Path $dataDrive "Documents")
    Move-WindowsLibrary -libraryName "Desktop" -newPath (Join-Path $dataDrive "Desktop")
    Move-WindowsLibrary -libraryName "Downloads" -newPath (Join-Path $dataDrive "Downloads")
    Move-WindowsLibrary -libraryName "Pictures" -newPath (Join-Path $mediaDrive "Pictures")
    Move-WindowsLibrary -libraryName "Video" -newPath (Join-Path $mediaDrive "Videos")
    Move-WindowsLibrary -libraryName "Music" -newPath (Join-Path $mediaDrive "Music")
}
