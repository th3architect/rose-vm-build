#!/bin/bash

HOME_DIR=$HOME
WORKSPACE_DIR="$HOME_DIR/workspace"
MININET_DIR="$HOME_DIR/mininet"
ROSE_SYS_DIR="$HOME_DIR/.rose"

# Update apt
sudo apt-get update

sudo apt autoremove -y

sudo apt-get install -y git-core

git config --global user.email "rose_project@rose_project.org"
git config --global user.name "The ROSE project"

echo -e "\n\n#####################################"
echo -e "\n-Installing bison"
# Install bison
sudo apt-get install -y bison


echo -e "\n\n#####################################"
echo -e "\n-Installing flex"
# Install flex
sudo apt-get install -y flex

# Install sublime evaluation version
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text


mkdir -p $WORKSPACE_DIR
mkdir -p $ROSE_SYS_DIR

cd $WORKSPACE_DIR

# Clone rose vm repo
git clone https://github.com/netgroup/rose-vm.git
cd rose-vm

# Clone all other repos
./scripts/update_all_body.sh clone_repos

# Initial setup of ROSE desktop environment
$ROSE_SYS_DIR/rose-vm-build/initial-setup/initial_desktop_setup.sh





