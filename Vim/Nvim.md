
## Install NeoVim
Install the build dependencies:
```shell
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip
```

Clone the NeoVim repository:
```shell
git clone https://github.com/neovim/neovim.git
```

Change into the `neovim` directory and checkout the latest release:
```shell
cd neovim
git checkout stable
```

Build and install NeoVim:
```shell
make CMAKE_BUILD_TYPE=Release 
sudo make install
```

Reload your shell configuration file to apply the changes:
```shell
export PATH="/home/hyz/neovim/build/bin:$PATH"
	alias vim='nvim'
```