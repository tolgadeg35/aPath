# Copy Path Context Menu for Windows 10

A lightweight context menu extension for Windows 10 that allows you to copy the full path of files and directories with a single click. This uses a hidden VBScript background worker to ensure **no CMD or PowerShell windows pop up** during use.

## 🚀 Features
* **Zero-Window Execution:** Paths are copied silently in the background.
* **Smart Folder Detection:** Automatically appends a `\` to the end of directory paths for easier terminal navigation.
* **Universal Support:** Works on files, folders, and inside folder backgrounds.
* **Custom Icon:** Includes the native Windows "path" icon for a professional look.

## 🛠 Installation

### Option 1: Automated Installer (Recommended)
1.  Go to the **Releases** section on the right side of the repository page.
2.  Download the latest installer (`.exe`) file.
3.  Run the installer and follow the simple on-screen instructions.

### Option 2: Manual Installation (Script)
1.  **Download** or clone this repository.
2.  Locate `install.bat`.
3.  **Right-click** on `install.bat` and select **"Run as Administrator"**.
    * *Note: Administrative rights are required to copy the script to the `C:\Windows` directory and update Registry keys.*

## 📂 Project Structure
* `aPath.vbs`: The background script that handles logic and clipboard interaction.
* `RegistrySetup.reg`: The registry configuration for the context menu entries.
* `install.bat`: The automated installer.
* `uninstall.bat`: A clean-up script to remove all traces of the tool.

## 🔍 Technical Details
The tool uses a hybrid approach to bypass the Windows limitation of showing a console window when executing commands from the registry:
1.  The Registry triggers `wscript.exe`, which is a GUI-less script host.
2.  The VBScript checks if the target is a folder using `Scripting.FileSystemObject`.
3.  The final path is sent to the clipboard via a hidden PowerShell call to ensure UTF-8 characters (like Turkish or accented letters) are handled correctly.

## 🗑 Uninstallation
If you wish to remove the extension, simply right-click `uninstall.bat` and **Run as Administrator**. This will remove the Registry keys and delete the `aPath.vbs` file from your system.

---
*Created by Tolgadeg35 for a cleaner experience.*