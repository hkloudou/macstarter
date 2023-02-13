#!/usr/bin/env bash
source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../utils/utils.sh
###############################################################################
# Env
###############################################################################
echo "\033[32mConfig env...\033[0m"
write_bash_profile "alias p=\"export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890\""

write_bash_profile "export NO_PROXY=localhost,127.0.0.1,::1"