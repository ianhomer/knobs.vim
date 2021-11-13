#
# Slim docker image for plugin validation
#
FROM archlinux:latest
ARG CONFIGURATION=local
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
USER me
RUN chown -R me.us /home/me
RUN curl -fLo /home/me/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN mkdir -p /home/me/.local/share/nvim/site/pack/packer/start
RUN git clone https://github.com/wbthomason/packer.nvim \
    /home/me/.local/share/nvim/site/pack/packer/start/packer.nvim
RUN mkdir -p /home/me/.vim/pack/packer/start
RUN mkdir -p /home/me/.local/share/nvim/site/pack/packer/start
RUN mkdir -p /home/me/.config/nvim
COPY . /home/me/.vim/pack/plug/start/knobs.vim
COPY . /home/me/this
RUN if [[ "${CONFIGURATION}" == "local" ]] ; then \
  mv /home/me/this /home/me/.local/share/nvim/site/pack/packer§/start/knobs.vim ; \
  fi
COPY test/init/${CONFIGURATION}.vimrc /home/me/.vimrc
COPY test/init/common.vim /home/me/common.vim
COPY test/init/init-${CONFIGURATION}.lua /home/me/.config/nvim/init.lua
RUN VIM_KNOBS=5 vim +PlugInstall +qa
RUN VIM_KNOBS=5 nvim --headless -c 'autocmd User PackerComplete quitall' \
    +PackerSync
WORKDIR /home/me
