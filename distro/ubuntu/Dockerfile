FROM ubuntu:latest

# Création de l'utilisateur de dev
RUN useradd -ms /bin/bash dev

# Installing minimum deps
RUN apt-get -qq update
RUN apt-get install git -y

RUN git clone https://github.com/Phreno/.dotfiles.git /home/dev/.dotfiles

WORKDIR /home/dev/.dotfiles/distro/ubuntu
RUN chmod +x ./setup.sh
RUN ./setup.sh

USER dev
WORKDIR /home/dev


