FROM kalilinux/kali-linux-docker:latest

MAINTAINER Jason Chaffee <jasonchaffee@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get clean all
RUN apt-get install -y software-properties-common && apt-get update -y && apt-get clean all
RUN apt-get install -y git colordiff colortail unzip vim tmux xterm zsh curl && apt-get clean all
RUN apt-get install -y kali-linux-all && apt-get clean all

RUN git clone https://github.com/jasonchaffee/dotfiles.git /.dotfiles

RUN /.dotfiles/config install

ENV TERM xterm-256color
RUN chsh -s $(which zsh)
RUN su -s /bin/zsh -c '. ~/.zshrc' root

CMD ["/bin/zsh"]
