#!/usr/bin/env bash
source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../utils/utils.sh
###############################################################################
# Flutter
###############################################################################
#######color code########
if [ ! -d "$HOME/Developments/flutter" ]; then
    echo ⚠️ "$(color_echo ${green} installers/flutter installing...)"
    green $ installing...
    mkdir -p ~/Developments
    mkdir -p ~/Developments/flutter
    curl -SL https://storage.flutter-io.cn/flutter_infra_release/releases/stable/macos/flutter_macos_3.0.2-stable.zip | bsdtar --strip-components 1 -xf - -C ~/Developments/flutter
fi

# export PATH=\$PATH:`echo ~`/Developments/flutter/bin
write_bash_profile "export PATH=\$PATH:$HOME/Developments/flutter/bin"
green ✅ $0 installed
