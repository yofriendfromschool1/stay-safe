$userName = $env:USERNAME

Write-Output "Stopping Processes (Feather & GooseDesktop)"
Stop-Process -Name FeatherV2 -Force -ErrorAction SilentlyContinue
Stop-Process -Name GooseDesktop -Force -ErrorAction SilentlyContinue
Stop-Process -Name feather -Force -ErrorAction SilentlyContinue
Write-Output "Processes stopped."

Write-Output "Deleting executables (Feather & GooseDesktop)"
$executables = @(
    "C:\Users\$userName\AppData\Local\Temp\2hheqgmb0veHdTSrpfO1ov9gLDF\FeatherV2.exe",
    "C:\Users\$userName\AppData\Local\Temp\EIr\EvilGoose\hg\GooseDesktop.exe",
    "C:\Users\$userName\AppData\Local\Temp\feather.exe",
    "C:\Users\$userName\AppData\Local\Temp\2hk9jVms5WvWmk3O377CwL22qEI\feather.exe"
)
foreach ($executable in $executables) {
    Remove-Item -Path $executable -Force -ErrorAction SilentlyContinue
}
Write-Output "Executables deleted."

Write-Output "Removing registry entries"
$registryPaths = @("HKCU:\Software\Microsoft\Windows\CurrentVersion\Run")
foreach ($path in $registryPaths) {
    $keys = Get-Item -Path $path
    foreach ($key in $keys.Property) {
        if ((Get-ItemProperty -Path $path -Name $key).$key -match "FeatherV2.exe" -or (Get-ItemProperty -Path $path -Name $key).$key -match "GooseDesktop.exe" -or (Get-ItemProperty -Path $path -Name $key).$key -match "feather.exe") {
            Remove-ItemProperty -Path $path -Name $key -Force -ErrorAction SilentlyContinue
            Write-Output "Removed registry entry: $key"
        }
    }
}
Write-Output "Entries removed"

Write-Output "Removing scheduled tasks (Persistence)"
$tasks = Get-ScheduledTask | Where-Object {$_.Actions -match "FeatherV2.exe" -or $_.Actions -match "GooseDesktop.exe" -or $_.Actions -match "feather.exe"}
foreach ($task in $tasks) {
    Unregister-ScheduledTask -TaskName $task.TaskName -Confirm:$false -ErrorAction SilentlyContinue
    Write-Output "Removed scheduled task: $($task.TaskName)"
}
Write-Output "Scheduled tasks removed"

Write-Output "Removing startup items"
$startupPaths = @("$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup", "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Startup")
foreach ($path in $startupPaths) {
    $files = Get-ChildItem -Path $path -Filter "*.lnk"
    foreach ($file in $files) {
        if ((Get-ItemProperty -Path $file.FullName).Target -match "FeatherV2.exe" -or (Get-ItemProperty -Path $file.FullName).Target -match "GooseDesktop.exe" -or (Get-ItemProperty -Path $file.FullName).Target -match "feather.exe") {
            Remove-Item -Path $file.FullName -Force -ErrorAction SilentlyContinue
            Write-Output "Removed startup item: $($file.FullName)"
        }
    }
}
Write-Output "Startup items removed"

Write-Output "Cleaning temporary files"
if (Test-Path "C:\Users\$userName\AppData\Local\Temp") {
    Get-ChildItem -Path "C:\Users\$userName\AppData\Local\Temp" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
}
Write-Output "Temporary files cleaned"

Write-Output "Cleanup of Roaming and CachedFiles"
Remove-Item -Path "C:\Users\$userName\AppData\Roaming\encabezado" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Users\$userName\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles\FeatherV2.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Users\$userName\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles\feather.exe" -Force -ErrorAction SilentlyContinue
Write-Output "Finished extra cleanup"

Write-Output "Removing PowerShell scripts"
$psScripts = @(
    "C:\Users\$userName\AppData\Local\Temp\XkQnCrFhC1uU_tezmp.ps1",
    "C:\Users\$userName\AppData\Roaming\salutqVsKU.ps1"
)
foreach ($script in $psScripts) {
    Remove-Item -Path $script -Force -ErrorAction SilentlyContinue
}
Write-Output "PowerShell scripts removed"

Write-Output "Removing PowerShell exclusions"
Remove-MpPreference -ExclusionPath "C:\Users\$userName\AppData" -ErrorAction SilentlyContinue
Remove-MpPreference -ExclusionPath "C:\Users\$userName\Local" -ErrorAction SilentlyContinue
Write-Output "PowerShell exclusions removed"

Write-Output "----------------------------------------------"
Write-Output "JOIN THE DISCORD SERVER: discord.gg/2fSx3nBzxb"
