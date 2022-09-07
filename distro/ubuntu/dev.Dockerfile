FROM ubuntu-base

# Installing minimum deps
RUN useradd -ms /bin/zsh dev
RUN adduser dev sudo
USER dev

WORKDIR /home/dev
RUN git clone https://github.com/Phreno/.dotfiles.git /home/dev/.dotfiles

WORKDIR /home/dev/.dotfiles
RUN ./install

USER root
RUN chown -R dev:dev /home/dev
RUN chown -R dev:dev /home/dev/.dotfiles
RUN chown -R dev:dev /home/dev/bin
RUN chmod -R 700  /home/dev/.dotfiles
RUN chmod -R 700  /home/dev/bin

USER dev
WORKDIR /home/dev
