#!/usr/bin/env bash
#
# Description:
#   Vim Tip #804 - Generate System Tags for your favorite languages
#
# Resources:
#  http://design.liberta.co.za/articles/code-completion-intellisense-for-cpp-in-vim-with-omnicppcomplete/
#########################################################################################################

# Force bash to exit if any command fails
set -o errexit

# Install exuberant-ctags in Debian based systems
sudo aptitude install exuberant-ctags

# for FreeBSD
# cd /usr/ports/devel/ctags && make install (as root)

mkdir -p ~/.vim/tags/linux

# Create system tags for linux kernel.
sudo aptitude install linux-headers-`uname -r`
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/.vim/tags/linux/ctags /usr/src/linux-headers-`uname -r`

# Create system tags for ruby
if [ -d /usr/lib/ruby/1.8 ]; then
  ctags -R -f ~/.vim/tags/linux/rbtags1.8 /usr/lib/ruby/1.8
  ctags -R -f ~/.vim/tags/linux/gemtags1.8 /var/lib/gems/1.8/gems
fi

if [ -d /usr/lib/ruby/1.9.1 ]; then
  ctags -R -f ~/.vim/tags/linux/rbtags1.9.1 /usr/lib/ruby/1.9.1
  ctags -R -f ~/.vim/tags/linux/gemtags1.9.1 /var/lib/gems/1.9.1/gems
fi

# Create system tags for Java
ISSUE=`cat /etc/issue | grep Ubuntu | cut -d' ' -f2`
ISSUE_MAYOR=`echo $ISSUE | cut -d. -f1`

if [ $ISSUE_MAYOR -lt 10 ]; then
  # For Ubuntu 9.10 and below we use sun-java
  sudo aptitude install sun-java6-source
  cd /usr/lib/jvm/java-6-sun
  sudo mkdir src
  sudo unzip -d src src.zip
  ctags -R -f ~/.vim/tags/linux/javatags /usr/lib/jvm/java-6-sun/src
else
  # For Ubuntu 10.04 onwards we use openjdk-6
  sudo aptitude install openjdk-6-source
  cd /usr/lib/jvm/java-6-openjdk
  sudo mkdir src
  sudo unzip -d src src.zip
  sudo ctags -R -f ~/.vim/tags/linux/javatags /usr/lib/jvm/java-6-openjdk/src
fi

# Create system tags for STL
wget http://www.vim.org/scripts/download_script.php?src_id=9178 -O /tmp/cpp_src.tar.bz2
tar xvfj /tmp/cpp_src.tar.bz2 -C /tmp
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f ~/.vim/tags/linux/stltags /tmp/cpp_src

# Create tags for OpenGL
sudo aptitude install libgl1-mesa-dev libglu1-mesa-dev
ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f ~/.vim/tags/linux/gltags /usr/include/GL

# Create tags for SDL
sudo aptitude install libsdl-sound1.2-dev libsdl-net1.2-dev libsdl-mixer1.2-dev libsdl-image1.2-dev
ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f ~/.vim/tags/linux/sdltags /usr/include/SDL

# Create tags for QT4
sudo aptitude install libqt4-dev
ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f ~/.vim/tags/linux/qt4tags /usr/include/qt4/
