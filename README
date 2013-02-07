# Introduction

This repository contains my personal vim configuration that has been evolving
and changing over the years.

# Pre-requisities

I use Ubuntu Linux mainly so these configuration files are tested on Ubuntu
10.04, 10.10, 11.10, 12.04 and 12.10. They may work on other Ubuntu versions
and with proper changes they may also work on other distributions like CentOS
or RedHat.

## Installing vim from sources

The vim version that comes with Ubuntu is pretty old and comes compiled with ruby-1.8 that is soon to be deprecated. To be able to use the latest features and plugins I recommend to compile vim from sources. My configuration or some plugins may fail to work using the default vim that comes with Ubuntu.

Install packages required to build and use vim:
     
```sh
sudo apt-get install mercurial build-essential ruby1.9.1 ruby1.9.1-dev \
   libncursesw5-dev exuberant-ctags libgtk2.0-dev libx11-dev xorg-dev  \
   git-core wget sed ack-grep exuberant-ctags rake python-dev
```

Download vim source code from the mercurial repository:

```sh
mkdir ~/Apps
hg clone https://code.google.com/p/vim/ ~/Apps/vim-hg
```

Compile and install vim:

```sh
sudo apt-get purge vim  # Uninstall Ubuntu vim if it is installed
cd ~/Apps/vim
./configure --prefix=/usr/local --with-features=huge --enable-pythoninterp \
  --enable-rubyinterp --enable-gui=gtk2 --enable-cscope --enable-multibyte \
  --enable-cscope --with-x
make
sudo make install
hash -r  # Reset bash command cache
```

Note that I am installing in */usr/local* but you are free to install anywhere you like.

# Installing my configuration

## Get my configuration

First download the configuration and put it in your home directory:

```sh
rm -rf ~/.vim ~/.vimrc  # This will delete all your current vim configuration!!
git clone https://github.com/hsanson/dotvim.git ~/.vim
```

Then create a symbolic link to my vimrc file to your $HOME/.vimrc file:

```sh
ln -s $HOME/.vim/vimrc $HOME/.vimrc
```
## Install all plugins I use

I make use of vundle to manage my vim plugins. This way is very easy to install all the required
plugins in a new PC.

First install the vundle plugin itself:

```sh
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

Then install all the plugins. With vundle is a simple command:

```sh
vim +BundleInstall +qall
```

This assumes you installed vim in */usr/local/bin/vim* and that the path */usr/local/bin* is in your PATH. After
starting vim with the BundleInstall option it will show a window with the list of plugins and install each one.

## Final configuration

Some plugins may require additional deb/gem packages (e.g. instant-markdown) or compilation of some custom libraries
(e.g. clang_completion, javacomplete). Also some configuration values depend on your environment like some specific 
path configuration (e.g. android_sdk_path) etc. So make sure you read the vimrc and check every plugin you want to use
to see if it has some special requirements to work.
