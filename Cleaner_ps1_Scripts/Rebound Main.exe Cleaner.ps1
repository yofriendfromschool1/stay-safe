$userName = $env:USERNAME

Write-Output "Stopping malicious processes"
Stop-Process -Name updater.exe, svchost.exe, main.exe, Build.exe, hacn.exe, s.exe, setup.exe -Force -ErrorAction SilentlyContinue
Write-Output "Malicious processes stopped"

Write-Output "Deleting malware executables"
Remove-Item -Path "C:\Program Files\Google\Chrome\updater.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Users\$userName\AppData\Local\Temp\main.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Users\$userName\AppData\Local\Temp\_MEI29642\Build.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\ProgramData\Microsoft\hacn.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Users\$userName\AppData\Local\Temp\_MEI42162\s.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\ProgramData\main.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\ProgramData\GoogleChromeUpdateLog\Update.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\ProgramData\setup.exe" -Force -ErrorAction SilentlyContinue
Write-Output "Executables deleted"

Write-Output "Removing scheduled tasks"
$tasks = Get-ScheduledTask | Where-Object {$_.Actions -match "ChromeUpdate"}
foreach ($task in $tasks) {
    Unregister-ScheduledTask -TaskName $task.TaskName -Confirm:$false -ErrorAction SilentlyContinue
    Write-Output "Removed scheduled task: $($task.TaskName)"
}
Write-Output "Scheduled tasks removed"

Write-Output "Removing registry entries"
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v ChromeUpdate /f -ErrorAction SilentlyContinue
Write-Output "Registry entries removed"

Write-Output "Cleaning exclusion paths"
Remove-MpPreference -ExclusionPath 'C:\ProgramData\Microsoft\based.exe' -ErrorAction SilentlyContinue
Remove-MpPreference -ExclusionPath 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\   ‌‎.scr' -ErrorAction SilentlyContinue
Write-Output "Exclusion paths cleaned"

Write-Output "Cleaning temp files"
if (Test-Path "C:\Users\$userName\AppData\Local\Temp\_MEI50362\rar.exe") {
    Remove-Item -Path "C:\Users\$userName\AppData\Local\Temp\_MEI50362\rar.exe" -Force -ErrorAction SilentlyContinue
}
Write-Output "Temp files cleaned"

Write-Output "Finished Cleaning"

Write-Output "Go die Vale lmaoo"
Write-Output "------------------"
Write-Output "JOIN THE DISCORD: discord.gg/2fSx3nBzxb"
