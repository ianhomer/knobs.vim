vader = ~/.vim/vendor/plugins/vader.vim
packer = ~/.local/share/nvim/site/pack/vendor/start/packer.nvim
plenary = ~/.local/share/nvim/site/pack/vendor/start/plenary.nvim
minimal_init = test/init/minimal_init.vim

$(vader):
	git clone --depth 1 git@github.com:junegunn/vader.vim.git $(vader)

$(packer):
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $(packer)

$(plenary):
	git clone --depth 1 https://github.com/nvim-lua/plenary.nvim $(plenary)

test-vader: $(vader)
	test/test.sh

test-lua:
	busted --lpath=./lua/?.lua test/test.lua

test-nvim: $(plenary)
	nvim --headless --noplugin  -u ${minimal_init} -c "PlenaryBustedDirectory lua/tests/automated/ { minimal_init = '${minimal_init}' }"

container: $(packer)
	test/container.sh

start: $(packer)
	test/start.sh

test: test-nvim test-lua test-vader
