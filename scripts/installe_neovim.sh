installe_neovim(){
  wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage -O ~/nvim
  chmod +x ~/bin/nvim
}

main(){
  installe_neovim
}

main
