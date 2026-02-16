@echo off
echo ========================================
echo aPath Multilingual Installer Builder
echo ========================================
echo.
echo Building installer with English and Turkish language support...
echo.

:: Check if aPath.vbs exists
if not exist "aPath.vbs" (
    echo [ERROR] aPath.vbs not found in current directory!
    echo.
    echo Make sure you are running this from the project root directory
    echo where aPath.vbs is located.
    echo.
    pause
    exit /b 1
)

echo [OK] aPath.vbs found
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
    echo The multilingual installer is: aPath-Installer.exe
    echo Languages: English, Turkish
    echo.
) else (
    echo.
    echo [ERROR] Build failed! Check the errors above.
    echo.
)

pause
