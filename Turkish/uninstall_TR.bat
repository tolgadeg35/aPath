@echo off
chcp 65001 >nul
setlocal
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Kaldırmak için lütfen Yönetici Olarak Çalıştırın.
    pause
    exit /b
)

reg delete "HKEY_CLASSES_ROOT\Directory\Background\shell\aPath" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\Directory\shell\aPath" /f >nul 2>&1
reg delete "HKEY_CLASSES_ROOT\*\shell\aPath" /f >nul 2>&1

if exist "C:\Windows\aPath.vbs" (
    del /f "C:\Windows\aPath.vbs"
)

echo Kaldırma işlemi başarıyla tamamlandı.
pause