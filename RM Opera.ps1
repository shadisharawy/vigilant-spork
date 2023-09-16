$foldersToCheck = @(
    "${env:ProgramFiles}\Opera",
    "${env:ProgramFiles(x86)}\Opera"
)

foreach ($folderPath in $foldersToCheck) {
    if (Test-Path $folderPath -PathType Container) {
        try {
            Remove-Item -Path $folderPath -Recurse -Force -ErrorAction Stop
            Write-Host "Folder '$folderPath' has been deleted."
        } catch {
            Write-Host "Error deleting folder '$folderPath': $_"
        }
    } else {
        Write-Host "Folder '$folderPath' does not exist."
    }
}