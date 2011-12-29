def host_to_monit(host)
  host.split(':').join(' port ')
end

def hosts_to_monit(hosts)
  if hosts.is_a? Enumerable
    hosts.collect {|host| host_to_monit(host) }.join(' ')
  else
    host_to_monit(hosts)
  end
end
