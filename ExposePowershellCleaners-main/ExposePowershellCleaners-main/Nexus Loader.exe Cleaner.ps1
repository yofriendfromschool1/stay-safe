$userName = $env:USERNAME

Write-Output "Stopping malicious processes (Nexus, XWorm, XMRig)"
Stop-Process -Name dllhost -Force -ErrorAction SilentlyContinue
Stop-Process -Name xorpgg -Force -ErrorAction SilentlyContinue
Stop-Process -Name nkkypq -Force -ErrorAction SilentlyContinue
Stop-Process -Name "Nexus Loader" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "kanilzbpgdul" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "Windows Runtime" -Force -ErrorAction SilentlyContinue
Write-Output "Malicious processes stopped"

Write-Output "Deleting executables"
Remove-Item -Path "C:\Users\$userName\AppData\Roaming\dllhost.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Users\$userName\AppData\Local\Temp\xorpgg.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Users\$userName\AppData\Local\Temp\nkkypq.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Users\$userName\AppData\Local\Temp\onefile_696_133626440050710383\.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Users\$userName\AppData\Local\Temp\Nexus Loader.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\ProgramData\hvforlxxtnuo\kanilzbpgdul.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\ProgramData\Windows Runtime.exe" -Force -ErrorAction SilentlyContinue
Write-Output "Deleted executables"

Write-Output "Removing registry entries (Persistence)"
$registryPaths = @(
    "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run",
    "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run"
)

foreach ($path in $registryPaths) {
    $keys = Get-Item -Path $path
    foreach ($key in $keys.Property) {
        if ((Get-ItemProperty -Path $path -Name $key).$key -match "dllhost.exe" -or 
            (Get-ItemProperty -Path $path -Name $key).$key -match "xorpgg.exe" -or 
            (Get-ItemProperty -Path $path -Name $key).$key -match "nkkypq.exe" -or 
            (Get-ItemProperty -Path $path -Name $key).$key -match "Nexus Loader.exe" -or 
            (Get-ItemProperty -Path $path -Name $key).$key -match "kanilzbpgdul.exe" -or 
            (Get-ItemProperty -Path $path -Name $key).$key -match "Windows Runtime.exe") {
            Remove-ItemProperty -Path $path -Name $key -Force -ErrorAction SilentlyContinue
            Write-Output "Removed registry entry: $key"
        }
    }
}
Write-Output "Entries Removed"

Write-Output "Removing scheduled tasks (Persistence)"
$tasks = Get-ScheduledTask | Where-Object {$_.Actions -match "dllhost.exe" -or 
                                             $_.Actions -match "xorpgg.exe" -or 
                                             $_.Actions -match "nkkypq.exe" -or 
                                             $_.Actions -match "Nexus Loader.exe" -or 
                                             $_.Actions -match "kanilzbpgdul.exe" -or 
                                             $_.Actions -match "Windows Runtime.exe"}
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
        if ((Get-ItemProperty -Path $file.FullName).Target -match "dllhost.exe" -or 
            (Get-ItemProperty -Path $file.FullName).Target -match "xorpgg.exe" -or 
            (Get-ItemProperty -Path $file.FullName).Target -match "nkkypq.exe" -or 
            (Get-ItemProperty -Path $file.FullName).Target -match "Nexus Loader.exe" -or 
            (Get-ItemProperty -Path $file.FullName).Target -match "kanilzbpgdul.exe" -or 
            (Get-ItemProperty -Path $file.FullName).Target -match "Windows Runtime.exe") {
            Remove-Item -Path $file.FullName -Force -ErrorAction SilentlyContinue
            Write-Output "Removed startup item: $($file.FullName)"
        }
    }
}
Write-Output "Startup items removed"

Write-Output "Reverting WinDefender Changes"
Remove-MpPreference -ExclusionPath "C:\Users\$userName\AppData\Roaming\dllhost.exe" -ErrorAction SilentlyContinue
Remove-MpPreference -ExclusionProcess 'dllhost.exe' -ErrorAction SilentlyContinue
Remove-MpPreference -ExclusionPath "C:\ProgramData\Windows Runtime.exe" -ErrorAction SilentlyContinue
Remove-MpPreference -ExclusionProcess 'Windows Runtime.exe' -ErrorAction SilentlyContinue
Write-Output "WinDefender Reverted"

Write-Output "Cleaning temp files"
if (Test-Path "C:\Users\$userName\AppData\Local\Temp") {
    Get-ChildItem -Path "C:\Users\$userName\AppData\Local\Temp" -Recurse | Remove-Item -Force -ErrorAction SilentlyContinue
}
Write-Output "Temp files cleaned"

Write-Output "Cleaning roaming and cached files"
Remove-Item -Path "C:\Users\$userName\AppData\Roaming\encabezado" -Recurse -Force -ErrorAction SilentlyContinue
Write-Output "Finished cleaning roaming and cached"

Write-Output "ggez bye bye Nexus Loader"
Write-Output "credit to nspe lol"
Write-Output "------------------"
Write-Output "JOIN THE DISCORD: discord.gg/2fSx3nBzxb"
