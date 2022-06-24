#!/usr/bin/env bash
source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../utils/utils.sh
###############################################################################
# ClashX
###############################################################################
hdiutil detach /Volumes/ClashX &>/dev/null
if [ ! -d "/Applications/ClashX.app/" ]; then
    hdiutil attach "https://github.com/yichengchen/clashX/releases/download/1.91.1/ClashX.dmg" &&
        cp -rf /Volumes/ClashX/ClashX.app /Applications/ClashX.app &&
        xattr -c /Applications/ClashX.app &&
        hdiutil detach /Volumes/ClashX
fi
write_bash_profile "alias p=\"export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890\""
green ✅ $0 installed
# read -n 1 -s -r -p "Press any key to continue"