# User Experience Flow / Kullanıcı Deneyimi Akışı

## Visual Guide to Multilingual Installer

### 📥 Download / İndirme

```
GitHub Releases Page
│
├─ Before / Öncesi:
│  ├─ aPath-Installer.exe (English)      ❓ Which one?
│  └─ aPath-Kurulum-TR.exe (Turkish)     ❓ Hangisi?
│
└─ Now / Şimdi:
   └─ aPath-Installer.exe (Multilingual) ✅ One file!
```

### 🚀 Installation Flow / Kurulum Akışı

```
Step 1: Run Installer / Yükleyiciyi Çalıştır
   │
   └─> aPath-Installer.exe
       │
       ├─ UAC Prompt (Automatic)
       │  "Do you want to allow this app to make changes?"
       │
       └─> ✅ Yes

Step 2: Language Selection / Dil Seçimi
   │
   ┌─────────────────────────────────┐
   │  Select Installer Language      │
   │  Yükleyici Dilini Seçin        │
   │                                 │
   │  ○ English                      │
   │  ○ Türkçe                       │
   │                                 │
   │        [ OK ]  [ Cancel ]       │
   └─────────────────────────────────┘
   │
   ├─> If English selected:
   │   │
   │   ├─ Welcome to aPath Setup
   │   ├─ License Agreement (MIT)
   │   ├─ Installing files...
   │   │  ✓ Copying aPath.vbs
   │   │  ✓ Setting registry keys
   │   │  ✓ Creating uninstaller
   │   └─ Setup Completed ✓
   │      Context menu: "Copy Path"
   │
   └─> If Türkçe selected:
       │
       ├─ aPath Kurulumuna Hoş Geldiniz
       ├─ Lisans Sözleşmesi (MIT)
       ├─ Dosyalar kuruluyor...
       │  ✓ aPath.vbs kopyalanıyor
       │  ✓ Kayıt defteri ayarlanıyor
       │  ✓ Kaldırıcı oluşturuluyor
       └─ Kurulum Tamamlandı ✓
          Bağlam menüsü: "Yolu Kopyala"
```

### 🖱️ Context Menu / Bağlam Menüsü

```
English Installation:
   File.txt (right-click)
   ├─ Open
   ├─ Edit
   ├─ Copy Path              ← ✅ English
   ├─ Properties
   └─ ...

Turkish Installation:
   Dosya.txt (sağ tıklama)
   ├─ Aç
   ├─ Düzenle
   ├─ Yolu Kopyala           ← ✅ Türkçe
   ├─ Özellikler
   └─ ...
```

### 🗑️ Uninstallation / Kaldırma

```
Settings → Apps → aPath
   │
   └─> Uninstall / Kaldır
       │
       ├─> If installed in English:
       │   ├─ "Are you sure you want to uninstall?"
       │   ├─ Removing files...
       │   └─ Uninstallation complete
       │
       └─> If installed in Turkish:
           ├─ "Kaldırmak istediğinize emin misiniz?"
           ├─ Dosyalar kaldırılıyor...
           └─ Kaldırma tamamlandı
```

## Technical Flow / Teknik Akış

```
┌─────────────────────────────────────────────────────┐
│            aPath-Installer.exe                      │
│  ┌───────────────────────────────────────────────┐  │
│  │  Embedded Resources:                          │  │
│  │  ├─ English Strings                           │  │
│  │  │  ├─ "Copy Path"                            │  │
│  │  │  ├─ "Failed to install aPath.vbs file!"    │  │
│  │  │  └─ ...                                     │  │
│  │  ├─ Turkish Strings                           │  │
│  │  │  ├─ "Yolu Kopyala"                         │  │
│  │  │  ├─ "aPath.vbs dosyası kurulamadı!"       │  │
│  │  │  └─ ...                                     │  │
│  │  └─ aPath.vbs (file data)                     │  │
│  └───────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────┘
                      │
                      ▼
        ┌──────────────────────────┐
        │   Language Selection      │
        │   via MUI_LANGDLL        │
        └──────────────────────────┘
                      │
          ┌───────────┴───────────┐
          ▼                       ▼
    English Mode            Turkish Mode
          │                       │
          ▼                       ▼
    Install with             Install with
    English strings         Turkish strings
          │                       │
          ▼                       ▼
    Registry:                Registry:
    "Copy Path"             "Yolu Kopyala"
```

## Registry Storage / Kayıt Defteri Depolama

```
Selected Language Stored In:
HKCU\Software\aPath\Installer Language

English:
┌────────────────────────────────────────────┐
│ HKCR\*\shell\aPath                         │
│   └─ (Default) = "Copy Path"               │
│   └─ command                               │
│       └─ (Default) = wscript.exe ...       │
└────────────────────────────────────────────┘

Turkish:
┌────────────────────────────────────────────┐
│ HKCR\*\shell\aPath                         │
│   └─ (Default) = "Yolu Kopyala"           │
│   └─ command                               │
│       └─ (Default) = wscript.exe ...       │
└────────────────────────────────────────────┘
```

## Build Process / Derleme Süreci

```
Developer → build-installer.bat
              │
              ▼
          Check aPath.vbs exists
              │
              ▼
          makensis installer.nsi
              │
              ├─ Load English language pack
              ├─ Load Turkish language pack
              ├─ Embed aPath.vbs
              ├─ Embed LICENSE.txt
              └─ Compile all resources
              │
              ▼
        aPath-Installer.exe
        (550 KB, multilingual)
              │
              ├─> Local testing
              │
              └─> GitHub Release
                  │
                  └─> Users download
```

## Comparison: Before vs After

### Before / Öncesi

```
Releases:
├─ v1.0.0
│  ├─ aPath-Installer.exe (500 KB) ← English users
│  └─ aPath-Kurulum-TR.exe (500 KB) ← Turkish users
│
User Confusion:
├─ "Which file should I download?"
├─ "What's the difference?"
└─ Downloads wrong file → Reinstalls
```

### After / Sonrası

```
Releases:
└─ v1.1.0
   └─ aPath-Installer.exe (550 KB) ← All users
       │
       └─> Universal, all languages included

User Experience:
├─ Download one file ✓
├─ Choose language during install ✓
├─ Get experience in chosen language ✓
└─ Happy users! 😊
```

## Adding More Languages / Daha Fazla Dil Ekleme

```
Step 1: Edit installer.nsi
   │
   ├─ Add language declaration
   │  !insertmacro MUI_LANGUAGE "German"
   │
   └─ Add translations
      LangString CONTEXT_MENU_TEXT ${LANG_GERMAN} "Pfad kopieren"

Step 2: Rebuild
   │
   └─> build-installer.bat

Step 3: Test
   │
   └─> Language selection now shows 3 options!
       ├─ English
       ├─ Türkçe
       └─ Deutsch
```

## File Size Analysis / Dosya Boyutu Analizi

```
Component Breakdown:

Base Installer (NSIS code):      ~200 KB
aPath.vbs embedded:              ~1 KB
LICENSE.txt embedded:            ~1 KB
English strings:                 ~5 KB
Turkish strings:                 ~5 KB
UI resources:                    ~300 KB
Language selection dialog:       ~38 KB
────────────────────────────────────────
Total:                           ~550 KB

Each additional language adds:   ~5 KB
```

## Benefits Summary / Fayda Özeti

```
✅ User Benefits:
   ├─ Single download
   ├─ Language choice
   ├─ Native experience
   └─ Less confusion

✅ Developer Benefits:
   ├─ One file to maintain
   ├─ Easier updates
   ├─ Simpler CI/CD
   └─ Expandable design

✅ Distribution Benefits:
   ├─ Smaller total size (-45%)
   ├─ One release artifact
   ├─ Clearer releases
   └─ Better for users
```
