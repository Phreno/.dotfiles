#!/bin/bash
alias dotfiles.wiki_reload_daemon='systemctl --user daemon-reload'
alias dotfiles.wiki_status='systemctl --user status neuron.service'
alias dotfiles.wiki_enable='systemctl --user enable neuron.service'
alias dotfiles.wiki_stop='systemctl --user stop neuron.service'
alias dotfiles.wiki_start='systemctl --user start neuron.service'
alias dotfiles.wiki_restart='wiki.stop; wiki.start'
alias dotfiles.wiki_files='find -L ~/neuron -type f -name "*md"'
alias dotfiles.wiki_watch='find -L ~/neuron -type f -name "*md" | entr -s "systemctl --user stop neuron.service;systemctl --user start neuron.service"'

alias dwq='dotfiles.wiki_status'
alias dwk='dotfiles.wiki_stop'
alias dws='dotfiles.wiki_start'
alias dwr='dotfiles.wiki_restart'
alias dww='dotfiles.wiki_watch'

##################################################################################
# Usage: neuron [--version] [-d PATH] [-o PATH] COMMAND                          #
#   Neuron, future-proof Zettelkasten app <https://neuron.zettel.page/>          #
#                                                                                #
# Available options:                                                             #
#   --version                Show version                                        #
#   -d PATH                  Run as if neuron was started in PATH instead of the #
#                            current working directory                           #
#   -o PATH                  Custom path to generate static site in              #
#                                                                                #
# Available commands:                                                            #
#   new                      Create a new zettel                                 #
#   open                     Open the local static site                          #
#   search                   Search zettels and print their path                 #
##################################################################################
alias n='neuron -d $DOTFILES_NEURON'
alias N='neuron -d $DOTFILES_NEURON_SECRET'


##################################################################################
# Usage: neuron gen [(-s|--serve [HOST]:PORT) | -S] [-w|--watch] [--pretty-urls] #
#   Generate and serve the static site                                           #
#                                                                                #
# Available options:                                                             #
#   -s,--serve [HOST]:PORT   Run a HTTP server on the generated directory        #
#   -S                       Like `-s 127.0.0.1:8080`                            #
#   -w,--watch               Watch for changes and regenerate                    #
#   --pretty-urls            Drop the .html at the end of Zettel URLs            #
#   -h,--help                Show this help text                                 #
##################################################################################
alias ngw='n gen -w'
alias Ngw='n gen -w'

####################################################################################
# Usage: neuron new [TITLEID] [-e|--edit] [--date DATE/TIME]                       #
#   Create a new zettel                                                            #
#                                                                                  #
# Available options:                                                               #
#   TITLEID                  Custom (title) ID to use; otherwise random ID will be #
#                            generated                                             #
#   -e,--edit                Open the newly-created zettel in $EDITOR              #
####################################################################################
alias nne='n new -e'
alias Nne='N new -e'

##################################################################
# Usage: neuron search [-a|--full-text] [-e|--edit]              #
#   Search zettels and print their path                          #
#                                                                #
# Available options:                                             #
#   -a,--full-text           Full-text search                    #
#   -e,--edit                Open the matching zettel in $EDITOR #
##################################################################
alias nsa='n search -a'
alias Nsa='N search -a'
alias nse='n search -e'
alias Nse='N search -e'
