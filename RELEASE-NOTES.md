# aPath EXE/MSI Yükleyici Entegrasyonu Tamamlandı! 🎉

## Yapılanlar

Projenize tek bir çalıştırılabilir dosya (EXE) olarak yükleyici oluşturma yeteneği ekledim. İşte tüm değişiklikler:

### ✅ Ana Özellikler

1. **NSIS Yükleyici Scripti** (`installer.nsi`)
   - Tek tıkla profesyonel yükleyici
   - Otomatik yönetici hakları talebi
   - Windows Program Ekle/Kaldır'a otomatik kayıt
   - Kolay kaldırma desteği

2. **GitHub Actions Otomasyonu** (`.github/workflows/build-installer.yml`)
   - Git tag oluşturduğunuzda otomatik derleme
   - Otomatik GitHub Release oluşturma
   - Yükleyiciyi otomatik olarak release'e ekleme

3. **Yerel Derleme Desteği** (`build-installer.bat`)
   - Windows'ta yerel olarak yükleyici derleme
   - NSIS kurulu mu kontrolü
   - Kullanıcı dostu hata mesajları

4. **Türkçe Lokalizasyon** (Turkish/ klasörü)
   - Türkçe arayüzlü yükleyici (`installer-tr.nsi`)
   - Türkçe derleme scripti (`build-installer-tr.bat`)
   - Türkçe dokümantasyon (`BUILD_TR.md`)

5. **Dokümantasyon**
   - İngilizce: `BUILD.md` - Detaylı derleme ve yayınlama kılavuzu
   - Türkçe: `BUILD_TR.md` - Türkçe derleme ve yayınlama kılavuzu
   - README.md güncellendi - Yeni yükleyici kullanım talimatları

## 🚀 Nasıl Kullanılır?

### Seçenek 1: Otomatik Release (Önerilen)

```bash
# 1. Değişiklikleri commit edin
git add .
git commit -m "Version 1.0.0"

# 2. Tag oluşturun ve push edin
git tag v1.0.0
git push origin v1.0.0

# 3. GitHub Actions otomatik olarak:
#    - Yükleyiciyi derleyecek
#    - Release oluşturacak
#    - aPath-Installer.exe'yi ekleyecek
```

Sonuç: https://github.com/tolgadeg35/aPath/releases adresinde otomatik release!

### Seçenek 2: Yerel Derleme

Windows bilgisayarınızda:

```cmd
# 1. NSIS kurun (tek seferlik)
choco install nsis -y

# 2. Yükleyiciyi derleyin
build-installer.bat

# 3. Oluşan aPath-Installer.exe dosyasını kullanın
```

### Türkçe Yükleyici İçin

```cmd
cd Turkish
build-installer-tr.bat
```

Bu `aPath-Kurulum-TR.exe` dosyasını oluşturacak.

## 📦 Yükleyici Özellikleri

Kullanıcılar için:
- ✅ Tek çalıştırılabilir dosya - kurulum için başka dosya gerekmez
- ✅ Profesyonel kurulum sihirbazı arayüzü
- ✅ Otomatik yönetici hakları
- ✅ Program Ekle/Kaldır'dan kolay kaldırma
- ✅ Temiz kaldırma - tüm izler silinir

Teknik olarak:
- ✅ VBScript'i C:\Windows'a kopyalar
- ✅ Tüm registry ayarlarını yapar
- ✅ Kaldırıcı oluşturur
- ✅ Windows Add/Remove Programs'a kaydeder
- ✅ İngilizce ve Türkçe dil desteği

## 📋 Dosya Yapısı

```
aPath/
├── .github/workflows/
│   └── build-installer.yml      # GitHub Actions workflow
├── Turkish/
│   ├── installer-tr.nsi         # Türkçe yükleyici
│   ├── build-installer-tr.bat   # Türkçe derleme scripti
│   ├── BUILD_TR.md              # Türkçe dokümantasyon
│   └── README.md                # Turkish klasör açıklaması
├── installer.nsi                # İngilizce yükleyici scripti
├── build-installer.bat          # Yerel derleme scripti
├── BUILD.md                     # Detaylı derleme kılavuzu
├── LICENSE.txt                  # MIT Lisansı
└── README.md                    # Güncellendi: yeni kurulum talimatları
```

## 🎯 Sonraki Adımlar

1. **Pull Request'i Merge Edin**
   - Bu branch'i main'e merge edin

2. **İlk Release'i Oluşturun**
   ```bash
   git checkout main
   git pull
   git tag v1.0.0
   git push origin v1.0.0
   ```

3. **Release'i Kontrol Edin**
   - GitHub Actions'da build'in tamamlanmasını bekleyin (~2-3 dakika)
   - https://github.com/tolgadeg35/aPath/releases adresini ziyaret edin
   - `aPath-Installer.exe` dosyasının eklendiğini görün!

4. **Paylaşın!**
   - Artık tek bir EXE dosyası ile projenizi paylaşabilirsiniz
   - Kullanıcılar sadece EXE'yi indirip çalıştıracak
   - Başka dosyaya ihtiyaç yok!

## 💡 İpuçları

- **MSI formatı için**: NSIS yerine WiX Toolset kullanılabilir, ama EXE formatı daha yaygın ve kullanımı kolay
- **Güncelleme için**: Yeni versiyon için yeni tag oluşturun (örn: v1.0.1, v1.1.0)
- **Test etmek için**: Workflow'u manuel tetiklemek için GitHub Actions sekmesinde "Run workflow" kullanın

## 🔒 Güvenlik

- Tüm işlemler resmi GitHub Actions ve NSIS ile yapılır
- Kaynak kodu tamamen açık
- İmzalama için gelecekte code signing sertifikası eklenebilir

## ❓ Sorular?

Daha fazla detay için:
- İngilizce: `BUILD.md`
- Türkçe: `Turkish/BUILD_TR.md`

---

**Tebrikler! Artık projeniz profesyonel bir yükleyici ile dağıtılabilir! 🎉**
