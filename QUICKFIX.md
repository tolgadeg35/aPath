# Hızlı Çözüm Kılavuzu

## ⚡ En Sık Karşılaşılan Sorunlar ve Çözümleri

### 1. "aPath.vbs bulunamadı" Hatası (Derleme Sırasında)

```cmd
# ✓ Çözüm:
cd C:\path\to\aPath
dir aPath.vbs
# Eğer dosya yoksa:
git pull origin main
```

### 2. "aPath.vbs dosyası kurulamadı" Hatası (Kurulum Sırasında)

```
✓ Yükleyiciyi sağ tıklayıp "Yönetici olarak çalıştır" seçin
✓ Antivirüs programını geçici olarak kapatın
✓ Windows Defender'ın engellemediğinden emin olun
```

### 3. Bağlam Menüsünde "Copy Path" Görünmüyor

```cmd
# Kontrol:
dir C:\Windows\aPath.vbs
reg query "HKCR\*\shell\aPath"

# Eğer eksikse, manuel kurun:
install.bat (yönetici olarak çalıştır)
```

### 4. NSIS Kurulu Değil

```cmd
# En kolay yöntem (Chocolatey):
choco install nsis -y

# Veya manuel:
# https://nsis.sourceforge.io/Download
```

### 5. Yanlış Dizinde Derleme Yapıyorsunuz

```cmd
# İngilizce yükleyici için:
cd C:\path\to\aPath
build-installer.bat

# Türkçe yükleyici için:
cd C:\path\to\aPath\Turkish
build-installer-tr.bat
```

## 🔧 Hızlı Doğrulama Komutları

```cmd
# 1. Kaynak dosya var mı?
dir aPath.vbs

# 2. NSIS kurulu mu?
where makensis

# 3. VBS dosyası kurulu mu?
dir C:\Windows\aPath.vbs

# 4. Registry ayarları var mı?
reg query "HKCR\*\shell\aPath\command"
```

## 📋 Temiz Kurulum Adımları

```cmd
# 1. Eski kurulumu kaldırın (eğer varsa)
uninstall.bat (yönetici olarak)

# 2. Yeni yükleyiciyi indirin
# Releases sayfasından aPath-Installer.exe

# 3. Yönetici olarak çalıştırın
# Sağ tık -> Yönetici olarak çalıştır

# 4. Kurulum tamamlandıktan sonra test edin
# Herhangi bir dosyaya sağ tıklayın
```

## 🆘 Acil Yardım

Manuel kurtarma (her şey başarısız olduysa):

```cmd
# 1. Yönetici komut istemi açın
# 2. Şunu çalıştırın:
copy /Y aPath.vbs C:\Windows\aPath.vbs
regedit.exe /s RegistrySetup.reg

# 3. Doğrulayın:
dir C:\Windows\aPath.vbs
# Dosya boyutu: ~582 bytes olmalı
```

## 📞 İletişim

Daha fazla yardım için:
- Detaylı rehber: [TROUBLESHOOTING.md](TROUBLESHOOTING.md)
- GitHub Issues: https://github.com/tolgadeg35/aPath/issues
- Derleme rehberi: [BUILD_TR.md](Turkish/BUILD_TR.md)

---

## Quick Reference (English)

### Common Issues

1. **"aPath.vbs not found"** → Run from correct directory
2. **"Failed to install"** → Run as Administrator
3. **Context menu missing** → Check file at `C:\Windows\aPath.vbs`
4. **NSIS not found** → Install with `choco install nsis -y`

### Quick Checks

```cmd
dir aPath.vbs              # Source file
where makensis             # NSIS installed
dir C:\Windows\aPath.vbs   # Installed file
```

### Emergency Fix

```cmd
copy aPath.vbs C:\Windows\aPath.vbs
regedit.exe /s RegistrySetup.reg
```
