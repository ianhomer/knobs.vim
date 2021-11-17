vader = ~/.vim/vendor/plugins/vader.vim
nvim_share = ~/.local/share/nvim-test
packer = $(nvim_share)/knobs-start/site/pack/vendor/start/packer.nvim
plenary = $(nvim_share)/knobs-test/site/pack/vendor/opt/plenary.nvim
plug = ~/.vim/vendor/plugins/vim-plug/autoload
minimal_init = test/init/minimal-init.vim

$(vader):
	git clone --depth 1 https://github.com/junegunn/vader.vim $(vader)

$(packer):
	git clone --depth 1 https://github.com/wbthomason/packer.nvim $(packer)

$(plenary):
	git clone --depth 1 https://github.com/nvim-lua/plenary.nvim $(plenary)

$(plug):
	git clone --depth 1 https://github.com/junegunn/vim-plug.git $(plug)

clean:
	rm -Rf ~/.local/share/nvim-test
	rm -Rf ~/.vim/vendor
	rm -Rf ./build

test-vader: $(vader)
	test/test.sh

test-lua:
	busted --lpath=./lua/?.lua -p spec.lua lua/tests/unit

test-nvim: $(plenary)
	nvim --headless --clean  -u ${minimal_init} -c "PlenaryBustedDirectory lua/tests/specs { minimal_init = '${minimal_init}' }"

container:
	test/container.sh

container-remote:
	test/container.sh remote

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
