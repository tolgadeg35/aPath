# aPath v1.1.0 - Multilingual Installer / Çok Dilli Yükleyici 🌐

## 🎉 Yeni Özellik / New Feature

### Tek Yükleyici, İki Dil! / One Installer, Two Languages!

Artık **tek bir yükleyici dosyası** hem İngilizce hem de Türkçe dilini destekliyor!

Now **a single installer file** supports both English and Turkish!

## ✨ Ana Değişiklikler / Key Changes

### 1. Çok Dilli Yükleyici / Multilingual Installer

**Önceki durum / Before:**
- ❌ İki ayrı yükleyici dosyası (aPath-Installer.exe ve aPath-Kurulum-TR.exe)
- ❌ Kullanıcılar hangi dosyayı indireceğini bilmiyor
- ❌ Bakım için iki dosya

**Yeni durum / Now:**
- ✅ Tek yükleyici dosyası: `aPath-Installer.exe`
- ✅ Kurulum başında dil seçimi
- ✅ Bağlam menüsü seçilen dilde ("Copy Path" veya "Yolu Kopyala")
- ✅ Tüm mesajlar seçilen dilde
- ✅ Kolay bakım

### 2. Özellikler / Features

- 🌐 **Dil Seçimi / Language Selection**: Kurulumda ilk ekranda dil seçimi
- 🎯 **Dinamik Bağlam Menüsü / Dynamic Context Menu**: Seçilen dile göre menü metni
- 💾 **Hafıza / Memory**: Dil tercihi kayıt defterinde saklanır
- 🗑️ **Kaldırıcı / Uninstaller**: Aynı dilde kaldırma deneyimi

### 3. Teknik Detaylar / Technical Details

```nsis
; Dil tanımlamaları / Language declarations
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "Turkish"

; Çevrilebilir metinler / Translatable strings
LangString CONTEXT_MENU_TEXT ${LANG_ENGLISH} "Copy Path"
LangString CONTEXT_MENU_TEXT ${LANG_TURKISH} "Yolu Kopyala"
```

## 📊 Karşılaştırma / Comparison

| Özellik / Feature | Önceki / Before | Yeni / Now |
|------------------|-----------------|------------|
| Yükleyici Sayısı / Number of Installers | 2 | 1 |
| Dil Seçimi / Language Selection | ❌ Hayır / No | ✅ Evet / Yes |
| Dosya Boyutu / File Size | ~500 KB × 2 | ~550 KB × 1 |
| Kullanıcı Deneyimi / User Experience | Karmaşık / Complex | Basit / Simple |
| Bakım / Maintenance | Zor / Hard | Kolay / Easy |

## 🚀 Nasıl Kullanılır? / How to Use?

### Kullanıcılar İçin / For Users

1. **İndir / Download**: `aPath-Installer.exe` dosyasını [Releases](https://github.com/tolgadeg35/aPath/releases) sayfasından indirin
2. **Çalıştır / Run**: Dosyaya çift tıklayın (yönetici hakları otomatik istenir)
3. **Dil Seç / Select Language**: İngilizce veya Türkçe seçin
4. **Kur / Install**: Kurulum sihirbazını takip edin
5. **Kullan / Use**: Herhangi bir dosyaya sağ tıklayın!

### Geliştiriciler İçin / For Developers

```cmd
# Yükleyiciyi derle / Build installer
build-installer.bat

# Çıktı / Output: aPath-Installer.exe (multilingual)
```

## 📚 Yeni Dokümantasyon / New Documentation

- **MULTILINGUAL.md**: Çok dilli yükleyici hakkında detaylı rehber
  - Nasıl çalışır / How it works
  - Teknik detaylar / Technical details
  - Yeni dil ekleme / Adding new languages

## 🎯 Faydalar / Benefits

**Kullanıcılar için / For Users:**
- ✅ Daha az karışıklık - tek dosya
- ✅ Kendi dillerinde kurulum deneyimi
- ✅ Daha hızlı indirme ve kurulum

**Geliştiriciler için / For Developers:**
- ✅ Tek kaynak kod dosyası (`installer.nsi`)
- ✅ Kolay bakım ve güncelleme
- ✅ Yeni dil eklemek çok kolay
- ✅ GitHub Actions tek yükleyici oluşturur

## 🔄 Geçiş Rehberi / Migration Guide

**Eski kullanıcılar için / For existing users:**
1. Eski yükleyici ile kurulum yaptıysanız, önce kaldırın
2. Yeni multilingual yükleyiciyi indirin
3. Dilini seçin ve yeniden kurun
4. Bağlam menüsü tercihinize göre güncellenecek!

## 🌟 Gelecek Planları / Future Plans

- 🇩🇪 Almanca desteği / German support
- 🇫🇷 Fransızca desteği / French support
- 🇪🇸 İspanyolca desteği / Spanish support
- 🇷🇺 Rusça desteği / Russian support

Yeni dil eklemek sadece birkaç satır kod!

## 🙏 Teşekkürler / Thanks

Bu özellik kullanıcı isteği üzerine eklendi. Geri bildirimleriniz için teşekkürler!

This feature was added based on user request. Thank you for your feedback!

---

## Tam Değişiklik Listesi / Full Changelog

### Added / Eklenenler
- ✅ Multilingual installer with language selection dialog
- ✅ Turkish language support in main installer
- ✅ Language-specific context menu text
- ✅ MULTILINGUAL.md documentation
- ✅ Updated BUILD.md with multilingual info

### Changed / Değişenler
- 🔄 `installer.nsi` now supports both English and Turkish
- 🔄 `build-installer.bat` updated to mention multilingual support
- 🔄 README.md updated with language selection info

### Deprecated / Kullanımdan Kaldırılanlar
- ⚠️ `Turkish/installer-tr.nsi` - Now merged into main `installer.nsi`
- ⚠️ `Turkish/build-installer-tr.bat` - No longer needed

### Technical / Teknik
- Uses NSIS Modern UI 2 language system
- LangString macros for all translatable text
- Registry storage for language preference
- Supports unlimited languages with minimal code changes

---

**Dosya boyutu / File size:** ~550 KB  
**Desteklenen diller / Supported languages:** 2 (English, Turkish)  
**NSIS versiyonu / NSIS version:** 3.0+  
**Windows desteği / Windows support:** Windows 7, 8, 10, 11
