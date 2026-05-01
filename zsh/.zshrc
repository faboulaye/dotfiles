export ZSH="$HOME/.oh-my-zsh"

# Disable OMZ theme — prompt is handled by Starship
ZSH_THEME=""

# pyenv — must be in PATH before OMZ loads, but init runs after (see below)
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

plugins=(starship git terraform helm kubectl aws nvm)

source $ZSH/oh-my-zsh.sh

# pyenv shell integration — after OMZ to avoid double-init with the pyenv plugin
eval "$(pyenv init - zsh)"

# Task autocompletion
eval "$(task --completion zsh)"

export EDITOR='vim'

# Terraform aliases (kubectl aliases provided by the OMZ kubectl plugin)
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfd='terraform destroy'

# Helm aliases
alias h='helm'
alias hu='helm upgrade'
alias hls='helm list'
