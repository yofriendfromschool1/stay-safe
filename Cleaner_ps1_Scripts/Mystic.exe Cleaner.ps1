$userName = $env:USERNAME

Write-Output "Stopping malicious processes (functionHook, BinLaden Mystic Executor)"
Stop-Process -Name functionHook -Force -ErrorAction SilentlyContinue
Stop-Process -Name 'BinLaden Mystic Executor' -Force -ErrorAction SilentlyContinue
Write-Output "Malicious processes stopped"

Write-Output "Deleting executables"
Remove-Item -Path "C:\Users\$userName\AppData\Local\Temp\functionHook.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Users\$userName\AppData\Local\Temp\BinLaden Mystic Executor.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Users\$userName\AppData\Local\Temp\FastColoredTextBox.dll" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Users\$userName\AppData\Local\Temp\Newtonsoft.Json.dll" -Force -ErrorAction SilentlyContinue
Write-Output "Executables deleted"

Write-Output "Reverting WinDefender changes"
Remove-MpPreference -ExclusionPath 'C:\Windows\system32' -ErrorAction SilentlyContinue
Write-Output "WinDefender Reverted"

Write-Output "Restoring Registry Tools"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "DisableRegistryTools" /t "REG_DWORD" /d "0" /f
Write-Output "Registry Tools Restored"

Write-Output "Resetting attributes on WinSecurity folder and files"
$folders = @(
    "C:\Windows\System32\Windows Security",
    "C:\Windows\System32\Windows Security\ProtectionHistory_AQ3RYMB7R99GDDSQ7DPR6.log"
)

foreach ($folder in $folders) {
    if (Test-Path $folder) {
        attrib -s -h -r $folder -ErrorAction SilentlyContinue
    }
}

$files = @(
    "C:\Windows\System32\Windows Security\ecopt.spx"
)

foreach ($file in $files) {
    if (Test-Path $file) {
        attrib -s -h -r $file -ErrorAction SilentlyContinue
    }
}

Write-Output "Attributes reset"

Write-Output "Cleaning temp files"
$malwareFiles = @(
    "C:\Users\$userName\AppData\Local\Temp\functionHook.exe",
    "C:\Users\$userName\AppData\Local\Temp\BinLaden Mystic Executor.exe",
    "C:\Users\$userName\AppData\Local\Temp\FastColoredTextBox.dll",
    "C:\Users\$userName\AppData\Local\Temp\Newtonsoft.Json.dll"
)

foreach ($file in $malwareFiles) {
    if (Test-Path $file) {
        Remove-Item -Path $file -Force -ErrorAction SilentlyContinue
    }
}
Write-Output "Temp files cleaned"

Write-Output "bye bye mystic"
Write-Output "credit to nspe lol"
Write-Output "------------------"
Write-Output "JOIN THE DISCORD: discord.gg/2fSx3nBzxb"
