## 0.4.4 - 2026/05/29
* feat(macos): add Swift Package Manager (SPM) support
  - Relocate native macOS plugin source to `macos/desktop_window/Sources/desktop_window/`
  - Add `Package.swift` SPM manifest under `macos/desktop_window/` targeting macOS 10.15
  - Update `macos/desktop_window.podspec` to maintain CocoaPods backward compatibility
  - Deintegrate CocoaPods from the example app to transition to a pure SPM runner setup
  - Update minimum environment constraints to require Flutter >=3.41.0 and Dart >=3.11.0

## 0.4.3 - 2026/05/05
* update: SDK constraint to >=3.3.0 <4.0.0, Flutter >=3.19.0
* macos: fix podspec metadata and bump deployment target to 10.14
* macos: fix setBorders bug (key mismatch)
* fix: remove unnecessary import, const cleanup in library dart file
* example: bump cupertino_icons to 1.0.9, fix dart lint warnings


## 0.4.2 - 2024/10/29
* windows: fix crash issue



## 0.4.1 - 2024/10/04
* macos: Use first window when mainWindow is nil


## 0.4.0 - 2021/03/09
* null safety


## 0.3.0 - 2020/10/08
* add Windows support


## 0.2.0 - 2020/09/04
* add Linux support
* add getFullScreen and setFullScreen functions


## 0.1.0 - 2020/05/25

* add setMaxWindowSize, setMinWindowSize
* add toggleFullScreen


## 0.0.1 - 2020/05/25

* initial release
