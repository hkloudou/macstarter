#!/usr/bin/env bash
source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../utils/utils.sh
###############################################################################
# Xcode
###############################################################################

install_xcode() {
    # Install Xcode Command Line Tools
    if [ ! -d "/Applications/Xcode.app" ] || [ ! $(xcode-select -p &>/dev/null) ]; then
        yellow ⚠️ $0 please install
        local temp_path=$(mktemp -d)
        echo temp_path:$temp_path
        curl -SL https://download.developer.apple.com/Developer_Tools/Xcode_13.2.1/Xcode_13.2.1.xip -o $temp_path/Xcode_13.2.1.xip
        # https://download.developer.apple.com/Developer_Tools/Xcode_13.2.1/Xcode_13.2.1.xip
        [[ $? != 0 ]] && {
            yellow $0 "download error!"
            rm -rf $temp_path
            exit 1
        }
        echo $temp_path
        hdiutil attach $temp_path/Xcode_13.2.1.xip
        # https://download.developer.apple.com/Developer_Tools/Xcode_13.2.1/Xcode_13.2.1.xip
        # https://download.developer.apple.com/Developer_Tools/Xcode_13.2/Xcode_13.2.xip
        #
        # Wait until the Xcode Command Line Tools are installed
        until [ -d "/Applications/Xcode.app" ] && [ $(xcode-select -p &>/dev/null) ]; do
            sleep 5
        done
    fi
}
install_xcode
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
