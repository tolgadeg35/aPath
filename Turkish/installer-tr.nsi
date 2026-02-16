; aPath - Yol Kopyalama Bağlam Menüsü Yükleyici
; Tek çalıştırılabilir yükleyici oluşturmak için NSIS Betiği

!define APP_NAME "aPath"
!define APP_VERSION "1.0.0"
!define PUBLISHER "tolgadeg35"
!define WEB_SITE "https://github.com/tolgadeg35/aPath"
!define INSTALL_DIR "$SYSDIR"

; Modern UI Dahil Et
!include "MUI2.nsh"

; Genel
Name "${APP_NAME}"
OutFile "aPath-Kurulum-TR.exe"
InstallDir "${INSTALL_DIR}"
RequestExecutionLevel admin

; Arayüz Ayarları
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Sayfalar
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "..\LICENSE.txt"
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

; Diller
!insertmacro MUI_LANGUAGE "Turkish"

; Yükleyici Bölümü
Section "Yükle" SecInstall
    SetOutPath "$SYSDIR"
    
    ; VBS dosyasını Windows dizinine kopyala
    File "..\aPath.vbs"
    
    ; Dosyanın kurulduğunu doğrula
    IfFileExists "$SYSDIR\aPath.vbs" +3 0
        MessageBox MB_OK|MB_ICONEXCLAMATION "aPath.vbs dosyası kurulamadı!"
        Abort "Kurulum başarısız: aPath.vbs kopyalanamadı"
    
    ; Kayıt Defteri ayarlarını uygula
    WriteRegStr HKCR "Directory\Background\shell\aPath" "" "Yolu Kopyala"
    WriteRegStr HKCR "Directory\Background\shell\aPath" "Icon" "imageres.dll,-5302"
    WriteRegStr HKCR "Directory\Background\shell\aPath\command" "" 'wscript.exe "$SYSDIR\aPath.vbs" "%V"'
    
    WriteRegStr HKCR "Directory\shell\aPath" "" "Yolu Kopyala"
    WriteRegStr HKCR "Directory\shell\aPath" "Icon" "imageres.dll,-5302"
    WriteRegStr HKCR "Directory\shell\aPath\command" "" 'wscript.exe "$SYSDIR\aPath.vbs" "%1"'
    
    WriteRegStr HKCR "*\shell\aPath" "" "Yolu Kopyala"
    WriteRegStr HKCR "*\shell\aPath" "Icon" "imageres.dll,-5302"
    WriteRegStr HKCR "*\shell\aPath\command" "" 'wscript.exe "$SYSDIR\aPath.vbs" "%1"'
    
    ; Kaldırıcı yaz
    WriteUninstaller "$SYSDIR\aPath-Kaldir.exe"
    
    ; Program Ekle/Kaldır'a kaldırma bilgilerini ekle
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" "DisplayName" "${APP_NAME}"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" "UninstallString" "$SYSDIR\aPath-Kaldir.exe"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" "DisplayVersion" "${APP_VERSION}"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" "Publisher" "${PUBLISHER}"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" "URLInfoAbout" "${WEB_SITE}"
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" "NoModify" 1
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" "NoRepair" 1
    
SectionEnd

; Kaldırıcı Bölümü
Section "Uninstall"
    ; Kayıt Defteri Girişlerini Kaldır
    DeleteRegKey HKCR "Directory\Background\shell\aPath"
    DeleteRegKey HKCR "Directory\shell\aPath"
    DeleteRegKey HKCR "*\shell\aPath"
    
    ; VBS Dosyasını Sil
    Delete "$SYSDIR\aPath.vbs"
    
    ; Kaldırıcıyı Sil
    Delete "$SYSDIR\aPath-Kaldir.exe"
    
    ; Program Ekle/Kaldır'dan Kaldır
    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}"
    
SectionEnd
