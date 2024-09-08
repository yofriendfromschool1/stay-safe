Remove

This guide will help you removing skuld from your system

    Open powershell as administrator

    Kill processes that could be skuld

taskkill /f /t /im skuld.exe
taskkill /f /t /im SecurityHealthSystray.exe

(use tasklist to list all running processes, skuld.exe and SecurityHealthSystray.exe are the default names)

    Remove skuld from startup

reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "Realtek HD Audio Universal Service" /f

(Realtek HD Audio Universal Service is the default name)

    Enable Windows defender:

You can do it by running this .bat script (I'm not the developer behind it, make sure the file does not contain malware)