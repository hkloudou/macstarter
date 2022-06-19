#!/usr/bin/env bash

###############################################################################
# Xcode
###############################################################################

# Install Xcode Command Line Tools
echo "\033[33m please install xcode⚠️ \033[0m"
if ! $(xcode-select -p &>/dev/null); then
    echo "⚠️\033[33m please install xcode \033[0m"
    # Wait until the Xcode Command Line Tools are installed
    until $(xcode-select -p &>/dev/null); do
        sleep 5
    done
fi
echo "✅\033[32m xocde installed\033[0m"

# Accept the Xcode/iOS license agreement
if ! $(xcodebuild -license status); then
    echo "⚠️\033[33m please input sudo pwd to accept license \033[0m"
    sudo xcodebuild -license accept
fi

# Install additional required components
# # /Applications/Xcode.app/Contents/MacOS/Xcode -installComponents
# for pkg in /Applications/Xcode.app/Contents/Resources/Packages/*.pkg; do
#     sudo installer -pkg "$pkg" -target /
# done
