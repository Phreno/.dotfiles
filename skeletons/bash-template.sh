#!/bin/bash

# Développeur ....: K3rn€l_P4n1K
# Nom ............: @name
# Description ....: @description
# Version ........: @version
# Date ...........: @date
# Dépendances ....: @dependance

# Fonctionnalité .: @fonctionnalite
# Intention ......: @intention
# Remarque .......: @remarque


# ===========================
# Copyright @year K3rn€l P4n1k
# ===========================
#
# This file is part of @application.
#
# @application is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# @application is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with @application. If not, see <http://www.gnu.org/licenses/>.

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
        echo "${file} n'existe pas" >> "${LOGERR}"
        mkdir "${file}"
    fi
}

# --------------
# INITIALISATION
# --------------

USAGE="USAGE: ${SCRIPT_NAME} <argObligatoire> [argOptionnel]"

# Si pas de premier argument, on sors du script en affichant l'usage
argObligatoire=${1?${USAGE}}

# Si pas de deuxième argument, on fixe une valeur par default
argOptionnel=${2:-"Valeur par défault"}


# -----------
# TRAITEMENTS
# -----------

cartouche(){
    head -n 33 "${SCRIPT_DIR}/${SCRIPT_NAME}" | grep -v "#!"
    echo "-------------------------------------------------"
}

main(){
    cartouche
}

main
exit 0
