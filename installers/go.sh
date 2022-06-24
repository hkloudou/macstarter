#!/usr/bin/env bash
source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../utils/utils.sh
# . ../utils/color.sh
###############################################################################
# Golang
###############################################################################

# cancel centos alias
can_google=1

force_mode=0

# sudo=""

# os="Linux"

install_version=""
GOBIN=/usr/local/go/bin/go

# proxy_url="https://goproxy.cn"

#######color code########
# red="31m"
# green="32m"
# yellow="33m"
# blue="36m"
# fuchsia="35m"

# color_echo() {
#     echo "\033[$1${@:2}\033[0m"
# }

#######get params#########
while [[ $# > 0 ]]; do
    case "$1" in
    -v | --version)
        install_version="$2"
        blue $0 ready install $install_version install...
        shift
        ;;
    -f)
        force_mode=1
        echo "$0 force mode"
        ;;
    *)
        # unknown option
        ;;
    esac
    shift # past argument or value
done
#############################

ip_is_connect() {
    ping -c2 -i0.3 -W1 $1 &>/dev/null
    if [ $? -eq 0 ]; then
        return 0
    else
        return 1
    fi
}

check_network() {
    ip_is_connect "golang.org"
    [[ ! $? -eq 0 ]] && can_google=0
}

# setup_proxy() {
#     if [[ $can_google == 0 && $(go env | grep proxy.golang.org) ]]; then
#         go env -w GO111MODULE=on
#         go env -w GOPROXY=$proxy_url,direct
#         color_echo $green "当前网络环境为国内环境, 成功设置goproxy代理!"
#     fi
# }

sys_arch() {
    if [ $(uname -s) != "Darwin" ]; then
        yellow $0 only macos support
        exit 1
    fi
    if [[ $(uname -m) == "arm64" ]]; then
        vdis="darwin-arm64"
    else
        vdis="darwin-amd64"
    fi
    [ $(id -u) != "0" ] && sudo="sudo"
}

install_go() {
    # env
    # echo $0
    if [[ -z $install_version ]]; then
        yellow $0 "get latest version"
        if [[ $can_google == 0 ]]; then
            install_version=$(curl -s https://golang.google.cn/dl/ | grep -w downloadBox | grep src | grep -oE '[0-9]+\.[0-9]+\.?[0-9]*' | head -n 1)
        else
            install_version=$(curl -s https://github.com/golang/go/tags | grep releases/tag | grep -v rc | grep -v beta | grep -oE '[0-9]+\.[0-9]+\.?[0-9]*' | head -n 1)
        fi
        [[ ${install_version: -1} == '.' ]] && install_version=${install_version%?}
        [[ -z $install_version ]] && {
            yellow $0 "error!"
            exit 1
        }
        yellow $0 latest $install_version
    fi
    if [[ $force_mode == 0 && $(command -v $GOBIN) ]]; then
        if [ $($GOBIN version | awk '{print $3}' | grep -Eo "[0-9.]+") == $install_version ]; then
            # green $0 already
            return
        fi
    fi
    file_name="go${install_version}.$vdis.pkg"
    local temp_path=$(mktemp -d)

    curl -H 'Cache-Control: no-cache' -L https://dl.google.com/go/$file_name -o $temp_path/$file_name
    if [[ $? != 0 ]]; then
        yellow $0 "download error, retrying!"
        rm -rf $temp_path
        curl -H 'Cache-Control: no-cache' -L https://dl.google.com/go/$file_name -o $temp_path/$file_name
        [[ $? != 0 ]] && {
            yellow $0 "download error!"
            rm -rf $temp_path
            exit 1
        }
    fi
    yellow ⚠️ $0 please input sudo pwd to accept license
    sudo installer -pkg $temp_path/$file_name -target /
    [[ $? != 0 ]] && {
        yellow $0 "install error!"
        rm -rf $temp_path/$file_name
        exit 1
    }
    rm -rf $temp_path/$file_name
}

# install_updater() {
#     if [[ $os == "Linux" ]]; then
#         if [[ ! -e /usr/local/bin/goupdate || -z $(cat /usr/local/bin/goupdate | grep '$@') ]]; then
#             echo 'source <(curl -L https://go-install.netlify.app/install.sh) $@' >/usr/local/bin/goupdate
#             chmod +x /usr/local/bin/goupdate
#         fi
#     elif [[ $os == "Darwin" ]]; then
#         if [[ ! -e $HOME/go/bin/goupdate || -z $(cat $HOME/go/bin/goupdate | grep '$@') ]]; then
#             cat >$HOME/go/bin/goupdate <<'EOF'
# #!/bin/zsh
# source <(curl -L https://go-install.netlify.app/install.sh) $@
# EOF
#             chmod +x $HOME/go/bin/goupdate
#         fi
#     fi
# }

main() {
    sys_arch
    check_network
    install_go
    write_bash_profile "export PATH=\$PATH:$HOME/go/bin"
    # setup_env
    # setup_proxy
    # install_updater
    git config --global url."git@code.aliyun.com:".insteadOf "https://code.aliyun.com/"
    go env -w GOPRIVATE=code.aliyun.com
    green ✅ $0 $install_version installed!
}

main
