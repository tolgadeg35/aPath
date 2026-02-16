@echo off
setlocal
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Please run as Administrator to uninstall.
    pause
    exit /b
)

:: Remove Registry Entries
reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\aPath" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\Directory\shell\aPath" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\*\shell\aPath" /f >nul 2>&1

:: Delete VBS File
if exist "C:\Windows\aPath.vbs" (
    del /f "C:\Windows\aPath.vbs"
)

echo Uninstallation complete.
pause