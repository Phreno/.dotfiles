#!/bin/bash
installe_lunar_vim(){
  bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
}
main(){
installe_lunar_vim
}
main
