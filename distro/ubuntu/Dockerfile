FROM ubuntu:latest

# Installing minimum deps
RUN apt-get -qq update
RUN apt-get install git -y
RUN apt-get install zsh -y

# Création de l'utilisateur de dev
RUN useradd -ms /bin/zsh dev

RUN git clone https://github.com/Phreno/.dotfiles.git /home/dev/.dotfiles

WORKDIR /home/dev/.dotfiles/distro/ubuntu
RUN chmod +x ./setup.sh
RUN ./setup.sh

USER dev
WORKDIR /home/dev/.dotfiles/scripts

RUN ./installe_neovim.sh
RUN ./installe_lunavim.sh

RUN ./installe_p10k.sh

RUN ./installe_fzf.sh
RUN ./installe_atuin.sh

RUN ./installe_sdkman.sh
RUN ./installe_chrysalis.sh

RUN ./installe_lazydocker.sh
RUN ./installe_lazygit.sh
