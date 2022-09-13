#################################################
# Perment l'edition de commande dans un éditeur #
#################################################

export EDITOR=lvim
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

