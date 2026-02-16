@echo off
echo ========================================
echo aPath Installer Builder
echo ========================================
echo.

:: Check if NSIS is installed
where makensis >nul 2>&1
if %errorLevel% neq 0 (
    echo [ERROR] NSIS is not installed or not in PATH!
    echo.
    echo Please install NSIS from: https://nsis.sourceforge.io/Download
    echo Or install via Chocolatey: choco install nsis
    echo.
    pause
    exit /b 1
)

echo [OK] NSIS found in PATH
echo.

:: Build the installer
echo Building installer...
makensis installer.nsi

if %errorLevel% equ 0 (
    echo.
    echo ========================================
    echo [SUCCESS] Installer built successfully!
    echo ========================================
    echo.
    echo The installer is: aPath-Installer.exe
    echo.
) else (
    echo.
    echo [ERROR] Build failed! Check the errors above.
    echo.
)

pause
