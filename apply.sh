#!/bin/bash

rhreq=(ack ctags git vim-common dejavu-fonts-common dejavu-sans-mono-fonts)

debreq=(exuberant-ctags git vim ack-grep)

echo -e "Checking deps\n"

test='OK'

if [ -f /etc/debian_version ];then
    #for i in $(cat <&5); do
    for i in ${debreq[*]}; do
        dpkg --status $i | grep -q 'Status: install ok' || test='KO'
    done
else
    #for i in $(cat <&4); do
    for i in ${rhreq[*]}; do
        rpm -q $i || test='KO'
    done
    grep -q 'release 5' /etc/redhat-release
    if [ $? -ne 0 ];then
        rpm -q flake8 || test='KO'
    fi
fi

echo

if [ "$test" == 'KO' ];then
    echo 'Install prerequisites first'
    echo 'Debian  : see installreqs-deb.sh'
    echo 'Red Hat : see installreqs-rh.sh'
    exit 1
fi

echo -e "Checking vim version\n"

if [ -f /etc/redhat-release ];then
    rpm -q vim-enhanced | grep -q '\-7.0'
    if [ $? -eq 0 ];then
        echo 'You need a more recent version of vim'
        exit 1
    fi
fi

echo -e "Applying plugins\n"
mkdir -p ~/.vim/{bundle,scripts}
mkdir -p ~/.fonts
cp -f dotvimrc ~/.vimrc
cp -f dotgvimrc ~/.gvimrc
cp -f dotctags ~/.ctags
cp -r dotvim/* ~/.vim
cp -r bundle/* ~/.vim/bundle
cp -r scripts/* ~/.vim/scripts
cp -r fonts/* ~/.fonts

# Little cosmetic patch
sed -i 's/Underlined/PreProc/g' ~/.vim/bundle/octopress/syntax/octopress.vim

# Pyflakes, Flake8 and Jedi only for Python 2.5+
python -V 2>&1 | grep -q '2\.4'
if [ $? -eq 0 ];then
  rm -rf ~/.vim/bundle/flake8
  rm -rf ~/.vim/bundle/jedi
fi
