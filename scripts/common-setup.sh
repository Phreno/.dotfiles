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


# Vérifie si le fichier existe
assertFile(){
    file="${1}"
    if [ ! -s "${file}" ]; then
        echo "${file} n'existe pas" >> "${LOGERR}"
        exit 1
    fi
}

# Vérifie si le dossier existe
assertDir(){
    file="${1}"
    if [ ! -d "${file}" ]; then
        echo "${file} n'existe pas" >> "${LOGERR}"
        exit 1
    fi
}

ensureDir(){
    file="${1}"
    if [ ! -d "${file}" ]; then
        echo "${file} n'existe pas"
        mkdir "${file}"
    fi
}


# -----------
# TRAITEMENTS
# -----------

cartouche(){
    head -n 33 "${SCRIPT_DIR}/${SCRIPT_NAME}" | grep -v "#!"
    echo "-------------------------------------------------"
}


installe_node(){
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
    nvm install node
    nvm use node
}


installe_ohmyzsh(){
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

actualise_dependances(){
    git submodule update --init --recursive
}

cree_bin_perso(){
    ensureDir ${HOME}/bin
    PATH="${HOME}/bin:${PATH}"
}

cree_repertoire_de_travail(){
    ensureDir ${HOME}/workspace
}


installe_standard(){
    npm install -g standard
}

installe_tspreed(){
    cd ~/.dotfiles.vendor.tspreed
    make install
    cd -
}


main(){
    cartouche
    actualise_dependances
    cree_repertoire_de_travail
    cree_bin_perso
    installe_node
    installe_standard
    installe_ohmyzsh
    installe_tspreed
}

main
