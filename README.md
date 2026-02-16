# Copy Path Context Menu for Windows 10

A lightweight context menu extension for Windows 10 that allows you to copy the full path of files and directories with a single click. This uses a hidden VBScript background worker to ensure **no CMD or PowerShell windows pop up** during use.

## 🚀 Features
* **Zero-Window Execution:** Paths are copied silently in the background.
* **Smart Folder Detection:** Automatically appends a `\` to the end of directory paths for easier terminal navigation.
* **Universal Support:** Works on files, folders, and inside folder backgrounds.
* **Custom Icon:** Includes the native Windows "path" icon for a professional look.
* **Multilingual Support:** Choose between English and Turkish during installation.

## 🛠 Installation

### Option 1: Using the Installer (Recommended)

1.  **Download** the latest `aPath-Installer.exe` from the [Releases](https://github.com/tolgadeg35/aPath/releases) page.
2.  **Run** the installer (administrative rights will be requested automatically).
3.  **Select your language** - Choose between English or Turkish.
4.  Follow the installation wizard.
5.  You're done! Right-click any file or folder to see the **"Copy Path"** or **"Yolu Kopyala"** option (depending on your language selection).

### Option 2: Manual Installation

1.  **Download** or clone this repository.
2.  Locate `install.bat`.
3.  **Right-click** on `install.bat` and select **"Run as Administrator"**.
    * *Note: Administrative rights are required to copy the script to the `C:\Windows` directory and update Registry keys.*
4.  You're done! Right-click any file or folder to see the **"Copy Path"** option.

## 📂 Project Structure
* `aPath.vbs`: The background script that handles logic and clipboard interaction.
* `installer.nsi`: Multilingual NSIS script for building the installer executable (English & Turkish).
* `build-installer.bat`: Script to build the installer locally.
* `RegistrySetup.reg`: The registry configuration for the context menu entries (for manual installation).
* `install.bat`: The automated installer (manual installation method).
* `uninstall.bat`: A clean-up script to remove all traces of the tool (manual installation method).

For detailed information on building the installer and creating releases, see [BUILD.md](BUILD.md).

## 🔍 Technical Details
The tool uses a hybrid approach to bypass the Windows limitation of showing a console window when executing commands from the registry:
1.  The Registry triggers `wscript.exe`, which is a GUI-less script host.
2.  The VBScript checks if the target is a folder using `Scripting.FileSystemObject`.
3.  The final path is sent to the clipboard via a hidden PowerShell call to ensure UTF-8 characters (like Turkish or accented letters) are handled correctly.

## 🗑 Uninstallation

### If you installed using the installer:
1. Go to **Settings > Apps > Apps & features** (or Control Panel > Programs and Features).
2. Find **"aPath"** in the list and click **Uninstall**.
3. Follow the uninstallation wizard.

### If you installed manually:
If you wish to remove the extension, simply right-click `uninstall.bat` and **Run as Administrator**. This will remove the Registry keys and delete the `aPath.vbs` file from your system.

## ❓ Troubleshooting

Having issues with installation or the VBS file? See the [Troubleshooting Guide](TROUBLESHOOTING.md) for detailed solutions.

---
*Created by Tolgadeg35 for a cleaner experience.*