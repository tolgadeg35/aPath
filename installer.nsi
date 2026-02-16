; aPath - Copy Path Context Menu Installer
; Multilingual NSIS Script with Language Selection

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

; Language Selection Dialog Settings
!define MUI_LANGDLL_ALLLANGUAGES
!define MUI_LANGDLL_REGISTRY_ROOT "HKCU"
!define MUI_LANGDLL_REGISTRY_KEY "Software\${APP_NAME}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "Installer Language"

; Pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "LICENSE.txt"
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

; Languages - Must be inserted after pages
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "Turkish"

; Custom Language Strings for Context Menu Text
LangString CONTEXT_MENU_TEXT ${LANG_ENGLISH} "Copy Path"
LangString CONTEXT_MENU_TEXT ${LANG_TURKISH} "Yolu Kopyala"

LangString ERROR_VBS_INSTALL ${LANG_ENGLISH} "Failed to install aPath.vbs file!"
LangString ERROR_VBS_INSTALL ${LANG_TURKISH} "aPath.vbs dosyası kurulamadı!"

LangString ERROR_VBS_COPY ${LANG_ENGLISH} "Installation failed: Could not copy aPath.vbs"
LangString ERROR_VBS_COPY ${LANG_TURKISH} "Kurulum başarısız: aPath.vbs kopyalanamadı"

; Language selection function
Function .onInit
    !insertmacro MUI_LANGDLL_DISPLAY
FunctionEnd

Function un.onInit
    !insertmacro MUI_UNGETLANGUAGE
FunctionEnd

; Installer Section
Section "Install" SecInstall
    SetOutPath "$SYSDIR"
    
    ; Copy VBS file to Windows directory
    File "aPath.vbs"
    
    ; Verify the file was installed
    IfFileExists "$SYSDIR\aPath.vbs" +3 0
        MessageBox MB_OK|MB_ICONEXCLAMATION "$(ERROR_VBS_INSTALL)"
        Abort "$(ERROR_VBS_COPY)"
    
    ; Apply Registry settings with language-specific context menu text
    WriteRegStr HKCR "Directory\Background\shell\aPath" "" "$(CONTEXT_MENU_TEXT)"
    WriteRegStr HKCR "Directory\Background\shell\aPath" "Icon" "imageres.dll,-5302"
    WriteRegStr HKCR "Directory\Background\shell\aPath\command" "" 'wscript.exe "$SYSDIR\aPath.vbs" "%V"'
    
    WriteRegStr HKCR "Directory\shell\aPath" "" "$(CONTEXT_MENU_TEXT)"
    WriteRegStr HKCR "Directory\shell\aPath" "Icon" "imageres.dll,-5302"
    WriteRegStr HKCR "Directory\shell\aPath\command" "" 'wscript.exe "$SYSDIR\aPath.vbs" "%1"'
    
    WriteRegStr HKCR "*\shell\aPath" "" "$(CONTEXT_MENU_TEXT)"
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
