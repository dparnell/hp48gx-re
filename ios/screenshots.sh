#!/bin/sh
# App Store screenshots from the simulators: 6.9-inch iPhone (1320x2868)
# and 13-inch iPad (2064x2752), portrait, into ios/screenshots/.
#
# Each shot installs the app afresh (so the calculator starts with an empty
# stack), sets a clean status bar, and launches it with a script in
# HP48_SCRIPT, which Debug builds run (the `demo-script` feature;
# crates/hp48-app, `parse_demo`): key names, `wait`/`wait:SECONDS`, and
# `type:TEXT` with `~` for a space.
#
# Usage: ios/screenshots.sh [IPHONE_NAME] [IPAD_NAME]
# ONLY="4-shifted-keys ..." takes just those shots.
set -eu
cd "$(dirname "$0")"
export DEVELOPER_DIR="${DEVELOPER_DIR:-/Applications/Xcode.app/Contents/Developer}"

IPHONE="${1:-iPhone 17 Pro Max}"
IPAD="${2:-iPad Pro 13-inch (M5)}"
BUNDLE=com.automagic-software.i48x2
OUT=screenshots
APP=../target/xcode/Build/Products/Debug-iphonesimulator/HP48GX.app

xcodebuild -project HP48GX.xcodeproj -scheme HP48GX -configuration Debug -sdk iphonesimulator \
    -derivedDataPath ../target/xcode CODE_SIGNING_ALLOWED=NO build -quiet

udid() {
    xcrun simctl list devices available | grep -F "    $1 (" | head -1 | grep -oE '[0-9A-F-]{36}'
}

# shoot DEVICE_UDID DIR NAME SECONDS SCRIPT
shoot() {
    dev=$1 dir=$2 name=$3 seconds=$4 script=$5
    case " ${ONLY:-$name} " in *" $name "*) ;; *) return 0 ;; esac
    xcrun simctl terminate "$dev" "$BUNDLE" 2>/dev/null || true
    xcrun simctl uninstall "$dev" "$BUNDLE" 2>/dev/null || true
    xcrun simctl install "$dev" "$APP"
    SIMCTL_CHILD_HP48_SCRIPT="$script" xcrun simctl launch "$dev" "$BUNDLE" >/dev/null
    sleep "$seconds"
    mkdir -p "$OUT/$dir"
    xcrun simctl io "$dev" screenshot --type=png "$OUT/$dir/$name.png" >/dev/null 2>&1
    echo "$OUT/$dir/$name.png"
}

# The scenes, the same on both devices.
# A line that ends in an operator runs when the operator key is pressed, as
# on the calculator, and ENTER after it would duplicate level 1; but not
# once `{` or `«` has put the command line in program-entry mode.
STACK="wait:2 type:355~113~/ wait type:(1,2)~(3,4)~* wait type:69~FACT Enter wait type:'X^2-5*X+6'~'X'~QUAD Enter wait:2"
PLOT="wait:2 type:RAD~'SIN(X)*EXP(-X/5)'~STEQ~0~20~XRNG~-1~1~YRNG~ERASE~DRAW Enter wait:6"
EQLIB="wait:2 type:EQNLIB Enter wait:2 Enter wait:2 Enter wait:2 D wait:3"
SHIFT="wait:2 type:«~→~X~'X^2+1'~» Enter wait type:{~1~2~3~}~10~* Enter wait type:#FFh~#10h~+ wait:2 LeftShift wait:2"

for pair in "$IPHONE|iphone-6.9" "$IPAD|ipad-13"; do
    name=${pair%|*} dir=${pair#*|}
    dev=$(udid "$name")
    [ -n "$dev" ] || { echo "no simulator named $name" >&2; exit 1; }
    # A simulator that this script boots, it shuts down again: each one
    # runs hundreds of processes.
    booted=no
    if ! xcrun simctl list devices booted | grep -qF "$dev"; then
        xcrun simctl boot "$dev"
        booted=yes
    fi
    xcrun simctl bootstatus "$dev" >/dev/null
    xcrun simctl status_bar "$dev" override --time 9:41 --batteryState charged --batteryLevel 100 \
        --wifiMode active --wifiBars 3 --cellularMode active --cellularBars 4 --dataNetwork wifi
    shoot "$dev" "$dir" 1-stack 30 "$STACK"
    shoot "$dev" "$dir" 2-plot 30 "$PLOT"
    shoot "$dev" "$dir" 3-equation-library 30 "$EQLIB"
    shoot "$dev" "$dir" 4-shifted-keys 30 "$SHIFT"
    xcrun simctl status_bar "$dev" clear
    if [ "$booted" = yes ]; then
        xcrun simctl shutdown "$dev"
    fi
done
