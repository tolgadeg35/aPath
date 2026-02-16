@echo off
echo ========================================
echo aPath Yükleyici Derleyici
echo ========================================
echo.

:: NSIS'in kurulu olup olmadığını kontrol et
where makensis >nul 2>&1
if %errorLevel% neq 0 (
    echo [HATA] NSIS kurulu değil veya PATH'de değil!
    echo.
    echo Lütfen NSIS'i şu adresten kurun: https://nsis.sourceforge.io/Download
    echo Veya Chocolatey ile kurun: choco install nsis
    echo.
    pause
    exit /b 1
)

echo [TAMAM] NSIS PATH'de bulundu
echo.

:: Yükleyiciyi derle
echo Yükleyici derleniyor...
makensis installer-tr.nsi

if %errorLevel% equ 0 (
    echo.
    echo ========================================
    echo [BAŞARILI] Yükleyici başarıyla derlendi!
    echo ========================================
    echo.
    echo Yükleyici: aPath-Kurulum-TR.exe
    echo.
) else (
    echo.
    echo [HATA] Derleme başarısız! Yukarıdaki hataları kontrol edin.
    echo.
)

pause
