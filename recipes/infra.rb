#
# Cookbook Name:: riemann
# Recipe:: infra
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
=begin
#<
Configure user and group for riemann-servie and riemann-dash
#>
=end
group node['riemann']['group'] do
  action :create
end

user node['riemann']['user'] do
  action :create
  home node['riemann']['home_dir']
  comment 'Riemann User'
  system true
  gid node['riemann']['group']
  shell '/bin/false'
end
