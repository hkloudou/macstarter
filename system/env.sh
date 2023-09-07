#!/usr/bin/env bash
source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../utils/utils.sh
###############################################################################
# Env
###############################################################################
echo "\033[32mConfig env...\033[0m"
IGNOE="192.168.0.0/16 10.0.0.0/8 172.16.0.0/12 127.0.0.1 localhost *.local *.local. '*.crashlytics.com' '*.gitlab.me' gitlab.me"

write_bash_profile "alias p=\"export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890\""
# write_bash_profile "alias pset=\"networksetup -setwebproxy WI-FI 192.168.3.11 7890 && networksetup -setsecurewebproxy WI-FI 192.168.3.11 7890 && networksetup -setsocksfirewallproxy WI-FI 192.168.3.11 7890 && networksetup -setproxybypassdomains WI-FI $IGNOE\""
write_bash_profile "alias psys=\"networksetup -setwebproxystate WI-FI off && networksetup -setsecurewebproxystate WI-FI off && networksetup -setsocksfirewallproxystate WI-FI off\""
write_bash_profile "alias p2=\"export https_proxy=http://192.168.3.11:7890 http_proxy=http://192.168.3.11:7890 all_proxy=socks5://192.168.3.11:7890\""
write_bash_profile "export NO_PROXY=localhost,127.0.0.1,::1,*.local"

networksetup -setproxybypassdomains WI-FI $IGNOE
# clean_bash_profile_line "export NO_PROXY="
# write_bash_profile "export NO_PROXY=2.2.2.2,localhost,127.0.0.1,::1,*.local"