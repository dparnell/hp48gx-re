#!/bin/sh
# Xcode's "Build Rust" phase: builds crates/hp48-ios as a static library for
# the platform being built, where the target's LIBRARY_SEARCH_PATHS look.
set -eu
export PATH="$HOME/.cargo/bin:/opt/homebrew/bin:/usr/local/bin:$PATH"
case "$PLATFORM_NAME" in
    iphoneos) target=aarch64-apple-ios ;;
    iphonesimulator) target=aarch64-apple-ios-sim ;;
    *) echo "error: unsupported platform $PLATFORM_NAME" >&2; exit 1 ;;
esac
# Xcode's settings for the C compiler would otherwise reach build scripts.
unset SDKROOT LIBRARY_PATH
cd "$PROJECT_DIR/.."
rustup target add "$target" >/dev/null 2>&1 || true
exec cargo build --release -p hp48-ios --target "$target"
