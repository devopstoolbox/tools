#!/usr/bin/env bash

set -e
export LANG=C

# Parameters:
SUPPORTED_CENTOS_VERSION="8"
PREREQ_PACKAGES=(
    @development
    ansible
    vim
    git-core
    tmux
    mc
    bash-completion
    zsh
    curl
    wget
    ed
    sudo
    yamllint
    python3-devel
    @container-tools
    docker
    libvirt-devel
)


# Check CentOS version
CENTOS_VERSION=$(rpm --eval '%{centos_ver}')
echo "*** Found CentOS version ${CENTOS_VERSION} ***"

if [[ "${CENTOS_VERSION}" != "${SUPPORTED_CENTOS_VERSION}" ]]; then
    echo "=== Found CentOS ${CENTOS_VERSION}. Exiting: requires CentOS ${SUPPORTED_CENTOS_VERSION} ==="
fi

# Install DNF packages
sudo dnf install -y epel-release
sudo dnf install -y "${PREREQ_PACKAGES[@]}"

# Install pip packages
pip3 install --upgrade --user -r requirements.txt

# Install collections
ansible-galaxy collection install -f -r requirements.yml
