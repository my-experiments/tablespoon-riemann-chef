
script 'run_experiment' do
  cwd "/tmp"
  user node['riemann']['user']
  group node['riemann']['group']
  interpreter "bash"
  code <<-EOM
echo "Hej"
  EOM
end

