# Türkçe Sürüm / Turkish Version

Bu klasör, aPath projesinin Türkçe dilinde yükleyici ve dokümantasyon dosyalarını içerir.

## İçerik

- `installer-tr.nsi` - Türkçe dilde NSIS yükleyici betiği
- `build-installer-tr.bat` - Türkçe yükleyiciyi derlemek için betik
- `BUILD_TR.md` - Türkçe derleme ve yayınlama kılavuzu
- `install_TR.bat` - Manuel kurulum betiği (eski yöntem)
- `uninstall_TR.bat` - Manuel kaldırma betiği (eski yöntem)
- `RegistrySetup_TR.reg` - Türkçe kayıt defteri ayarları (eski yöntem)

## Türkçe Yükleyiciyi Derleme

1. Bu klasörde komut istemi açın
2. Şunu çalıştırın:
   ```cmd
   build-installer-tr.bat
   ```
3. Yükleyici `aPath-Kurulum-TR.exe` olarak oluşturulacaktır

## Özellikler

Türkçe yükleyici:
- Türkçe arayüz dilini kullanır
- Bağlam menüsünde "Yolu Kopyala" ifadesini gösterir
- Tüm mesajlar ve diyaloglar Türkçe'dir

---

# English

This folder contains Turkish language installer and documentation files for the aPath project.

## Contents

- `installer-tr.nsi` - NSIS installer script in Turkish
- `build-installer-tr.bat` - Script to build Turkish installer
- `BUILD_TR.md` - Turkish build and release guide
- `install_TR.bat` - Manual installation script (legacy method)
- `uninstall_TR.bat` - Manual uninstallation script (legacy method)
- `RegistrySetup_TR.reg` - Turkish registry settings (legacy method)

## Building the Turkish Installer

1. Open command prompt in this folder
2. Run:
   ```cmd
   build-installer-tr.bat
   ```
3. The installer will be created as `aPath-Kurulum-TR.exe`

## Features

The Turkish installer:
- Uses Turkish interface language
- Shows "Yolu Kopyala" in the context menu
- All messages and dialogs are in Turkish
