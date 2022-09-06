#!/bin/bash

# Développeur ....: K3rn€l_P4n1K
# Nom ............: ubuntu-setup
# Description ....: Configure un nouveau poste ubuntu pour le dev
# Version ........: 1.0
# Date ...........: Fri Jul 29 21:21:30 CEST 2022
# Dépendances ....: git curl dotbot

# Fonctionnalité .: Installe les dotfiles, nvm, docker, neovim ...
# Intention ......: Simplifier la prise en main d'un nouveau poste de travail
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

ensureDir(){
    file="${1}"
    if [ ! -d "${file}" ]; then
        echo "${file} n'existe pas, création du dossier manquant"
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

main(){
    cartouche
    apt-get -y install \
        apt-utils \
        cmake     \
        coreutils \
        curl      \
        docker    \
        fuse      \
        git       \
        gzip      \
        htop      \
        lsb       \
        thefuck   \
        jq        \
        ncdu      \
        pandoc    \
        python3.9 \
        ripgrep   \
        tmux      \
        unzip     \
        wget      \
        xclip     \
        xdg-utils \
        yarn      \
        zip       \
        zsh
}

main
