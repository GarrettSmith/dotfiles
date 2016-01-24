# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew bundler rails vagrant web-search docker zsh-syntax-highlighting)

# User configuration

export ANDROID_HOME=~/Library/Android/sdk

export GOPATH=$HOME/.go
export GOROOT=/usr/local/opt/go/libexec

export PATH=$PATH:/bin
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:~/bin
export PATH=$PATH:~/.cabal/bin
export PATH=$PATH:~/.rvm/bin
export PATH=$PATH:~/.rvm/gems/ruby-head/bin
export PATH=$PATH:~/.rvm/gems/ruby-head@global/bin
export PATH=$PATH:~/.rvm/rubies/ruby-head/bin
export PATH=$PATH:$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$ANDROID_HOME/build-tools/21.1.2/
export PATH=$PATH:/Applications/Momentics.app/host_10_2_0_15/darwin/x86/usr/bin/
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/src/github.com/openshift/source-to-image/_output/local/bin/darwin/amd64

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR=vim

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ts="tig status"
alias connect_guest="curl 'https://1.1.1.1/login.html' -H 'Origin: https://1.1.1.1' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: en-CA ,en;q=0.8,en-US;q=0.6,ja;q=0.4' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.104 Safari/537.36' -H 'Content-Type: application/x-www-form-urlencoded' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: max-age=0' -H 'Referer: https://1.1.1.1/login.html?redirect=www.gstatic.com/generate_204' -H 'Connection: keep-alive' -H 'DNT: 1' --data 'buttonClicked=4&err_flag=0&err_msg=&info_flag=0&info_msg=&redirect_url=http%3A%2F%2Fwww.gstatic.com%2Fgenerate_204&network_name=Guest+Network&username=Garrett.Smith&password=ZMuJNSAb' --compressed --insecure"

 function browser(){
   open -a Google\ Chrome --args --disable-web-security
}

# Use vi key binding
#bindkey -v
# Use a timeout of 0.1 seconds
#export KEYTIMEOUT=1

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# nvm config
export NVM_DIR=~/.nvm
if ["$(uname)" == "Darwin"]; then
  source $(brew --prefix nvm)/nvm.sh
fi

# Make mkdir make dirs all the times
alias mkdir='mkdir -p'

# github-release token
export GITHUB_TOKEN=61f7e580f43000b0e6fb8f84710e2cb07344b78a

# Docker
export DOCKER_HOST=tcp://192.168.99.100:2376
export DOCKER_MACHINE_NAME=default
export DOCKER_TLS_VERIFY=1
export DOCKER_CERT_PATH=$HOME/.docker/machine/machines/default

alias dc="docker-compose"
alias dm="docker-machine"

# Setup fuck
eval "$(thefuck --alias)"
