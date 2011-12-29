include_recipe 'supermon'

template 'watch-http' do
  path '/etc/monit/conf.d/http'
  variables(:uri => URI.parse(node[:supermon][:watcher_config][:http][:uri]))
  notifies :restart, 'service[monit]'
end
