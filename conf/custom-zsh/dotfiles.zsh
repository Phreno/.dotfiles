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
alias vzc='v $DOTFILES_ZSH/chrysalis.zsh'
alias vzd='v $DOTFILES_ZSH/dotfiles.zsh'
alias vze='v $DOTFILES_ZSH/edit-command-line.zsh'
alias vzf='v $DOTFILES_ZSH/fuck.zsh'
alias vzg='v $DOTFILES_ZSH/git.zsh'
alias vzgs='v $DOTFILES_ZSH/gnome.zsh'
alias vzj='v $DOTFILES_ZSH/java.zsh'
alias vzl='v $DOTFILES_ZSH/lazy.zsh'
alias vzt='v $DOTFILES_ZSH/tmux-aliases.zsh'
alias vzts='v $DOTFILES_ZSH/tspreed.zsh'
alias vzv='v $DOTFILES_ZSH/00-global.zsh'
alias vzz='v $DOTFILES_ZSH/zsh.zsh'
# }}}

alias vc='v $DOTFILES/install.conf.yaml'
alias v.lc='v $DOTFILES_CONF/lazycli.yaml'
alias c.='cd $DOTFILES'

alias al='c "cat $DOTFILES_ZSH/* | egrep ^alias | sort"'
alias dot='env | egrep ^DOTFILES | column -t -s ='
alias dot.c='c "env | egrep ^DOTFILES | column -t -s ="'
alias dot.f='dot | F'

watch_wiki(){
  cd ~/.dotfiles
  npm run wiki:watch
}
