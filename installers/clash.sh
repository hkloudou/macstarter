#!/usr/bin/env bash
source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../utils/utils.sh
###############################################################################
# Clash
###############################################################################


write_bash_profile "alias pset=\"networksetup -setwebproxy WI-FI 192.168.31.99 7890 && networksetup -setsecurewebproxy WI-FI 192.168.31.99 7890 && networksetup -setsocksfirewallproxy WI-FI 192.168.31.99 7890 && networksetup -setproxybypassdomains WI-FI 192.168.0.0/16 10.0.0.0/8 172.16.0.0/12 127.0.0.1 localhost '*.local' '*.crashlytics.com' '*.gitlab.me' gitlab.me\""
write_bash_profile "alias psys=\"networksetup -setwebproxystate WI-FI off && networksetup -setsecurewebproxystate WI-FI off && networksetup -setsocksfirewallproxystate WI-FI off\""
write_bash_profile "alias p2=\"export https_proxy=http://192.168.31.99:7890 http_proxy=http://192.168.31.99:7890 all_proxy=socks5://192.168.31.99:7890\""
green ✅ $0 installed