#!/bin/sh
set -e
SHELL_FOLDER=$(cd "$(dirname "$0")";pwd)

# source ~/proxy.sh # use bash please
if [ ! -f "/usr/local/bin/helm" ]; then
    echo "getting helm"
    curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
fi

helmfile_install(){
    bin_url=https://github.com/roboll/helmfile/releases/download/v0.135.0/helmfile_linux_amd64
    [ ! -f helmfile_linux_amd64 ] && wget $bin_url -O helmfile_linux_amd64 && chmod +x helmfile_linux_amd64
    sudo mv helmfile_linux_amd64 /usr/local/bin/helmfile # precondition: if [ ! -f "/usr/local/bin/helmfile" ]; then
}

# kustomize_install(){
#     curl -s "https://raw.githubusercontent.com/\
#     kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash
#     sudo mv kustomize /usr/local/bin/kustomize
# }

if [ ! -f "/usr/local/bin/helmfile" ]; then
    echo "getting helmfile"
    helmfile_install
fi

# if [ ! -f "/usr/local/bin/kustomize" ]; then
#     echo "getting kustomize"
#     kustomize_install
# fi

helm plugin install https://github.com/databus23/helm-diff