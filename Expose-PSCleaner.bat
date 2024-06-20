@echo off
setlocal enabledelayedexpansion
set "gitInstallerUrl=https://github.com/git-for-windows/git/releases/download/v2.45.2.windows.1/Git-2.45.2-64-bit.exe"
set "desktopPath=%USERPROFILE%\Desktop"

where curl >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo curl is not available. Please install curl and try again.
    pause
    exit /b 1
)

:CheckAndInstallGit
where git >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Git is not installed. Downloading Git installer...
    curl -L -o "%desktopPath%\Git-2.45.2-64-bit.exe" "%gitInstallerUrl%"

    if exist "%desktopPath%\Git-2.45.2-64-bit.exe" (
        echo Git installer downloaded successfully.
        echo Installing Git...
        start "" /wait "%desktopPath%\Git-2.45.2-64-bit.exe" /SILENT /NORESTART
        :WaitForGitInstallation
        timeout /t 1 >nul
        where git >nul 2>&1
        if %ERRORLEVEL% NEQ 0 (
            goto WaitForGitInstallation
        )
        echo Git is now installed.
    ) else (
        echo Failed to download Git installer.
        pause
        exit /b 1
    )
)

set "repository_url=https://github.com/GiveUsername/ExposePowershellCleaners.git"
set "file_extension=.ps1"

set "clone_directory=%temp%\ExposePowershellCleaners"
set "download_directory=%cd%\Cleaner_ps1_Scripts"

if not exist "%clone_directory%" (
    git clone %repository_url% "%clone_directory%" >nul 2>&1
    if %errorlevel% neq 0 (
        echo Failed to clone the repository. Please check your internet connection and try again.
        pause
        exit /b 1
    )
) else (
    pushd "%clone_directory%"
    git pull origin master >nul 2>&1
    popd
    if %errorlevel% neq 0 (
        echo Failed to pull latest changes. Skipping update.
    )
)

if not exist "%download_directory%" mkdir "%download_directory%"

del /Q "%download_directory%\*.ps1" >nul 2>&1

set "file_count=0"
for %%I in ("%clone_directory%\*%file_extension%") do (
    copy /y "%%I" "%download_directory%\%%~nxI" >nul
    if !errorlevel! equ 0 (
        set /a file_count+=1
        echo Copied: %%~nxI
    )
)

if %file_count% equ 0 (
    echo No .ps1 files copied from the repository.
    goto :EndScript
)

echo Available .ps1 files in %download_directory%:
set "file_index=0"
for %%I in ("%download_directory%\*%file_extension%") do (
    set /a file_index+=1
    echo !file_index!. %%~nxI
)
echo.

set /p "choice=Enter the number of the script to run (or press Enter to exit): "
if "%choice%"=="" goto :EndScript

if %choice% lss 1 goto :EndScript
if %choice% gtr %file_index% goto :EndScript

set "selected_script="
set "counter=0"
for %%I in ("%download_directory%\*%file_extension%") do (
    set /a counter+=1
    if !counter! equ %choice% (
        set "selected_script=%%~fI"
        goto :FoundScript
    )
)

:FoundScript
if not defined selected_script (
    echo Invalid selection. Please choose a valid number.
    pause
    goto :EndScript
)

echo Running selected script: %selected_script%
echo.

set /p "admin_prompt=Do you want to run PowerShell as administrator? (y/n): "
if /i "%admin_prompt%"=="y" (
    echo Requesting elevation to run PowerShell as administrator...
    powershell -Command "Start-Process powershell.exe -ArgumentList '-ExecutionPolicy Bypass -File ""%selected_script%""' -Verb RunAs"
) else (
    echo Running PowerShell...
    powershell -ExecutionPolicy Bypass -File "%selected_script%"
)

:EndScript
rd /s /q "%clone_directory%"

echo Press Enter to close...
pause >nul

endlocal
exit /b 0
