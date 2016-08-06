#!/bin/bash
#
# Copyright � 2015-2016, Akhil Narang "akhilnarang" <akhilnarang.1999@gmail.com>
#
# This software is licensed under the terms of the GNU General Public
# License version 2, as published by the Free Software Foundation, and
# may be copied, distributed, and modified under those terms.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# Please maintain this if you use this script or any part of it
#

clear
echo Installing Dependencies!
# Update
sudo pacman -Syu
# Install needed packages
sudo pacman -S gcc git gnupg flex bison gperf sdl wxgtk bash-completion \
squashfs-tools curl ncurses zlib schedtool perl-switch zip \
unzip libxslt maven tmux screen w3m python2-virtualenv bc rsync vi ncftp
# Installing 64 bit needed packages
sudo pacman -S gcc-multilib lib32-zlib lib32-ncurses lib32-readline
# yaourt for easy installing from AUR
sudo pacman -Sy yaourt
# Disable pgp checking when installing stuff from AUR
export MAKEPKG="makepkg --skippgpcheck"
yaourt libtinfo
yaourt lib32-ncurses5-compat-libs
yaourt ncurses5-compat-libs
yaourt phablet-tools

echo "All Done :'D"
echo "Don't forget to run these command before building!"
echo "
virtualenv2 <folder name>
source <folder name>/bin/activate
export LC_ALL=C"

echo "If you wanna use nano as your git editor (for commit messages, interactive rebase, etc, enter nano."
echo "Anything else will result in the default i.e. vim being used"
echo "Your current editor is $(git config core.editor)"

read giteditor
if [ "$giteditor" == "nano" ];
then
git config --global core.editor nano
else
git config --global core.editor vi
fi

echo "Your git editor is now $(git config core.editor)"
