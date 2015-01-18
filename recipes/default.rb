#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

git "/home/#{node['user']}/dotfiles" do
  repository "https://github.com/miwara/dotfiles.git"
  reference "master"

  user node['user']
  group node['group']

  notifies :run, "execute[dotfiles]", :immediately
end

execute "dotfiles" do
  user node['user']
  group node['group']

  environment "HOME" => "/home/#{node['user']}"

  cwd "/home/#{node['user']}/dotfiles"
  command "./placefiles.sh""

  cwd "/home/#{node['user']}/.emacs.d"
  command <<-EOH
  $HOME/.cask/bin/cask upgrade-cask
  $HOME/.cask/bin/cask
  EOH

  action :nothing
end
