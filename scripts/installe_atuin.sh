installe_atuin(){
    # do not run this as root, root will be asked for if required
    bash <(curl https://raw.githubusercontent.com/ellie/atuin/main/install.sh)
    echo 'eval "$(atuin init zsh)"' >> ~/.zshrc
}

main(){
  installe_atuin
}

main
