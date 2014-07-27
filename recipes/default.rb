#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
git "/home/louise/cask" do
  repository "https://github.com/cask/cask.git"
  reference "master"

  user "louise"
  group "louise"
end

execute "cask" do
  cwd "/home/louise"
  command <<-EOH
  mv cask .cask;
  export PATH="/home/louise/.cask/bin:$PATH";
  EOH
end

git "/home/louise/dotfiles" do
  repository "https://github.com/miwara/dotfiles.git"
  reference "master"

  user "louise"
  group "louise"
end

# execute "dotfiles" do
#   user "louise"
#   group "louise"

#   cwd "/home/louise/dotfiles"
#   command <<-EOH
#   if [ ! -e /home/louise/.emacs.d ]; then
#     mkdir /home/louise/.emacs.d
#   fi
  
#   cd /home/louise/dotfiles

#     currentdir=~/dotfiles

#     if [ ! -e ./tmp ]; then
#         mkdir ./tmp
#     fi
#     cd ./tmp

#     ln -s $currentdir/init.el init.el
#     mv init.el /home/louise/.emacs.d/

#     ln -s $currentdir/Cask Cask
#     mv Cask /home/louise/.emacs.d/Cask

#     ln -s $currentdir/.zshrc .zshrc
#     mv .zshrc /home/louise

#     ln -s $currentdir/.tmux.conf .tmux.conf
#     mv .tmux.conf /home/louise

#   export PATH="/home/louise/.cask/bin:$PATH";
#   cd /home/louise/.emacs.d
#   cask
#   EOH
# end
