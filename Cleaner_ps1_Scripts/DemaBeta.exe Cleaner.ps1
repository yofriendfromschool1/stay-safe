$userName = $env:USERNAME

Write-Output "Stopping malicious processes (WAE, Dema, AUDIOG)"
Stop-Process -Name "Dema Bootstrapper.exe" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "Windows Antivirus Executeable.exe" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "AUDIODG.EXE" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "activate.bat" -Force -ErrorAction SilentlyContinue
Write-Output "Malicious processes stopped"

Write-Output "Deleting Executables (Dema, WAE, AUDIOG)"
Remove-Item -Path "C:\Users\$userName\AppData\Local\Temp\Dema Beta\Thanks For Using Dema\Dema Bootstrapper.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Windows\system32\Windows Antivirus Executeable.exe" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Windows\system32\AUDIODG.EXE" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Users\$userName\Skype\activate.bat" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "C:\Users\$userName\Skype" -Recurse -Force -ErrorAction SilentlyContinue
Write-Output "Executables deleted"

Write-Output "Removing exclusion paths"
Remove-MpPreference -ExclusionPath "C:\Users\$userName\Skype" -ErrorAction SilentlyContinue
Write-Output "Paths removed"

Write-Output "Resetting Directory Attributes"
Set-Location -Path "C:\Users\$userName\"
attrib -s -h .
Write-Output "Attributes reset"

Write-Output "ez"
Write-Output "Credit to nspe lol"
Write-Output "------------------"
Write-Output "JOIN THE DISCORD: discord.gg/2fSx3nBzxb"
