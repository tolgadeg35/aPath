@echo off
setlocal
cd /d "%~dp0"
:: Check for Administrative privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    echo [OK] Administrative privileges confirmed.
) else (
    echo [ERROR] Please right-click and "Run as Administrator".
    pause
    exit /b
)

:: Copy VBS file to Windows directory
if exist "aPath.vbs" (
    copy /y "aPath.vbs" "C:\Windows\aPath.vbs" >nul
    echo [+] aPath.vbs copied to C:\Windows
) else (
    echo [-] ERROR: aPath.vbs not found!
    pause
    exit /b
)

:: Apply Registry settings
if exist "RegistrySetup.reg" (
    regedit.exe /s "RegistrySetup.reg"
    echo [+] Registry settings applied successfully.
) else (
    echo [-] ERROR: RegistrySetup.reg not found!
    pause
    exit /b
)

echo.
echo Installation complete! "Copy Path" is now in your context menu.
pause