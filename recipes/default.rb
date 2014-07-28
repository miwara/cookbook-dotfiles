#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "install cask" do
  user "louise"
  group "louise"
  environment "HOME" => "/home/louise"

  cwd "/home/vagrant"
  command <<-EOH
  curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
  EOH

  not_if { File.exists?("/home/vagrant/.cask") }
end

git "/home/louise/dotfiles" do
  repository "https://github.com/miwara/dotfiles.git"
  reference "master"

  user "louise"
  group "louise"
end

execute "dotfiles" do
  user "louise"
  group "louise"

  environment "HOME" => "/home/louise"
  environment "CASK_PATH" => "/home/louise/.cask/bin"

  cwd "/home/louise/dotfiles"
  command <<-EOH
  ./placefiles.sh
  cd /home/louise/.emacs.d
  cask
  EOH
end
