# Multilingual Installer Guide / Çok Dilli Yükleyici Kılavuzu

## English

### Overview

The aPath installer now supports **multiple languages** in a single executable file. When you run the installer, you can choose your preferred language, and the entire installation experience (including the context menu text) will be in that language.

### Supported Languages

- 🇬🇧 **English** - Context menu shows "Copy Path"
- 🇹🇷 **Turkish (Türkçe)** - Context menu shows "Yolu Kopyala"

### How It Works

1. **Language Selection**: When you start the installer, a dialog appears asking you to select your language
2. **Installation**: All installer screens, buttons, and messages appear in your chosen language
3. **Context Menu**: The right-click context menu text is set based on your language choice
4. **Uninstaller**: Your language preference is remembered for the uninstaller

### Technical Details

The installer uses NSIS's multilingual capabilities:
- Both languages are embedded in a single `.exe` file
- No separate download needed for different languages
- Language selection is stored in the Windows registry
- Context menu text is dynamically set during installation

### For Developers

The multilingual installer is defined in `installer.nsi` with:
- Multiple `!insertmacro MUI_LANGUAGE` declarations
- `LangString` definitions for translatable text
- Language selection dialog (`MUI_LANGDLL_DISPLAY`)
- Registry-based context menu text using `$(CONTEXT_MENU_TEXT)`

### Benefits

- ✅ **Single File**: One installer for all languages
- ✅ **User Choice**: Users select their preferred language
- ✅ **Consistent UX**: Entire experience matches selected language
- ✅ **Easy Distribution**: No need for separate language-specific installers
- ✅ **Future Ready**: Easy to add more languages

---

## Türkçe

### Genel Bakış

aPath yükleyicisi artık **tek bir çalıştırılabilir dosyada birden fazla dili** destekliyor. Yükleyiciyi çalıştırdığınızda tercih ettiğiniz dili seçebilirsiniz ve tüm kurulum deneyimi (bağlam menüsü metni dahil) o dilde olacaktır.

### Desteklenen Diller

- 🇬🇧 **İngilizce (English)** - Bağlam menüsü "Copy Path" gösterir
- 🇹🇷 **Türkçe** - Bağlam menüsü "Yolu Kopyala" gösterir

### Nasıl Çalışır

1. **Dil Seçimi**: Yükleyiciyi başlattığınızda, dilinizi seçmenizi isteyen bir pencere görünür
2. **Kurulum**: Tüm yükleyici ekranları, düğmeler ve mesajlar seçtiğiniz dilde görünür
3. **Bağlam Menüsü**: Sağ tıklama bağlam menüsü metni, dil seçiminize göre ayarlanır
4. **Kaldırıcı**: Dil tercihiniz kaldırıcı için hatırlanır

### Teknik Detaylar

Yükleyici, NSIS'in çok dilli özelliklerini kullanır:
- Her iki dil de tek bir `.exe` dosyasına gömülüdür
- Farklı diller için ayrı indirme gerekmez
- Dil seçimi Windows kayıt defterinde saklanır
- Bağlam menüsü metni kurulum sırasında dinamik olarak ayarlanır

### Geliştiriciler İçin

Çok dilli yükleyici `installer.nsi` dosyasında şunlarla tanımlanır:
- Çoklu `!insertmacro MUI_LANGUAGE` bildirimleri
- Çevrilebilir metin için `LangString` tanımlamaları
- Dil seçim diyalogu (`MUI_LANGDLL_DISPLAY`)
- `$(CONTEXT_MENU_TEXT)` kullanarak kayıt defteri tabanlı bağlam menüsü metni

### Faydalar

- ✅ **Tek Dosya**: Tüm diller için tek yükleyici
- ✅ **Kullanıcı Seçimi**: Kullanıcılar tercih ettikleri dili seçer
- ✅ **Tutarlı Deneyim**: Tüm deneyim seçilen dille eşleşir
- ✅ **Kolay Dağıtım**: Dile özel ayrı yükleyicilere gerek yok
- ✅ **Geleceğe Hazır**: Daha fazla dil eklenmesi kolay

---

## Adding More Languages / Daha Fazla Dil Ekleme

To add support for another language:

1. Add the language to `installer.nsi`:
   ```nsis
   !insertmacro MUI_LANGUAGE "German"
   ```

2. Add LangString translations:
   ```nsis
   LangString CONTEXT_MENU_TEXT ${LANG_GERMAN} "Pfad kopieren"
   LangString ERROR_VBS_INSTALL ${LANG_GERMAN} "aPath.vbs konnte nicht installiert werden!"
   LangString ERROR_VBS_COPY ${LANG_GERMAN} "Installation fehlgeschlagen: aPath.vbs konnte nicht kopiert werden"
   ```

3. Rebuild the installer with `build-installer.bat`

That's it! The language selection dialog will automatically include the new language.

---

Başka bir dil desteği eklemek için:

1. Dili `installer.nsi` dosyasına ekleyin:
   ```nsis
   !insertmacro MUI_LANGUAGE "German"
   ```

2. LangString çevirilerini ekleyin:
   ```nsis
   LangString CONTEXT_MENU_TEXT ${LANG_GERMAN} "Pfad kopieren"
   LangString ERROR_VBS_INSTALL ${LANG_GERMAN} "aPath.vbs konnte nicht installiert werden!"
   LangString ERROR_VBS_COPY ${LANG_GERMAN} "Installation fehlgeschlagen: aPath.vbs konnte nicht kopiert werden"
   ```

3. Yükleyiciyi `build-installer.bat` ile yeniden derleyin

Bu kadar! Dil seçim penceresi otomatik olarak yeni dili içerecektir.
