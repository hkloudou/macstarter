#!/usr/bin/env bash
source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../utils/utils.sh
###############################################################################
# Env
###############################################################################
echo "\033[32mConfig env...\033[0m"
IGNOE="192.168.0.0/16 10.0.0.0/8 172.16.0.0/12 127.0.0.1 localhost '*.local' '*.local.' '*.crashlytics.com' '*.gitlab.me' 'gitlab.me' '*.apiatm.com'"


write_bash_profile "export PATH=\$PATH:/Users/undefined/Developments/flutter/bin"
write_bash_profile "export PATH=\$PATH:/Users/undefined/Library/Python/3.9/bin"
write_bash_profile "export PATH=\$PATH:/Users/undefined/go/bin"
write_bash_profile "export PATH=\$PATH:/opt/homebrew/bin"
 

write_bash_profile "alias p=\"export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890\""

clean_start_bash_profile "alias pset="
clean_start_bash_profile "alias p2="
write_bash_profile "alias pset=\"networksetup -setwebproxy WI-FI 192.168.3.26 7890 && networksetup -setsecurewebproxy WI-FI 192.168.3.26 7890 && networksetup -setsocksfirewallproxy WI-FI 192.168.3.26 7890 && networksetup -setproxybypassdomains WI-FI $IGNOE\""
write_bash_profile "alias psys=\"networksetup -setwebproxystate WI-FI off && networksetup -setsecurewebproxystate WI-FI off && networksetup -setsocksfirewallproxystate WI-FI off\""
write_bash_profile "alias p2=\"export https_proxy=http://192.168.3.26:7890 http_proxy=http://192.168.3.26:7890 all_proxy=socks5://192.168.3.26:7890\""


clean_start_bash_profile "export NO_PROXY="
write_bash_profile "export NO_PROXY=localhost,127.0.0.1,::1,*.local,*.local."

clean_start_bash_profile "export cleanS="
clean_start_bash_profile "alias cleanS="
write_bash_profile "alias cleanS='rm -rf ~/Library/Caches/go-build ~/Library/Caches/gopls'"
clean_start_bash_profile "alias cleanFlutter="
write_bash_profile "alias cleanFlutter='find ~/Developments \( -path ~/Developments/flutter -prune \) -o \( -type f -name pubspec.yaml -execdir flutter clean \; \)'"

clean_start_bash_profile "alias cleanNpm="
write_bash_profile "alias cleanNpm='find ~/Developments -name "node_modules" -type d -exec rm -rf {} \;'"

clean_start_bash_profile "alias tmignore="
write_bash_profile "alias tmignore='bash ~/Developments/hkloudou/macstarter/system/time-machine.sh'"

clean_start_bash_profile "alias tmcompare="
write_bash_profile "alias tmcompare=\"tmutil compare | grep '^[\!+]' | sort -h -k 2\""

# networksetup -setproxybypassdomains WI-FI $IGNOE
# clean_bash_profile_line "export NO_PROXY="
# write_bash_profile "export NO_PROXY=2.2.2.2,localhost,127.0.0.1,::1,*.local"