# aPath İnşa ve Yayınlama Kılavuzu

Bu belge, yükleyiciyi nasıl derleyip sürüm olarak yayınlayacağınızı açıklar.

## Yükleyiciyi Derleme

### Gereksinimler

NSIS (Nullsoft Scriptable Install System) kurulu olmalıdır:

**Seçenek 1: Doğrudan İndirin**
- https://nsis.sourceforge.io/Download adresini ziyaret edin
- NSIS'i indirin ve kurun
- NSIS'i PATH'e ekleyin (genellikle `C:\Program Files (x86)\NSIS`)

**Seçenek 2: Chocolatey ile Kurun (önerilen)**
```cmd
choco install nsis -y
```

### Yerel Olarak Derleme

1. Komut istemini proje dizininde açın
2. Derleme betiğini çalıştırın:
   ```cmd
   build-installer.bat
   ```
3. Yükleyici `aPath-Installer.exe` olarak oluşturulacaktır

### Manuel Derleme

Manuel olarak derlemek isterseniz:
```cmd
makensis installer.nsi
```

## Sürüm Oluşturma

### GitHub Actions ile Otomatik Sürüm

Depo, yeni bir etiket oluşturduğunuzda otomatik olarak yükleyiciyi derleyip yayınlayacak şekilde yapılandırılmıştır:

1. Tüm değişikliklerin kaydedildiğinden emin olun
2. Yeni bir etiket oluşturun ve gönderin:
   ```cmd
   git tag v1.0.0
   git push origin v1.0.0
   ```
3. GitHub Actions otomatik olarak:
   - Yükleyiciyi derleyecek
   - GitHub Sürümü oluşturacak
   - `aPath-Installer.exe` dosyasını sürüme ekleyecek

### Manuel Sürüm

1. Yükleyiciyi yerel olarak derleyin (yukarıya bakın)
2. https://github.com/tolgadeg35/aPath/releases/new adresine gidin
3. Yeni bir etiket oluşturun (örn: `v1.0.0`)
4. `aPath-Installer.exe` dosyasını yükleyin
5. Değişiklikleri açıklayan sürüm notları ekleyin
6. "Sürümü yayınla"ya tıklayın

## Yükleyiciyi Test Etme

Yayınlamadan önce:

1. Yükleyiciyi derleyin
2. Test makinesinde `aPath-Installer.exe` dosyasını çalıştırın
3. Kurulumu doğrulayın:
   - Bir dosyaya sağ tıklayın → "Yolu Kopyala" görünmeli
   - Bir klasöre sağ tıklayın → "Yolu Kopyala" görünmeli
   - Boş klasör alanına sağ tıklayın → "Yolu Kopyala" görünmeli
4. Kaldırıcıyı test edin:
   - Ayarlar > Uygulamalar > Uygulamalar ve özellikler'e gidin
   - "aPath"ı bulun ve kaldırın
   - Bağlam menüsü girişlerinin kaldırıldığını doğrulayın

## Yükleyici Özellikleri

NSIS yükleyici:
- ✅ Otomatik olarak yönetici ayrıcalıkları ister
- ✅ `aPath.vbs` dosyasını Windows dizinine kopyalar
- ✅ Bağlam menüsü için tüm kayıt defteri girişlerini ayarlar
- ✅ Bir kaldırıcı oluşturur
- ✅ Windows Program Ekle/Kaldır'a kaydolur
- ✅ Temiz bir kaldırma deneyimi sağlar

## Dosya Yapısı

```
aPath/
├── .github/
│   └── workflows/
│       └── build-installer.yml    # GitHub Actions iş akışı
├── aPath.vbs                       # Ana VBScript
├── installer.nsi                   # NSIS yükleyici betiği
├── build-installer.bat             # Yerel derleme betiği
├── LICENSE.txt                     # Yükleyici için gerekli
├── install.bat                     # Manuel kurulum (eski)
├── uninstall.bat                   # Manuel kaldırma (eski)
└── RegistrySetup.reg               # Kayıt defteri girişleri (eski)
```

## Sürüm Numaraları

`installer.nsi` dosyasındaki sürüm numarasını güncelleyin:
```nsis
!define APP_VERSION "1.0.0"
```

Tutarlılık için bunu git etiketlerinizle eşleştirin.
