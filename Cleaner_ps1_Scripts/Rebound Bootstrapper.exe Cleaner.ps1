$userName = $env:USERNAME

Write-Output "Stopping malicious processes (ReboundBootstrapper)"
Stop-Process -Name ReboundBootstrapper -Force -ErrorAction SilentlyContinue
Write-Output "Malicious processes stopped"

Write-Output "Deleting malware executable"
Remove-Item -Path "C:\Users\$userName\AppData\Local\Temp\ReboundBootstrapper.exe" -Force -ErrorAction SilentlyContinue
Write-Output "Executable deleted"

Write-Output "Reverting WinDefender changes"
Remove-MpPreference -ExclusionPath "C:\Users\$userName\AppData\Local\Temp\ReboundBootstrapper.exe" -ErrorAction SilentlyContinue
Write-Output "WinDefender Reverted"

Write-Output "Removing scheduled tasks (ReboundBootstrapper)"
$tasks = Get-ScheduledTask | Where-Object {$_.Actions -match "ReboundBootstrapper.exe"}
foreach ($task in $tasks) {
    Unregister-ScheduledTask -TaskName $task.TaskName -Confirm:$false -ErrorAction SilentlyContinue
    Write-Output "Removed scheduled task: $($task.TaskName)"
}
Write-Output "Scheduled tasks removed"

Write-Output "Removing startup items"
Remove-Item -Path 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\   ‌‎.scr' -Force -ErrorAction SilentlyContinue
Write-Output "Startup items removed"

Write-Output "Resetting attributes on hosts file"
attrib -r C:\Windows\System32\drivers\etc\hosts
attrib +r C:\Windows\System32\drivers\etc\hosts

Write-Output "Cleaning temp files"
if (Test-Path "C:\Users\$userName\AppData\Local\Temp\_MEI17682\rar.exe") {
    Remove-Item -Path "C:\Users\$userName\AppData\Local\Temp\_MEI17682\rar.exe" -Force -ErrorAction SilentlyContinue
}
Write-Output "Temp files cleaned"

Write-Output "Finished Cleaning"

Write-Output "kys vale you monkey"
Write-Output "credit to nspe lol"
Write-Output "------------------"
Write-Output "JOIN THE DISCORD: discord.gg/2fSx3nBzxb"
