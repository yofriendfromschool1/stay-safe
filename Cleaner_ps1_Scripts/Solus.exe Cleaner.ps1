$userName = $env:USERNAME

Write-Output "Stopping processes (Solus.exe)"
Stop-Process -Name Solus -Force -ErrorAction SilentlyContinue
Write-Output "Processes stopped"

Write-Output "Deleting executables"
Remove-Item -Path "C:\Users\$userName\AppData\Local\Temp\Solus.exe" -Force -ErrorAction SilentlyContinue
Write-Output "Executables deleted"

Write-Output "Reverting WinDefender changes"
Remove-MpPreference -ExclusionPath "C:\Users\$userName\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" -ErrorAction SilentlyContinue
Remove-MpPreference -ExclusionPath "C:\Users\$userName\AppData\Roaming\Microsoft\Windows" -ErrorAction SilentlyContinue
Write-Output "WinDefender Reverted"

Write-Output "Restoring Registry Tools"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableRegistryTools" /t "REG_DWORD" /d "0" /f
Write-Output "Tools restored"

Write-Output "Removing persistence"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Steam /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "Windows PowerShell" /f
Write-Output "Persistence removed"

Write-Output "Deleting scripts (.ps1, .vbs)"
Remove-Item -Path "C:\ProgramData\edge\Updater\Get-Clipboard.ps1" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\ProgramData\edge\Updater\RunBatHidden.vbs" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Users\$userName\AppData\Local\Temp\CaptureScreens.ps1" -Force -ErrorAction SilentlyContinue
Write-Output "Scripts deleted"

Write-Output "Restoring PowerShell EP to Restricted"
Set-ExecutionPolicy Restricted -Scope LocalMachine -Force -ErrorAction SilentlyContinue
Write-Output "PowerShell policy reset to Restricted"

Write-Output "Cleaning temp files"
$malwareFiles = @(
    "C:\Users\$userName\AppData\Local\Temp\Solus.exe"
)

foreach ($file in $malwareFiles) {
    if (Test-Path $file) {
        Remove-Item -Path $file -Force -ErrorAction SilentlyContinue
    }
}
Write-Output "Temp files cleaned"

Write-Output "Solus was always a fake ahh bitch"
Write-Output "------------------"
Write-Output "JOIN THE DISCORD: discord.gg/2fSx3nBzxb"
