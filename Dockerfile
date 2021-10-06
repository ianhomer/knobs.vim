#
# Slim docker image for plugin validation
#
FROM archlinux:latest
RUN pacman -Syu --noconfirm \
  curl \
  git \ 
  openssh \
  stow \
  sudo \
  vim
RUN groupadd us && \
    useradd -m -g us me
RUN echo "me ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/me
RUN curl -fLo /home/me/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN mkdir -p /home/me/.vim/pack/ianhomer/start
COPY . /home/me/.vim/pack/ianhomer/start/knobs.vim
COPY test/.vimrc /home/me/.vimrc
COPY test/common.vim /home/me/common.vim
RUN chown -R me.us /home/me/.vim /home/me/.vimrc
USER me
RUN VIM_KNOBS=5 vim +PlugInstall +qa
WORKDIR /home/me
