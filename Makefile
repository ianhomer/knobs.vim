vimPlugins = ./build/vim/plugins
vader= $(vimPlugins)/vader.vim
packer = ~/.local/share/nvim/site/pack/packerdev/start/packer.nvim

$(vader):
	git clone git@github.com:junegunn/vader.vim.git ./build/vim/plugins/vader.vim

$(packer):
	git clone https://github.com/wbthomason/packer.nvim $(packer)
 
dependencies: $(vader) $(packer)

test-vader: dependencies
	test/test.sh

test-lua: dependencies
	busted test/test.lua

container:
	test/container.sh

start:
	test/start.sh

test: test-lua test-vader
