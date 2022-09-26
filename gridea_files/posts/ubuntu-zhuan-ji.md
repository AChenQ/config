---
title: 'ubuntu 装机'
date: 2022-09-23 09:14:45
tags: [linux]
published: true
hideInList: false
feature: 
isTop: false
---

今天整了一下Ubuntu，中间所有命令整理在下面以便下次使用


1. 安装zsh & ohmyzsh & 导入配置 & 安装ohmyzsh插件
```
apt update
apt install zsh
chsh -s /bin/zsh  # 默认zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir ~/zhen_code
git clone https://github.com/AChenQ/config.git ~/zhen_code/config
ln -s ~/zhen_code/config/shell/zhen-cloud.zsh-theme ~/.oh-my-zsh/custom/themes/zhen-cloud.zsh-theme
ln -s ~/zhen_code/config/shell/.zshrc ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
apt install autojump
```

2. 安装neovim & 导入配置
```
add-apt-repository ppa:jonathonf/vim
add-apt-repository ppa:neovim-ppa/unstable
apt install vim
apt install neovim
apt install npm
n stable
npm install -g n
npm install -g neovim

mkdir ~/.config
ln -s ~/zhen_code/config/nvim ~/.config/nvim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

3. 安装pyenv(python环境管理), tmux(linux Session窗口管理)
```
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | zsh
apt install build-essential zlib1g-dev patch ruby gem ruby-dev libffi-dev tmux
gem install neovim
pyenv install 3.9.5
pyenv global 3.9.5
pip install neovim
```

4. git全局配置
```
git config --global user.name "zhenchen"
git config --global user.email "cz2350276852@163.com"
git config --global core.editor "nvim"
```
