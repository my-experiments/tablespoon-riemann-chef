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

script 'start_riemann_server' do
  cwd "/tmp"
  user node.riemann.user
  group node.riemann.group
  interpreter "bash"
  code <<-EOM
.#{node.riemann.install_dir}/bin/riemann #{node.riemann.config_file}
  EOM
end
