vimPlugins = ./build/vim/plugins
vader= $(vimPlugins)/vader.vim
packer = ~/.local/share/nvim/site/pack/packerdev/start/packer.nvim

$(vader):
	git clone git@github.com:junegunn/vader.vim.git ./build/vim/plugins/vader.vim

$(packer):
	git clone https://github.com/wbthomason/packer.nvim $(packer)
 
dependencies: $(vader) $(packer)

run:
	test/test.sh

container:
	test/container.sh

start:
	test/start.sh

test: dependencies run
