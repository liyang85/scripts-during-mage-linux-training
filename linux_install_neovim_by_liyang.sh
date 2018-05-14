#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		linux_install_neovim_by_liyang.sh
# Description:
# Date:			2018-05-14
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

cd
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage \
	--output-document nvim

chmod +x nvim
chown root:root nvim

mv nvim /usr/local/bin/
ln -s nvim /usr/local/bin/nvi

mkdir -p ~/.config/nvim
wget https://raw.githubusercontent.com/liyang85/dotfiles/master/init.vim \
	--output-document ~/.config/nvim/init.vim

# Install the vim-plug plugin manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim \
	--create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Python3 for CentOS
yum install epel-release -y
yum install python36 -y
ln -s python36 /usr/bin/python3

# Install pip and pip3
curl -O https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py

# Install NeoVim Python module
pip3 install --upgrade neovim

