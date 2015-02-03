#!/bin/sh

echo "-- BREW INSTALL"
brew update
brew tap thoughtbot/formulae
brew install git node tmux vim the_silver_searcher zsh rcm lua luarocks

echo "-- RCUP"
cd ~/dot
cp rcrc ~/.rcrc
rcup 

echo "-- ZSH DEFAULT"
sudo echo "$(which zsh)" >> /etc/shells
chsh -s zsh
zsh

echo "-- NPM INSTALLS"
npm install -g gulp karma httpster

echo "-- MJOLNIR"
luarocks install mjolnir.hotkey
luarocks install mjolnir.application
cd ~/Downloads
curl https://github.com/sdegutis/mjolnir/releases/download/0.4.3/Mjolnir-0.4.3.zip | unzip
unzip Mjolnir-0.4.3.zip
mv Mjolnir /Applications/

./osx.sh
