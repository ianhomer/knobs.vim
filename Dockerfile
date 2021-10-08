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
  vim \
  neovim
RUN groupadd us && \
    useradd -m -g us me
RUN echo "me ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/me
RUN curl -fLo /home/me/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN mkdir -p /home/me/.local/share/nvim/site/pack/packerdev/start
RUN git clone https://github.com/wbthomason/packer.nvim \
    /home/me/.local/share/nvim/site/pack/packerdev/start/packer.nvim
RUN mkdir -p /home/me/.vim/pack/ianhomer/start
RUN mkdir -p /home/me/.local/share/nvim/site/pack/ianhomer/start
RUN mkdir -p /home/me/.config/nvim
COPY . /home/me/.vim/pack/ianhomer/start/knobs.vim
COPY . /home/me/.local/share/nvim/site/pack/ianhomer/start/knobs.vim
COPY test/.vimrc /home/me/.vimrc
COPY test/common.vim /home/me/common.vim
COPY test/init.lua /home/me/.config/nvim/init.lua
RUN chown -R me.us /home/me
USER me
RUN VIM_KNOBS=5 vim +PlugInstall +qa
RUN VIM_KNOBS=5 nvim +PackerSync +qa
WORKDIR /home/me
