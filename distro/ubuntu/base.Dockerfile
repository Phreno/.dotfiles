FROM ubuntu:latest

# Installing minimum deps
RUN apt-get -qq update
RUN apt-get install git -y
RUN apt-get install zsh -y

WORKDIR /tmp
COPY ./distro/ubuntu/setup.sh ./setup.sh
RUN chmod +x ./setup.sh
RUN ./setup.sh
