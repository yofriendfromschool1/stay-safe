$userName = ($env:USERPROFILE -split '\\')[2]

Write-Output "Stopping processes (Prism Releases 1.3-5, PowerShell, xsdzxc, nexusloader)"
Stop-Process -Name "Prism Release V1.4.exe", "powershell.exe", "xsdzxc.exe", "nexusloader.exe" -Force -ErrorAction SilentlyContinue
Stop-Process -Name "Prism Release V1.5.exe", "Prism Release V1.3.exe", "Prism Executor.exe", "nexusloader.exe", "prism.exe", "nyfcwl.exe", "Intel Graphics Processor" -Force -ErrorAction SilentlyContinue
Write-Output "Processes stopped"

Write-Output "Deleting executables"
$executables = @(
    "C:\Users\$userName\AppData\Local\Temp\Prism Release\Prism Release V1.4.exe",
    "C:\Users\$userName\AppData\Local\Temp\AIM\dllhost\dllhost.exe",
    "C:\Users\$userName\AppData\Local\Temp\xsdzxc.exe",
    "C:\Users\$userName\AppData\Local\Temp\onefile_964_133630531368808094\svchost.exe",
    "C:\Users\$userName\AppData\Roaming\nexusloader.exe",
    "C:\Users\$userName\AppData\Local\Temp\onefile_3384_133630530318571147\nexusloader.exe",
    "C:\Users\$userName\AppData\Local\Temp\Prism Release\Prism Release V1.5.exe",
    "C:\Users\$userName\AppData\Local\Temp\Prism Release\Prism Release V1.3.exe",
    "C:\Users\$userName\Prism Executor.exe",
    "C:\Users\$userName\AppData\Local\Temp\prism.exe",
    "C:\Users\$userName\AppData\Local\Temp\onefile_924_133630461016085588\nexusloader.exe",
    "C:\Users\$userName\AppData\Local\Temp\nyfcwl.exe",
    "C:\Users\$userName\AppData\Local\Temp\onefile_540_133630461712021276\svchost.exe"
)
foreach ($exe in $executables) {
    if (Test-Path $exe) {
        Remove-Item -Path $exe -Force -ErrorAction SilentlyContinue
        Write-Output "Deleted: $exe"
    }
}
Write-Output "Deleted executables"

Write-Output "Removing registry entries (Persistence)"
$registryEntries = @(
    "xsdzxc.exe",
    "nexusloader.exe",
    "Prism Release V1.5.exe",
    "Prism Release V1.3.exe",
    "Prism Release V1.4.exe",
    "Prism Executor.exe",
    "prism.exe",
    "nexusloader.exe",
    "nyfcwl.exe"
)
$registryPaths = @("HKCU:\Software\Microsoft\Windows\CurrentVersion\Run", "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run")
foreach ($path in $registryPaths) {
    foreach ($entry in $registryEntries) {
        if ((Get-ItemProperty -Path $path -Name $entry -ErrorAction SilentlyContinue) -ne $null) {
            Remove-ItemProperty -Path $path -Name $entry -Force -ErrorAction SilentlyContinue
            Write-Output "Removed registry entry: $entry"
        }
    }
}
Write-Output "Entries Removed"

Write-Output "Removing scheduled tasks (Persistence)"
$scheduledTasks = @(
    "Prism Release",
    "xsdzxc",
    "nexusloader",
    "Prism Release V1.5.exe",
    "Prism Release V1.4.exe",
    "Prism Release V1.3.exe",
    "Prism Executor.exe",
    "prism.exe",
    "nexusloader.exe",
    "nyfcwl.exe"
)
foreach ($task in $scheduledTasks) {
    Get-ScheduledTask | Where-Object {$_.TaskName -like "*$task*"} | ForEach-Object {
        Unregister-ScheduledTask -TaskName $_.TaskName -Confirm:$false -ErrorAction SilentlyContinue
        Write-Output "Removed scheduled task: $($_.TaskName)"
    }
}
Write-Output "Tasks removed"

Write-Output "Removing startup items (Persistence)"
$startupPaths = @("$env:USERPROFILE\Microsoft\Windows\Start Menu\Programs\Startup", "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Startup")
foreach ($path in $startupPaths) {
    $files = Get-ChildItem -Path $path -Filter "*.lnk" -ErrorAction SilentlyContinue
    if ($files) {
        foreach ($file in $files) {
            $target = (Get-ItemProperty -Path $file.FullName -ErrorAction SilentlyContinue).TargetPath
            if ($target -match "Prism Release V1.4.exe" -or
                $target -match "xsdzxc.exe" -or
                $target -match "nexusloader.exe" -or
                $target -match "Prism Release V1.5.exe" -or
                $target -match "Prism Release V1.3.exe" -or
                $target -match "Prism Release v1.4.exe" -or
                $target -match "Prism Executor.exe" -or
                $target -match "prism.exe" -or
                $target -match "nyfcwl.exe") {
                Remove-Item -Path $file.FullName -Force -ErrorAction SilentlyContinue
                Write-Output "Removed startup item: $($file.FullName)"
            }
        }
    }
}
Write-Output "Startup items removed"

Write-Output "Reverting WinDefender Changes"
$defenderExclusions = @(
    "C:\Users\$userName\AppData\Local\Temp",
    "C:\ProgramData\Windows Runtime.exe"
)
foreach ($exclusion in $defenderExclusions) {
    Remove-MpPreference -ExclusionPath $exclusion -ErrorAction SilentlyContinue
    Remove-MpPreference -ExclusionProcess (Split-Path $exclusion -Leaf) -ErrorAction SilentlyContinue
}
Write-Output "WinDefender Reverted"

Write-Output "Blocking C2 communication using firewall rule"
New-NetFirewallRule -DisplayName "Block C2 Communication Outbound" -Direction Outbound -LocalPort Any -RemoteAddress 91.92.241.69 -Action Block -Profile Any
New-NetFirewallRule -DisplayName "Block C2 Communication Inbound" -Direction Inbound -LocalPort Any -RemoteAddress 91.92.241.69 -Action Block -Profile Any
Write-Output "Firewall rules created to block C2 communication"

Write-Output "Cleaning temp files"
$ErrorActionPreference = "SilentlyContinue"
$TempFolders = @(
    "C:\Users\$userName\AppData\Local\Temp",
    "C:\Windows\Temp"
)
foreach ($folder in $TempFolders) {
    if (Test-Path $folder) {
        Get-ChildItem -Path $folder -Recurse -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
        Write-Output "Cleaned temp folder: $folder"
    }
}
$ErrorActionPreference = "Continue"

Write-Output "Cleaning roaming and cached files"
Remove-Item -Path "C:\Users\$userName\AppData\Roaming\encabezado" -Recurse -Force -ErrorAction SilentlyContinue
Write-Output "Finished cleaning roaming and cached"

Write-Output "ggez bye bye frinkle"
Write-Output "credit to nspe lol"
Write-Output "------------------"
Write-Output "JOIN THE DISCORD: discord.gg/2fSx3nBzxb"
