# HP 48GX for iOS

The desktop calculator (`crates/hp48-app`) as an iPhone and iPad app. The Rust
code is the same; `crates/hp48-ios` builds it as a static library, and this
Xcode project links that library into a small Objective-C program
(`HP48GX/main.m`). The ROM built from `firmware/` (`ROM/gxrom-hires`) is
compiled into the app.

## Building

You need Xcode and Rust (rustup). The project's "Build Rust" phase runs
`build-rust.sh`, which adds the iOS targets with rustup if they're missing and
runs `cargo build --release -p hp48-ios` for the device or the simulator.

Open `ios/HP48GX.xcodeproj` in Xcode, pick a simulator or a device, and run.
From the command line, for the simulator:

```bash
cd ios && xcodebuild -project HP48GX.xcodeproj -scheme HP48GX -sdk iphonesimulator -derivedDataPath ../target/xcode CODE_SIGNING_ALLOWED=NO build
```

If `xcode-select -p` shows the Command Line Tools, put
`DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer` in front of
`xcodebuild`, or switch for good with
`sudo xcode-select -s /Applications/Xcode.app/Contents/Developer`.

Only Apple Silicon simulators are built (`EXCLUDED_ARCHS = x86_64`).

## Releasing

1. In the HP48GX target's Signing & Capabilities, choose your team
   (`DEVELOPMENT_TEAM`), and change the bundle identifier
   (`com.danielparnell.hp48gx`) if you want a different one.
2. Raise `MARKETING_VERSION` (shown to users) and `CURRENT_PROJECT_VERSION`
   (the build number, which must go up with each upload).
3. Product ▸ Archive, then Distribute App from the Organizer, for TestFlight
   or the App Store.

Info.plist declares no non-exempt encryption (`ITSAppUsesNonExemptEncryption`),
so App Store Connect doesn't ask about export compliance.

## How the app behaves

- UIKit requires the scene life cycle, which winit (under eframe) doesn't
  support: it makes a plain `UIWindow` at launch. `main.m` declares a scene
  (`HP48SceneDelegate`, in Info.plist) and wraps `makeKeyAndVisible`, so
  winit's window is given that scene, after it connects if need be.

- It uses the same layout rules as the desktop: on an iPhone, and on an iPad
  in portrait, you get the calculator alone; on an iPad in landscape, the
  desktop panel is beside it. iPhones stay in portrait.
- The layout stays inside the safe area (clear of the notch, the Dynamic Island
  and the home indicator).
- Continuous memory lives in the app's `Library/Application Support/HP48GX`.
  It's saved when the app goes to the background (iOS may end a background app
  without warning) and every minute while running. When the app comes back,
  the calculator's clock catches up with the time away.
- A tap whose touch starts and ends between two frames is still sent to the
  calculator, held as long as a typed key is.
- The LCD's context menu (full speed, pixels or vectors, layout) should open
  with a long press, as egui turns one into a secondary click (not yet tried).

## Not done yet

- No on-screen keyboard for the desktop panel's command line (iPad landscape):
  a hardware keyboard works, the calculator's own keys always do.
- The plot window shows as a window inside the app, because iOS has only one.
- Ctrl+V (paste) needs a hardware keyboard, and eframe has no iOS clipboard.
- The icon (`HP48GX/Assets.xcassets/AppIcon.appiconset/icon-1024.png`) is cut
  from a screenshot of the app; replace it with designed art.
