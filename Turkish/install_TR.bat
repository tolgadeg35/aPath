@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"
:: Yönetici yetkisi kontrolü
net session >nul 2>&1
if %errorLevel% == 0 (
    echo [TAMAM] Yönetici yetkisi onaylandı.
) else (
    echo [HATA] Lütfen sağ tıklayıp "Yönetici Olarak Çalıştır" seçeneğini seçin.
    pause
    exit /b
)

:: VBS dosyasını kopyala (Üst klasörden arar)
if exist "..\aPath.vbs" (
    copy /y "..\aPath.vbs" "C:\Windows\aPath.vbs" >nul
    echo [+] aPath.vbs, C:\Windows dizinine kopyalandı.
) else (
    echo [-] HATA: aPath.vbs dosyası ana dizinde bulunamadı!
)

:: Registry ayarlarını uygula
if exist "RegistrySetup_TR.reg" (
    regedit.exe /s "RegistrySetup_TR.reg"
    echo [+] Kayıt defteri ayarları uygulandı.
) else (
    echo [-] HATA: RegistrySetup_TR.reg bulunamadı!
)

echo.
echo Kurulum tamamlandı! "Yolu Kopyala" seçeneği menüye eklendi.
pause