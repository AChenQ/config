# on-my-zsh
# Path to your oh-my-zsh installation.
export ZSH="/Users/zhen.chen/.oh-my-zsh"
ZSH_THEME="zhen-cloud"
ZSH_PYENV_QUIET=true

plugins=(git history-substring-search autojump zsh-autosuggestions web-search pyenv emoji)

source $ZSH/oh-my-zsh.sh

alias theme='source ~/.oh-my-zsh/custom/themes/zhen-cloud.zsh-theme'

# remote machine connect
alias amax='ssh zhen@192.168.10.223'
alias ali='ssh zhen.chen@j.graviti.cn'
alias s3='cd /Users/zhen.chen/zhen_code/.s3; ssh -i "us-algorithm-service.pem" ubuntu@50.18.65.176'
alias azure='ssh ubuntu@52.130.255.19'

# local machine config
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias oss="~/zhen_code/tool/ossutilmac64"

# pytest
alias pytest-dev='pytest --accesskey Accesskey-ec80eaaf8d3e3fad4aa0e2aea90e60f8 --url https://gas.dev.graviti.cn/'
alias pytest-fat='pytest --accesskey Accesskey-aaba82a11da39088279333d0780817e3 --url https://gas.fat.graviti.cn/'
alias pytest-uat='pytest --accesskey Accesskey-56762713d06de70459216974c06c70c0 --url https://gas.uat.graviti.cn/'
alias pytest-prod='pytest --accesskey Accesskey-300e653998b12912d4fb8783173f1a35 --url https://gas.graviti.cn/'
alias pytest-none='pytest --accesskey Accesskey-d097d58bdb2cfb47a7b689407f53af43 --url https://gas.graviti.cn/'
alias pytest-com-fat='pytest --accesskey ACCESSKEY-7163c37a3b3a32f22ab3da256fc07d39 --url https://gas.fat.graviti.com/'

# gas config
#eval "$(_GAS_COMPLETE=source_zsh gas)"
#export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

# arclint
export PATH="$PATH:/Users/zhen.chen/.arcanist/bin/"

# The next line updates PATH for the Google Cloud SDK.
#if [ -f '/Users/zhen.chen/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/zhen.chen/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
#if [ -f '/Users/zhen.chen/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/zhen.chen/google-cloud-sdk/completion.zsh.inc'; fi

# homebrew config
export HOMEBREW_NO_AUTO_UPDATE=true

# the fuck
eval $(thefuck --alias)
export PATH="/usr/local/opt/openjdk/bin:$PATH"
