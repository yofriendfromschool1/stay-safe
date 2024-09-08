taskkill /f /t /im skuld.exe
taskkill /f /t /im SecurityHealthSystray.exe
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "Realtek HD Audio Universal Service" /f