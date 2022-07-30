#!/bin/bash

# Développeur ....: K3rn€l_P4n1K
# Nom ............: common-setup
# Description ....: Installe tous ce qui peut l'être sans être dépendant de la distribution
# Version ........: 1.0
# Date ...........: Sat Jul 30 00:25:57 CEST 2022
# Dépendances ....: vim-awesome git curl

# Fonctionnalité .: Installation de repôt github et de pluggin vim
# Intention ......: Factoriser du code
# Remarque .......: N/A


# ===========================
# Copyright 2022 K3rn€l P4n1k
# ===========================
#
# This file is part of phreno-dot-files.
#
# phreno-dot-files is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# phreno-dot-files is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with phreno-dot-files. If not, see <http://www.gnu.org/licenses/>.

# ------------------
# VARIABLES GLOBALES
# ------------------

# Chemin du script
SCRIPT="${0}"

# Nom du script
SCRIPT_NAME="$( basename ${0} )"

# Dossier du script
SCRIPT_DIR="$( dirname ${0} )"

# Fichier de log des erreurs
LOGERR="${SCRIPT_NAME}.err.log"

# ---------
# FONCTIONS
# ---------

# Exécutée lors de la sortie du script (CTRL+C par exemple)
onExit(){
    displayLog
}
trap onExit EXIT


# Exécutée lors d'une erreur
onError(){
    echo ".. ERR: dans le script ${SCRIPT_NAME}" >> ${LOGERR}
}
trap onError ERR

# Affiche les logs le cas échéant
displayLog(){
    if [ -s "${LOGERR}" ]; then
        echo ".. ERR: Sortie du script ${SCRIPT_NAME}"
        cat "${LOGERR}"
    fi
    rm -f "${LOGERR}"
}

# Vérifie si les fichiers en entrées sont des fichiers valide
checkFile(){
    file="${1}"
    if [ ! -s "${file}" ]; then
        echo "${file} n'existe pas" >> "${LOGERR}"
        exit 1
    fi
}


# -----------
# TRAITEMENTS
# -----------

cartouche(){
    head -n 33 "${SCRIPT_DIR}/${SCRIPT_NAME}" | grep -v "#!"
    echo "-------------------------------------------------"
}

installe_vim_awesome(){
    cd "${SCRIPT_DIR}/../vendor/vim-awesome-cli"
    make install
    cd -

    vim-awesome install coc-nvim
    vim-awesome install coc-java
    vim-awesome install coc-snippets
    vim-awesome install coc-tsserver
    vim-awesome install coc-json
    vim-awesome install coc-css
    vim-awesome install coc-yaml
    vim-awesome install coc-sh
    vim-awesome install coc-tslint
}

main(){
    cartouche
    # make that damn dirty snake available
    mkdir ${HOME}/bin
    PATH="${HOME}/bin:${PATH}"
    ln -s /usr/bin/python3.9 ${HOME}/bin/python

    git submodule update --init --recursive
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    sh ${HOME}/.vim_runtime/install_awesome_vimrc.sh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

    installe_vim_awesome
}

main