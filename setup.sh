#!/bin/bash

apt update

# zsh config
apt install zsh
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir ~/zhen_code
git clone https://github.com/AChenQ/config.git ~/zhen_code/config
ln -s ~/zhen_code/config/shell/zhen-cloud.zsh-theme ~/.oh-my-zsh/custom/themes/zhen-cloud.zsh-theme
ln -s ~/zhen_code/config/shell/.zshrc ~/.zshrc

# zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
apt install autojump

# nvim config
add-apt-repository ppa:jonathonf/vim
add-apt-repository ppa:neovim-ppa/unstable
apt install vim
apt install neovim
mkdir ~/.config
ln -s ~/zhen_code/config/nvim ~/.config/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

apt install npm
n stable
npm install -g n
npm install -g neovim

# pyenv for python version control
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | zsh
apt install build-essential zlib1g-dev patch ruby gem ruby-dev libffi-dev tmux
gem install neovim
pyenv install 3.9.5
pyenv global 3.9.5
pip install neovim

git config --global user.name "AChenQ"
git config --global user.email "cz2350276852@163.com"
git config --global core.editor "nvim"
