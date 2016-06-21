#
# Cookbook Name:: riemann
# Recipe:: server
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
=begin
#<
Installs `riemann-server` with `/usr/local/riemann/etc/user.config` for manual changes to rieman-server.
TODO: 
  - add temlate `riemann-chef.config` to include configuration from the cookbook.
  
#>
=end

conf_dir = ::File.join(
  node.riemann.home_dir,
  'etc'
)

include_recipe 'java'
include_recipe 'ark'
include_recipe 'riemann::infra'

ark 'riemann' do
  url "#{node.riemann.download.url}riemann-#{node.riemann.download.version}.tar.bz2"
  version node.riemann.download.version
  checksum node.riemann.download.checksum
  owner node.riemann.user
  home_dir node.riemann.home_dir
  action :install
end

link '/etc/riemann' do
  to conf_dir
end

template ::File.join(conf_dir, 'riemann.config') do
  owner node.riemann.user
  group node.riemann.group
  source 'riemann.config.erb'
  mode '0644'
end

file node.riemann.config.userfile do
  owner node.riemann.user
  group node.riemann.group
  action :create_if_missing
  mode '0644'
end

service "riemann-server" do
    provider Chef::Provider::Service::Init::Debian
    supports :restart => true, :stop => true, :start => true, :status => true
    action :start
end
