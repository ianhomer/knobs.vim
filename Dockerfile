#
# Slim docker image for plugin validation
#
FROM archlinux:latest
RUN pacman -Syu --noconfirm \
  git \ 
  openssh \
  stow \
  sudo \
  vim
RUN groupadd us && \
    useradd -m -g us me
RUN echo "me ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/me
RUN mkdir -p /home/me/.vim/pack/ianhomer/start
COPY . /home/me/.vim/pack/ianhomer/start/knobs.vim
COPY test/.vimrc .vimrc
USER me
WORKDIR /home/me
