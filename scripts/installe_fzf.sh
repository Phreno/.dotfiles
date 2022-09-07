#!/bin/bash
installe_fzf(){
it clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
hmod u+x ~/.fzf/install
.fzf/install
}
main(){
installe_fzf
}
main

