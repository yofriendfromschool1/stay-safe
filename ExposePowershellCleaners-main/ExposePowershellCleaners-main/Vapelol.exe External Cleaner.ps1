$userName = ($env:USERPROFILE -split '\\')[2]
Write-Output "Username is $userName"

Write-Output "Stopping processes (main, vape, scvhost, feds.lol)"
Stop-Process -Name main.v1 -Force -ErrorAction SilentlyContinue
Stop-Process -Name vape -Force -ErrorAction SilentlyContinue
Stop-Process -Name scvhost -Force -ErrorAction SilentlyContinue
Stop-Process -Name feds.lol -Force -ErrorAction SilentlyContinue
Write-Output "Malicious processes stopped"

Write-Output "Deleting executables"
Remove-Item -Path "C:\Users\$userName\AppData\Local\Temp\main\main.v1.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Users\$userName\AppData\Roaming\vape.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Users\$userName\AppData\Roaming\feds.lol.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Users\$userName\AppData\Roaming\scvhost.exe" -Force -ErrorAction SilentlyContinue
Write-Output "Deleted executables"

Write-Output "Removing registry entries (Persistence)"
$registryPaths = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run"
)

foreach ($path in $registryPaths) {
    $keys = Get-Item -Path $path
    foreach ($key in $keys.Property) {
        if ((Get-ItemProperty -Path $path -Name $key).$key -match "main.v1.exe" -or 
            (Get-ItemProperty -Path $path -Name $key).$key -match "vape.exe" -or 
            (Get-ItemProperty -Path $path -Name $key).$key -match "feds.lol.exe" -or 
            (Get-ItemProperty -Path $path -Name $key).$key -match "scvhost.exe") {
            Remove-ItemProperty -Path $path -Name $key -Force -ErrorAction SilentlyContinue
            Write-Output "Removed registry entry: $key"
        }
    }
}
Write-Output "Entries removed"

Write-Output "Removing scheduled tasks (Persistence)"
$tasks = Get-ScheduledTask | Where-Object {$_.Actions -match "main.v1.exe" -or 
                                             $_.Actions -match "vape.exe" -or 
                                             $_.Actions -match "feds.lol.exe" -or 
                                             $_.Actions -match "scvhost.exe"}
foreach ($task in $tasks) {
    Unregister-ScheduledTask -TaskName $task.TaskName -Confirm:$false -ErrorAction SilentlyContinue
    Write-Output "Removed scheduled task: $($task.TaskName)"
}
Write-Output "Tasks removed"

Write-Output "Removing startup items (Persistence)"
$startupPaths = @(
    "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup",
    "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
)

foreach ($path in $startupPaths) {
    $files = Get-ChildItem -Path $path -Filter "*.lnk"
    foreach ($file in $files) {
        if ((Get-ItemProperty -Path $file.FullName).Target -match "main.v1.exe" -or 
            (Get-ItemProperty -Path $file.FullName).Target -match "vape.exe" -or 
            (Get-ItemProperty -Path $file.FullName).Target -match "feds.lol.exe" -or 
            (Get-ItemProperty -Path $file.FullName).Target -match "scvhost.exe") {
            Remove-Item -Path $file.FullName -Force -ErrorAction SilentlyContinue
            Write-Output "Removed startup item: $($file.FullName)"
        }
    }
}
Write-Output "Startup items removed"

Write-Output "Reverting WinDefender changes"
Remove-MpPreference -ExclusionPath "C:\Users\$userName\AppData\Roaming\vape.exe" -ErrorAction SilentlyContinue
Remove-MpPreference -ExclusionProcess "vape.exe" -ErrorAction SilentlyContinue
Remove-MpPreference -ExclusionPath "C:\Users\$userName\AppData\Roaming\scvhost.exe" -ErrorAction SilentlyContinue
Remove-MpPreference -ExclusionProcess "scvhost.exe" -ErrorAction SilentlyContinue
Write-Output "WinDefender reverted"

Write-Output "Cleaning temp files"
$ErrorActionPreference = "SilentlyContinue"
if (Test-Path "C:\Users\$userName\AppData\Local\Temp") {
    Get-ChildItem -Path "C:\Users\$userName\AppData\Local\Temp" -Recurse -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
}
Write-Output "Temp files cleaned"
$ErrorActionPreference = "Continue"

Write-Output "Cleaning roaming and cached files"
Remove-Item -Path "C:\Users\$userName\AppData\Roaming\encabezado" -Recurse -Force -ErrorAction SilentlyContinue
Write-Output "Finished cleaning roaming and cached"

Write-Output "ggez bye bye malware"
Write-Output "credit to nspe lol"
Write-Output "------------------"
Write-Output "JOIN THE DISCORD: discord.gg/2fSx3nBzxb"
