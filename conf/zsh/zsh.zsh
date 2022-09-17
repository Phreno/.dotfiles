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


NVIM=$HOME/bin/nvim-linux64/bin/nvim
DOT_BIN=$HOME/bin
VENDOR_BIN=$DOT_BIN/vendor
SECRET_BIN=$DOT_BIN/secret
LOCAL_BIN=$HOME/.local/bin

PATH="$NVIM:$DOT_BIN:$VENDOR_BIN:$SECRET_BIN:$LOCAL_BIN:$PATH"

