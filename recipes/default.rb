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
end

execute "dotfiles" do
  user node['user']
  group node['group']

  environment "HOME" => "/home/#{node['user']}"

  cwd "/home/#{node['user']}/dotfiles"
  command <<-EOH
  ./placefiles.sh
  EOH
end
