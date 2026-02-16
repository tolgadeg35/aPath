# Building and Releasing aPath

This document explains how to build the installer and create releases.

## Building the Installer

### Prerequisites

You need NSIS (Nullsoft Scriptable Install System) installed:

**Option 1: Download directly**
- Visit https://nsis.sourceforge.io/Download
- Download and install NSIS
- Add NSIS to your PATH (usually `C:\Program Files (x86)\NSIS`)

**Option 2: Install via Chocolatey (recommended)**
```cmd
choco install nsis -y
```

### Building Locally

1. Open a command prompt in the project directory
2. Run the build script:
   ```cmd
   build-installer.bat
   ```
3. The installer will be created as `aPath-Installer.exe`

### Building Manually

If you prefer to build manually:
```cmd
makensis installer.nsi
```

## Creating a Release

### Automatic Release via GitHub Actions

The repository is configured to automatically build and release the installer when you create a new tag:

1. Make sure all changes are committed
2. Create and push a new tag:
   ```cmd
   git tag v1.0.0
   git push origin v1.0.0
   ```
3. GitHub Actions will automatically:
   - Build the installer
   - Create a GitHub Release
   - Attach `aPath-Installer.exe` to the release

### Manual Release

1. Build the installer locally (see above)
2. Go to https://github.com/tolgadeg35/aPath/releases/new
3. Create a new tag (e.g., `v1.0.0`)
4. Upload `aPath-Installer.exe`
5. Add release notes describing changes
6. Click "Publish release"

## Testing the Installer

Before releasing:

1. Build the installer
2. Run `aPath-Installer.exe` on a test machine
3. Verify the installation:
   - Right-click on a file → should see "Copy Path"
   - Right-click on a folder → should see "Copy Path"
   - Right-click in empty folder space → should see "Copy Path"
4. Test the uninstaller:
   - Go to Settings > Apps > Apps & features
   - Find "aPath" and uninstall
   - Verify context menu entries are removed

## Installer Features

The NSIS installer:
- ✅ Requests administrator privileges automatically
- ✅ Copies `aPath.vbs` to Windows directory
- ✅ Sets up all registry entries for context menu
- ✅ Creates an uninstaller
- ✅ Registers in Windows Add/Remove Programs
- ✅ Provides a clean uninstall experience

## File Structure

```
aPath/
├── .github/
│   └── workflows/
│       └── build-installer.yml    # GitHub Actions workflow
├── aPath.vbs                       # Main VBScript
├── installer.nsi                   # NSIS installer script
├── build-installer.bat             # Local build script
├── LICENSE.txt                     # Required for installer
├── install.bat                     # Manual installation (legacy)
├── uninstall.bat                   # Manual uninstallation (legacy)
└── RegistrySetup.reg               # Registry entries (legacy)
```

## Version Numbers

Update the version number in `installer.nsi`:
```nsis
!define APP_VERSION "1.0.0"
```

Match this with your git tags for consistency.
