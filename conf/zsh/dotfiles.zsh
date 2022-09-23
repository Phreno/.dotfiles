##########
# Config #
##########
alias rc='$DOTFILES/install'
alias sz='source ~/.zshrc'

alias vA='v $DOTFILES_ALACRITTY/alacritty.yml'
alias va='v $DOTFILES_AWESOME/rc.lua'
alias vp='v $DOTFILES_PICOM/picom.conf'
alias vn='v $DOTFILES_CONF/lunarvim.lua'
alias vz='v ~/.zshrc'
# {{{
#######
# zsh #
#######
alias vzc='v $DOTFILES_ZSH/chrysalis.zsh; sz'
alias vzd='v $DOTFILES_ZSH/dotfiles.zsh; sz'
alias vze='v $DOTFILES_ZSH/edit-command-line.zsh; sz'
alias vzf='v $DOTFILES_ZSH/fuck.zsh; sz'
alias vzg='v $DOTFILES_ZSH/git.zsh; sz'
alias vzgs='v $DOTFILES_ZSH/gnome.zsh; sz'
alias vzj='v $DOTFILES_ZSH/java.zsh; sz'
alias vzl='v $DOTFILES_ZSH/lazy.zsh; sz'
alias vzt='v $DOTFILES_ZSH/tmux-aliases.zsh; sz'
alias vzts='v $DOTFILES_ZSH/tspreed.zsh; sz'
alias vzv='v $DOTFILES_ZSH/00-global.zsh; sz'
alias vzz='v $DOTFILES_ZSH/zsh.zsh; sz'
alias vzn='v $DOTFILES_ZSH/wiki.zsh; sz'
# }}}

alias vc='v $DOTFILES/install.conf.yaml'
alias v.lc='v $DOTFILES_CONF/lazycli.yaml'
alias c.='cd $DOTFILES'

alias fold='find -type d | F'
alias al='alias | F'
alias dot='env | egrep ^DOTFILES | column -t -s = | F'

