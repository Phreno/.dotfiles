#!/bin/bash
installe_neovim(){
# wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz -O /tmp/nvim
# tar -xvf /tmp/nvim -C ~/bin/
sh <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/rolling/utils/installer/install-neovim-from-release)
}


main(){
installe_neovim
}

main

