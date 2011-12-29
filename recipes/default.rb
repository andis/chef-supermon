package 'monit'

template 'monitrc' do
  path '/etc/monit/monitrc'
  mode '0600'
  variables(:mailservers => hosts_to_monit(node[:supermon][:mailservers]))
end

file '/etc/default/monit' do
  content "startup=1\n"
end

service 'monit' do
  supports :restart => true
  subscribes :restart, resources(:template => 'monitrc')
end

include_recipe 'supermon::watcher-http' if node[:supermon][:watchers].include?('http')
