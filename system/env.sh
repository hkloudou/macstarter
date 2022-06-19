#!/usr/bin/env bash

###############################################################################
# Env
###############################################################################
echo "\033[32mConfig env...\033[0m"

# golang flutter brew
for pt in ~/.zprofile ~/.profile ~/.bash_profile; 
do  
test -r $pt && echo "
export PATH=\$PATH:`echo ~`/go/bin
export PATH=\$PATH:`echo ~`/Developments/flutter/bin
export HOMEBREW_BREW_GIT_REMOTE=\"https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git\"
export HOMEBREW_CORE_GIT_REMOTE=\"https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git\"

alias p=\"export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890\"
" > $pt;
done