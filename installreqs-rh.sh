yum -y install ack ctags git vim-common
yum -y install dejavu-fonts-common dejavu-sans-mono-fonts
grep -q 'release 5' /etc/redhat-release
if [ $? -ne 0 ];then
    yum -y install flake8
fi
