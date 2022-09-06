#!/bin/bash
installe_neovim(){
  #wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -O ~/bin/nvim
  wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz -O /tmp/nvim
  tar -xvf /tmp/nvim -C ~/bin/
  ln -s ~/bin/nvim-linux64/bin/nvim ~/bin/nvim
}

main(){
  installe_neovim
}

main
