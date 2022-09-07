#!/bin/bash
installe_p10k(){
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
}

main(){
stalle_p10k
}
main

