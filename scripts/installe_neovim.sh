#!/bin/bash
installe_neovim(){
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz -O /tmp/nvim
tar -xvf /tmp/nvim -C ~/bin/
}


main(){
installe_neovim
}

main

