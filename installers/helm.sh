#!/usr/bin/env bash
source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../utils/utils.sh
###############################################################################
# Helm
###############################################################################

DEST=${DEST:-"192.168.31.99"}
PORT=${PORT:-22}
VERSION=${VERSION:-"v1.24.1+k3s1"}
LOCAL=${LOCAL:-false}
# echo $PORT

#######get params#########
while [[ $# > 0 ]]; do
    case "$1" in
    -local)
        LOCAL=true
        blue $0 use local installed
        shift
        ;;
    *)
        # unknown option
        ;;
    esac
    shift # past argument or value
done
#############################

sys_arch() {
    if [[ $(uname -m) == "x86_64" ]]; then
        vdis="amd64"
    elif [[ $(uname -m) == "arm64" ]]; then
        vdis="arm64"
    else
        yellow $0 not support arch $(uname -m)
        exit 1
    fi
}

main() {
    sys_arch
    blue main
}

copyfile() {
    blue copyfile to remote
    # scp $0 root@$DEST:/home/helm.sh
}
echo $LOCAL
if $LOCAL; then
    main
else
    copyfile
fi

# ------------
# run on dest
# ------------
# export https_proxy=http://192.168.31.154:7890 http_proxy=http://192.168.31.154:7890 all_proxy=socks5://192.168.31.154:7890
# mkdir -p /var/lib/rancher/k3s/agent/images/
# curl -sSL https://github.com/k3s-io/k3s/releases/download/v1.24.1%2Bk3s1/k3s>/usr/local/bin/k3s && chmod u+x /usr/local/bin/k3s
# mkdir -p /var/lib/rancher/k3s/agent/images/ && cd /var/lib/rancher/k3s/agent/images/ && curl -SL https://github.com/k3s-io/k3s/releases/download/v1.24.1%2Bk3s1/k3s-airgap-images-amd64.tar.gz | tar -xz
# ///usr/local/bin/k3s
# INSTALL_K3S_SKIP_DOWNLOAD=true

# curl -sSL https://get.k3s.io | INSTALL_K3S_SKIP_DOWNLOAD=true INSTALL_K3S_EXEC='server --tls-san 192.168.31.99' sh -

# ------------
# run on local
# ------------
# chmod go-r ~/.kube/config
# curl -SL "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/darwin/amd64/kubectl" > /usr/local/bin/kubectl && chmod u+x /usr/local/bin/kubectl
