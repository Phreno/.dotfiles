#!/bin/bash

installe_atuin(){
 not run this as root, root will be asked for if required
 <(curl https://raw.githubusercontent.com/ellie/atuin/main/install.sh)
 'eval "$(atuin init zsh)"' >> ~/.zshrc
}

main(){
stalle_atuin
}

main

