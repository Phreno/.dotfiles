#!/bin/zsh

# Développeur ....: K3rn€l_P4n1K
# Nom ............: zsh
# Description ....: Configuration personnelle de zsh
# Version ........: 1.0
# Date ...........: Fri Jul 29 21:31:48 CEST 2022
# Dépendances ....: zsh
#

alias vim='lvim'
alias v='lvim'

########
# node #
########
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


##########
# sdkman #
##########
[[ -s "${HOME}/.sdkman/bin/sdkman-init.sh" ]] && source "${HOME}/.sdkman/bin/sdkman-init.sh"
ZSH_THEME="powerlevel10k/powerlevel10k"

PATH="$HOME/bin/nvim-linux64/bin/nvim:$HOME/bin:$HOME/.local/bin:$PATH"

