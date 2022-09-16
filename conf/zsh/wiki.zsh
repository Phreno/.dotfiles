#!/bin/bash
alias dotfiles.wiki_reload_daemon='systemctl --user daemon-reload'
alias dotfiles.wiki_status='systemctl --user status neuron.service'
alias dotfiles.wiki_enable='systemctl --user enable neuron.service'
alias dotfiles.wiki_stop='systemctl --user stop neuron.service'
alias dotfiles.wiki_start='systemctl --user start neuron.service'
alias dotfiles.wiki_restart='wiki.stop; wiki.start'
alias dotfiles.wiki_files='find -L ~/neuron -type f -name "*md"'
alias dotfiles.wiki_watch='find -L ~/neuron -type f -name "*md" | entr -s "systemctl --user stop neuron.service;systemctl --user start neuron.service"'

alias dw?='dotfiles.wiki_status'
alias dwk='dotfiles.wiki_stop'
alias dws='dotfiles.wiki_start'
alias dwr='dotfiles.wiki_restart'
alias dww='dotfiles.wiki_watch'

