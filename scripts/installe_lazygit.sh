#!/bin/bash
installe_lazygit(){
AZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-35.]+')
url -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
udo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
}

main(){
stalle_lazygit
}

main

