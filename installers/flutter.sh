#!/usr/bin/env bash

###############################################################################
# Flutter
###############################################################################
#######color code########
red="31m"
green="32m"
yellow="33m"
blue="36m"
fuchsia="35m"

color_echo() {
    echo "\033[$1${@:2}\033[0m"
}
if [ ! -d "$HOME/Developments/flutter" ]; then
    echo "⚠️$(color_echo ${green} installers/flutter installing...)"
    mkdir -p ~/Developments
    mkdir -p ~/Developments/flutter
    curl -SL https://storage.flutter-io.cn/flutter_infra_release/releases/stable/macos/flutter_macos_3.0.2-stable.zip | bsdtar --strip-components 1 -xf - -C ~/Developments/flutter
fi
echo "✅$(. ../utils/echo_green installers/flutter installed)\n"