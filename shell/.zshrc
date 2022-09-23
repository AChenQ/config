# on-my-zsh
# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"
ZSH_THEME="zhen-cloud"
ZSH_PYENV_QUIET=true

plugins=(git history-substring-search autojump zsh-autosuggestions web-search pyenv emoji)

source $ZSH/oh-my-zsh.sh

alias theme='source ~/.oh-my-zsh/custom/themes/zhen-cloud.zsh-theme'

# local machine config
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
#alias oss="~/zhen_code/tool/ossutilmac64"

# pytest
alias pytest-fat='pytest --accesskey Accesskey-******************************** --url https://******************/'

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
#export HOMEBREW_NO_AUTO_UPDATE=true

# the fuck
#eval $(thefuck --alias)
#export PATH="/usr/local/opt/openjdk/bin:$PATH"
