#!/usr/bin/env bash
source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../utils/utils.sh
###############################################################################
# Xcode
###############################################################################

# Install Xcode Command Line Tools
if ! $(xcode-select -p &>/dev/null); then
    yellow ⚠️ $0 please install
    # Wait until the Xcode Command Line Tools are installed
    until $(xcode-select -p &>/dev/null); do
        sleep 5
    done
fi
green ✅ $0 installed
# Accept the Xcode/iOS license agreement
if ! $(xcodebuild -license status); then
    yellow ⚠️ $0 please input sudo pwd to accept license
    sudo xcodebuild -license accept
fi

# Install additional required components
# # /Applications/Xcode.app/Contents/MacOS/Xcode -installComponents
# for pkg in /Applications/Xcode.app/Contents/Resources/Packages/*.pkg; do
#     sudo installer -pkg "$pkg" -target /
# done
