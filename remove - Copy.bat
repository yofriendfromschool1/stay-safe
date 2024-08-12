
@echo off

net session >nul 2>&1
if not %errorlevel% == 0 ( powershell.exe -ExecutionPolicy Bypass -NoProfile -Command "Start-Process -Verb RunAs -FilePath '%~f0'" & exit /b 0)
cd /d %~dp0

echo $ErrorActionPreference = "SilentlyContinue" > %temp%\Kematian_Uninstaller.ps1
echo function Cleanup { >> %temp%\Kematian_Uninstaller.ps1
echo     Unregister-ScheduledTask -TaskName "Kematian" -Confirm:$False >> %temp%\Kematian_Uninstaller.ps1
echo     Remove-Item -Path "$env:appdata\Kematian" -force -recurse >> %temp%\Kematian_Uninstaller.ps1
echo     Remove-MpPreference -ExclusionPath "$env:APPDATA\Kematian" >> %temp%\Kematian_Uninstaller.ps1
echo     Remove-MpPreference -ExclusionPath "$env:LOCALAPPDATA\Temp" >> %temp%\Kematian_Uninstaller.ps1
echo     $resethostsfile = @' >> %temp%\Kematian_Uninstaller.ps1
echo # Copyright (c) 1993-2006 Microsoft Corp. >> %temp%\Kematian_Uninstaller.ps1
echo # >> %temp%\Kematian_Uninstaller.ps1
echo # This is a sample HOSTS file used by Microsoft TCP/IP for Windows. >> %temp%\Kematian_Uninstaller.ps1
echo # >> %temp%\Kematian_Uninstaller.ps1
echo # This file contains the mappings of IP addresses to host names. Each >> %temp%\Kematian_Uninstaller.ps1
echo # entry should be kept on an individual line. The IP address should >> %temp%\Kematian_Uninstaller.ps1
echo # be placed in the first column followed by the corresponding host name. >> %temp%\Kematian_Uninstaller.ps1
echo # The IP address and the host name should be separated by at least one >> %temp%\Kematian_Uninstaller.ps1
echo # space. >> %temp%\Kematian_Uninstaller.ps1
echo # >> %temp%\Kematian_Uninstaller.ps1
echo # Additionally, comments (such as these) may be inserted on individual >> %temp%\Kematian_Uninstaller.ps1
echo # lines or following the machine name denoted by a '#' symbol. >> %temp%\Kematian_Uninstaller.ps1
echo # >> %temp%\Kematian_Uninstaller.ps1
echo # For example: >> %temp%\Kematian_Uninstaller.ps1
echo # >> %temp%\Kematian_Uninstaller.ps1
echo #      102.54.94.97     rhino.acme.com          # source server >> %temp%\Kematian_Uninstaller.ps1
echo #       38.25.63.10     x.acme.com              # x client host >> %temp%\Kematian_Uninstaller.ps1
echo # localhost name resolution is handle within DNS itself. >> %temp%\Kematian_Uninstaller.ps1
echo #       127.0.0.1       localhost >> %temp%\Kematian_Uninstaller.ps1
echo #       ::1             localhost >> %temp%\Kematian_Uninstaller.ps1
echo '@ >> %temp%\Kematian_Uninstaller.ps1
echo     [IO.File]::WriteAllText("$env:windir\System32\Drivers\etc\hosts", $resethostsfile) >> %temp%\Kematian_Uninstaller.ps1
echo     Write-Host "[~] Successfully Uninstalled Kematian !" -ForegroundColor Green >> %temp%\Kematian_Uninstaller.ps1
echo } >> %temp%\Kematian_Uninstaller.ps1
echo Cleanup >> %temp%\Kematian_Uninstaller.ps1

powershell -NoLogo -NoProfile -ExecutionPolicy Bypass -File %temp%\Kematian_Uninstaller.ps1 -Passthru
pause
del %temp%\Kematian_Uninstaller.ps1
(goto) 2>nul & del "%~f0"
