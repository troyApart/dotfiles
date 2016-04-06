#!/bin/bash
CURRENT=$PWD
FORTRESS=$CURRENT/fortress

# .bashrc
cp $FORTRESS/.bashrc $HOME/.bashrc

# .bash_profile
declare -a arr=(
  "# User Defined" 
  "export PATH=\$PATH:/home/vagrant/bin:/usr/bin"
  "export DISPLAY=:99"
  "if [ -f ~/.bashrc ]; then"
  "   source ~/.bashrc"
  "fi"
  "test -f ~/.git-completion.bash && . \$_"
  "cd \$HOME/fortress_development/development_projects"
  "alias ll='ls -al -G --color'"
  "alias ls='ls -G --color'"
  "alias activate='source venv/bin/activate'"
  "alias pp='python -mjson.tool'"
  "alias gitcleanup='git branch --merged | grep -v \"\*\" | xargs -n 1 git branch -d'"
  "alias gitcleanupf='git branch | grep -v \"\*\" | xargs -n 1 git branch -D'"
)

for i in "${arr[@]}"
do
   echo "$i" >> $HOME/.bash_profile
done

# Git
cp $FORTRESS/.git-completion.bash $HOME/.git-completion.bash
cp $FORTRESS/.gitconfig $HOME/.gitconfig

# Scripts
if [ ! -d "$HOME/bin" ]; then
  mkdir $HOME/bin
fi
cp $CURRENT/scripts/* $HOME/bin
chmod 755 -R $HOME/bin
