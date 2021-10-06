vimPlugins = ./build/vim/plugins
vader= $(vimPlugins)/vader.vim

$(vader):
	git clone git@github.com:junegunn/vader.vim.git ./build/vim/plugins/vader.vim

dependencies: $(vader)

run:
	test/test.sh

container:
	test/container.sh

start:
	test/start.sh

test: dependencies run
