#!/bin/bash

# Développeur ....: K3rn€l_P4n1K
# Nom ............: run-ubuntu-image
# Description ....: Ouvre un bash sur l'image docker
# Version ........: 1.0
# Date ...........: Fri Jul 29 23:22:25 CEST 2022
# Dépendances ....: Avoir construit l'image docker

# Fonctionnalité .: Une image paramétrée pour le dev
# Intention ......: Utiliser vim :)
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

# --------------
# INITIALISATION
# --------------

USAGE="USAGE: ${SCRIPT_NAME} [argOptionnel]"

# Si pas de deuxième argument, on fixe une valeur par default
nomImage=${1:-"ubuntu-base"}


# -----------
# TRAITEMENTS
# -----------


cartouche(){
    head -n 33 "${SCRIPT_DIR}/${SCRIPT_NAME}" | grep -v "#!"
    echo "-------------------------------------------------"
}


main(){
    cartouche
    docker run --rm -it --entrypoint zsh "${nomImage}"
}

main
