; aPath - Copy Path Context Menu Installer
; NSIS Script for creating single executable installer

!define APP_NAME "aPath"
!define APP_VERSION "1.0.0"
!define PUBLISHER "tolgadeg35"
!define WEB_SITE "https://github.com/tolgadeg35/aPath"
!define INSTALL_DIR "$SYSDIR"

; Include Modern UI
!include "MUI2.nsh"

; General
Name "${APP_NAME}"
OutFile "aPath-Installer.exe"
InstallDir "${INSTALL_DIR}"
RequestExecutionLevel admin

; Interface Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"

; Pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "LICENSE.txt"
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

; Languages
!insertmacro MUI_LANGUAGE "English"

; Installer Section
Section "Install" SecInstall
    SetOutPath "$SYSDIR"
    
    ; Copy VBS file to Windows directory
    File "aPath.vbs"
    
    ; Apply Registry settings
    WriteRegStr HKCR "Directory\Background\shell\aPath" "" "Copy Path"
    WriteRegStr HKCR "Directory\Background\shell\aPath" "Icon" "imageres.dll,-5302"
    WriteRegStr HKCR "Directory\Background\shell\aPath\command" "" 'wscript.exe "$SYSDIR\aPath.vbs" "%V"'
    
    WriteRegStr HKCR "Directory\shell\aPath" "" "Copy Path"
    WriteRegStr HKCR "Directory\shell\aPath" "Icon" "imageres.dll,-5302"
    WriteRegStr HKCR "Directory\shell\aPath\command" "" 'wscript.exe "$SYSDIR\aPath.vbs" "%1"'
    
    WriteRegStr HKCR "*\shell\aPath" "" "Copy Path"
    WriteRegStr HKCR "*\shell\aPath" "Icon" "imageres.dll,-5302"
    WriteRegStr HKCR "*\shell\aPath\command" "" 'wscript.exe "$SYSDIR\aPath.vbs" "%1"'
    
    ; Write uninstaller
    WriteUninstaller "$SYSDIR\aPath-Uninstall.exe"
    
    ; Add uninstall information to Add/Remove Programs
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" "DisplayName" "${APP_NAME}"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" "UninstallString" "$SYSDIR\aPath-Uninstall.exe"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" "DisplayVersion" "${APP_VERSION}"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" "Publisher" "${PUBLISHER}"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" "URLInfoAbout" "${WEB_SITE}"
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" "NoModify" 1
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}" "NoRepair" 1
    
SectionEnd

; Uninstaller Section
Section "Uninstall"
    ; Remove Registry Entries
    DeleteRegKey HKCR "Directory\Background\shell\aPath"
    DeleteRegKey HKCR "Directory\shell\aPath"
    DeleteRegKey HKCR "*\shell\aPath"
    
    ; Delete VBS File
    Delete "$SYSDIR\aPath.vbs"
    
    ; Delete Uninstaller
    Delete "$SYSDIR\aPath-Uninstall.exe"
    
    ; Remove from Add/Remove Programs
    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APP_NAME}"
    
SectionEnd
