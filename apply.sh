#!/bin/bash

rhreq=(ack ctags git vim-common dejavu-fonts-common dejavu-sans-mono-fonts libicu-devel)

# libicu-devel is a requirement for bulding the gimli ruby gem

debreq=(exuberant-ctags git vim ack-grep)

py='false'
adv='false'

help() {
cat<<'EOF'
apply.sh [ OPTIONS ]
OPTIONS
         -h, --help
            Help message
         -a, --advanced
            Advanced mode (i.e. move the cursor with hjkl only)
         -p, --python
            Set some plugins for python : jedi, flake8
EOF
}

options=$(getopt -o ahp --long advanced,help,python -- "$@")
eval set -- "$options"

while true; do
    case "$1" in
        -a|--advanced)
            adv='true'
            ;;
        -h|--help)
            help
            ;;
        -p|--python)
            py='true'
            ;;
        --)
            shift
            break
            ;;
    esac
    shift
done

echo -e "Checking deps"

test='OK'

if [ -f /etc/debian_version ];then
    for i in ${debreq[*]}; do
        dpkg --status $i | grep -q 'Status: install ok' || test='KO'
    done
else
    for i in ${rhreq[*]}; do
        rpm -q $i || test='KO'
    done
    if [ "$py" = 'true' ]; then
        rpm -q python-flake8
        if [ $? -ne 0 ];then
            echo 'python-flake8 is not installed and you specified the option --python'
            test='KO'
        fi
    fi
fi

echo

if [ "$test" == 'KO' ];then
    echo 'Install prerequisites first'
    echo 'Debian  : see installreqs-deb.sh'
    echo 'Red Hat : see installreqs-rh.sh'
    exit 1
fi

echo "You may consider (for markdown to pdf conversion) :"
echo -e "gem install --no-ri --no-rdoc gimli\n"

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

# Python
if [ "$py" = 'false' ]; then
    sed -i  -e "s/^.\(call add(g:pathogen_disabled, 'flake8')\)/\1/g" \
            -e "s/^.\(call add(g:pathogen_disabled, 'jedi')\)/\1/g" \
            ~/.vimrc
fi

# Advanced mode
if [ "$adv" = 'true' ]; then
    sed -i 's/"""//g' ~/.vimrc
fi
