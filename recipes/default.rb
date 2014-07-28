#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

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

  cwd "/home/louise/dotfiles"
  command <<-EOH
  ./placefiles.sh
  EOH
end
