FROM ubuntu-base

# Installing minimum deps
RUN useradd -ms /bin/zsh dev
RUN adduser dev sudo
USER dev

WORKDIR /home/dev
RUN git clone https://github.com/Phreno/.dotfiles.git /home/dev/.dotfiles

WORKDIR /home/dev/.dotfiles
RUN ./install

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
