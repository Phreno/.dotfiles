#!/bin/bash

installe_lazydocker(){
  curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
}


main(){
  installe_lazydocker
}


main

