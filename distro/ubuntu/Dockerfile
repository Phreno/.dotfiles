FROM ubuntu:latest

# Installing minimum deps
RUN apt-get -qq update
RUN apt-get install git -y

RUN git clone https://github.com/Phreno/.dotfiles.git /root/.dotfiles

WORKDIR /root/.dotfiles/distro/ubuntu
RUN chown -R root:root ./
RUN pwd
RUN ls -la
RUN chmod +x ./setup.sh

RUN ./setup.sh
WORKDIR /root
