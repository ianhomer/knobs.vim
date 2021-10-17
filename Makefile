vader = ~/.vim/vendor/plugins/vader.vim
packer = ~/.local/share/nvim-test/site/pack/vendor/start/packer.nvim
plenary = ~/.local/share/nvim/site/pack/vendor/opt/plenary.nvim
plug = ~/.vim/vendor/plugins/vim-plug/autoload
minimal_init = test/init/minimal_init.vim

$(vader):
	git clone --depth 1 https://github.com/junegunn/vader.vim $(vader)

$(packer):
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $(packer)

$(plenary):
	git clone --depth 1 https://github.com/nvim-lua/plenary.nvim $(plenary)

$(plug):
	git clone --depth 1 https://github.com/junegunn/vim-plug.git $(plug)

test-vader: $(vader)
	test/test.sh

test-lua:
	busted --lpath=./lua/?.lua lua/tests/unit/test.lua

test-nvim: $(plenary)
	nvim --headless --noplugin  -u ${minimal_init} -c "PlenaryBustedDirectory lua/tests/automated/ { minimal_init = '${minimal_init}' }"

container: $(packer)
	test/container.sh

start: start-nvim 

start-vim: $(plug)
	test/start.sh -c vim

start-nvim: $(packer)
	test/start.sh -c nvim

start-vim-knobs: $(plug)
	test/start.sh -c vim -k

start-nvim-knobs: $(packer)
	test/start.sh -c nvim -k

test: test-nvim test-lua test-vader
