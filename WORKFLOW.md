# aPath Release Workflow

## Visual Overview

```
┌─────────────────────────────────────────────────────────────┐
│                    Developer Actions                         │
└─────────────────────────────────────────────────────────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │  Create Git Tag │
                   │   (e.g. v1.0.0) │
                   └─────────────────┘
                            │
                            ▼
                   ┌─────────────────┐
                   │  Push to GitHub │
                   │ git push origin │
                   │      v1.0.0     │
                   └─────────────────┘
                            │
┌───────────────────────────┼───────────────────────────┐
│                           ▼                           │
│              ┌──────────────────────┐                 │
│              │  GitHub Actions      │                 │
│              │  Workflow Triggered  │                 │
│              └──────────────────────┘                 │
│                           │                           │
│                           ▼                           │
│              ┌──────────────────────┐                 │
│              │  Install NSIS        │                 │
│              │  (Chocolatey)        │                 │
│              └──────────────────────┘                 │
│                           │                           │
│                           ▼                           │
│              ┌──────────────────────┐                 │
│              │  Build Installer     │                 │
│              │  makensis            │                 │
│              │  installer.nsi       │                 │
│              └──────────────────────┘                 │
│                           │                           │
│                           ▼                           │
│              ┌──────────────────────┐                 │
│              │  aPath-Installer.exe │                 │
│              │  Created             │                 │
│              └──────────────────────┘                 │
│                           │                           │
│              ┌────────────┴────────────┐              │
│              ▼                         ▼              │
│   ┌──────────────────┐      ┌──────────────────┐     │
│   │ Upload Artifact  │      │ Create Release   │     │
│   │ to GitHub        │      │ Attach .exe file │     │
│   └──────────────────┘      └──────────────────┘     │
│                                                       │
└───────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────┐
│                      End Users                               │
│                                                              │
│  1. Visit Releases page                                      │
│  2. Download aPath-Installer.exe                             │
│  3. Run installer (auto-requests admin)                      │
│  4. Installation complete!                                   │
│  5. Right-click menu now has "Copy Path"                     │
└─────────────────────────────────────────────────────────────┘
```

## File Dependencies

```
installer.nsi
    │
    ├─── aPath.vbs (included)
    ├─── LICENSE.txt (displayed during install)
    └─── Registry Settings (configured automatically)

build-installer.yml (GitHub Actions)
    │
    ├─── Triggers on: v* tags
    ├─── Uses: windows-latest
    ├─── Installs: NSIS via Chocolatey
    └─── Outputs: aPath-Installer.exe
```

## Local Build vs Automated Build

### Local Build (Manual)
```
Developer PC (Windows)
    │
    ├─── Has NSIS installed
    ├─── Runs: build-installer.bat
    ├─── Creates: aPath-Installer.exe
    └─── Can test locally before release
```

### Automated Build (Recommended)
```
GitHub Actions (Cloud)
    │
    ├─── Triggered by git tag
    ├─── Auto-installs NSIS
    ├─── Auto-builds installer
    ├─── Auto-creates release
    └─── Auto-attaches installer to release
```

## Installer Behavior

```
User runs aPath-Installer.exe
    │
    ├─── Step 1: UAC prompt (admin request)
    ├─── Step 2: Welcome screen
    ├─── Step 3: License agreement
    ├─── Step 4: Installation
    │         │
    │         ├─── Copy aPath.vbs → C:\Windows\
    │         ├─── Write registry keys for context menu
    │         ├─── Create uninstaller → C:\Windows\aPath-Uninstall.exe
    │         └─── Register in Add/Remove Programs
    │
    └─── Step 5: Completion
              │
              └─── Context menu active immediately!
```

## Uninstall Behavior

```
User uninstalls via Add/Remove Programs
    │
    ├─── Runs: aPath-Uninstall.exe
    │         │
    │         ├─── Delete registry keys
    │         ├─── Delete aPath.vbs
    │         └─── Delete uninstaller
    │
    └─── System restored to pre-installation state
```

## Directory Structure After Installation

```
C:\Windows\
    ├─── aPath.vbs (Main script)
    └─── aPath-Uninstall.exe (Uninstaller)

Registry:
    HKEY_CLASSES_ROOT\
        ├─── Directory\Background\shell\aPath\
        ├─── Directory\shell\aPath\
        └─── *\shell\aPath\
```

## Version Management

```
Version defined in installer.nsi:
    !define APP_VERSION "1.0.0"

Should match git tag:
    v1.0.0

Displayed in:
    - Add/Remove Programs
    - Installer wizard
    - Release notes
```
