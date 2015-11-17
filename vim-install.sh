#!/usr/bin/env bash

echo "This will download, build and install the latest version of VIM"

echo "Removing existing versions of VIM"

yum remove vim vim-runtime gvim

yum install -y ruby ruby-devel lua lua-devel luajit luajit-devel \
    ctags git python python-devel python3 python3-devel perl \
    perl-devel perlExtUtils-ParseXS perlExtUtils-XSpp \
    perl-ExtUtils-CBuilder perl-ExtUtils-Embed \
    ncurses-devel

cd /usr/local/src/

git clone https://github.com/vim/vim.git

cd vim

./configure --with-feature=huge \
            --enable-multibyte \
            --enable-luainterp \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-python3interp \
            --with-python-config-dir=/usr/lib/python3.3/config \
            --enable-perlinterp \
            --enable-cscope --prefix=/usr \
            --with-x \
            --with-tlib=ncurses \
            --disable-gui \
            --enable-tclinterp \
            --with-compiled-by=alxbrd+vim@live.co.uk

make VIMRUNTIMEDIR=/usr/share/vim/vim74
make install
