# Sorun Giderme Kılavuzu / Troubleshooting Guide

## "VBS dosyasını oluşturmuyor" Hatası

Bu belge, yükleyici oluştururken veya kurarken karşılaşılan VBS dosyası sorunlarını çözmenize yardımcı olur.

### 🔍 Problem Tespiti

#### 1. Yükleyici Derlerken Hata

**Semptom:** `makensis` çalıştırıldığında hata veriyor

**Çözüm:**
```cmd
# 1. Doğru dizinde olduğunuzdan emin olun
cd C:\path\to\aPath

# 2. aPath.vbs dosyasının var olduğunu kontrol edin
dir aPath.vbs

# 3. Eğer dosya yoksa, repoyu yeniden klonlayın
git pull origin main
```

**Kontrol Listesi:**
- [ ] aPath.vbs dosyası proje kök dizininde mevcut
- [ ] installer.nsi dosyası ile aynı dizinde çalışıyorsunuz
- [ ] NSIS doğru şekilde kurulu

#### 2. Yükleyici Kurulurken Hata

**Semptom:** Yükleyici çalışırken "aPath.vbs dosyası kurulamadı!" hatası

**Olası Nedenler:**
- Yönetici hakları yok
- C:\Windows dizini yazma korumalı
- Antivirüs yazılımı engelliyor

**Çözüm:**
```cmd
# 1. Yükleyiciyi yönetici olarak çalıştırın
# Sağ tıklayın -> "Yönetici olarak çalıştır"

# 2. Antivirüs programınızı geçici olarak devre dışı bırakın

# 3. Windows Defender'ın engellemediğinden emin olun
```

### 🛠️ Manuel Kurulum (Alternatif)

Eğer yükleyici çalışmıyorsa, manuel kurulum yapabilirsiniz:

```cmd
# 1. Komut istemini yönetici olarak açın

# 2. VBS dosyasını kopyalayın
copy aPath.vbs C:\Windows\aPath.vbs

# 3. Registry ayarlarını uygulayın
regedit.exe /s RegistrySetup.reg

# 4. Kurulumu doğrulayın
dir C:\Windows\aPath.vbs
```

### 🔧 Derleme Sorunları

#### NSIS Kurulu Değil

```cmd
# Chocolatey ile kurun (önerilen)
choco install nsis -y

# Veya manuel indirin
# https://nsis.sourceforge.io/Download
```

#### Dosya Yolu Sorunları

**İngilizce Yükleyici için:**
```
installer.nsi -> aPath.vbs (aynı dizinde olmalı)
```

**Türkçe Yükleyici için:**
```
Turkish/installer-tr.nsi -> ../aPath.vbs (üst dizinde olmalı)
```

### 📝 Güncellenmiş Derleme Komutları

Artık derleme betikleri otomatik olarak kontrol yapıyor:

```cmd
# İngilizce yükleyici
build-installer.bat
# ✓ aPath.vbs dosyasını kontrol eder
# ✓ NSIS kurulumunu kontrol eder
# ✓ Başarılı derlemeyi doğrular

# Türkçe yükleyici
cd Turkish
build-installer-tr.bat
# ✓ ../aPath.vbs dosyasını kontrol eder
# ✓ NSIS kurulumunu kontrol eder
# ✓ Başarılı derlemeyi doğrular
```

### 🐛 Debug Modu

Detaylı hata mesajları için:

```cmd
# NSIS'i verbose modda çalıştırın
makensis /V4 installer.nsi

# Çıktıdaki "File" satırlarını kontrol edin
# "File: aPath.vbs" -> [X] bytes yazmalı
```

### ✅ Kurulum Doğrulama

Kurulum sonrası kontrol:

```cmd
# 1. VBS dosyası var mı?
dir C:\Windows\aPath.vbs

# 2. Registry anahtarları var mı?
reg query "HKCR\*\shell\aPath"

# 3. Bağlam menüsü çalışıyor mu?
# Herhangi bir dosyaya sağ tıklayın
# "Yolu Kopyala" veya "Copy Path" görünmeli
```

### 🔒 Güvenlik ve İzinler

#### Windows Defender SmartScreen

```
1. Yükleyici ilk kez çalıştırıldığında uyarı verebilir
2. "Daha fazla bilgi" -> "Yine de çalıştır" seçin
3. Bu normaldir (kod imzalama sertifikası olmadığı için)
```

#### UAC (Kullanıcı Hesabı Denetimi)

```
Yükleyici otomatik olarak yönetici hakları ister
"Evet" düğmesine tıklayın
```

### 📞 Hala Sorun mu Var?

GitHub Issues üzerinden rapor edin:
https://github.com/tolgadeg35/aPath/issues

**Şunları ekleyin:**
- [ ] Windows sürümünüz
- [ ] Hata mesajının tam metni
- [ ] NSIS çıktısının tamamı (verbose mode)
- [ ] `dir aPath.vbs` komutunun çıktısı

---

## English Version

### "Not Creating VBS File" Error

#### Build-Time Issues

**Check:**
1. `aPath.vbs` exists in project root
2. Running from correct directory
3. NSIS is installed

**Solution:**
```cmd
# Verify file exists
dir aPath.vbs

# Build with verification
build-installer.bat
```

#### Runtime Issues

**Problem:** Installer fails to copy VBS file

**Solutions:**
1. Run installer as administrator
2. Disable antivirus temporarily
3. Check Windows folder permissions

#### Manual Installation

```cmd
# Run as Administrator
copy aPath.vbs C:\Windows\aPath.vbs
regedit.exe /s RegistrySetup.reg
```

#### Verification

```cmd
# Check file installed
dir C:\Windows\aPath.vbs

# Check registry
reg query "HKCR\*\shell\aPath"

# Test context menu
# Right-click any file -> should see "Copy Path"
```

For more help, open an issue:
https://github.com/tolgadeg35/aPath/issues
