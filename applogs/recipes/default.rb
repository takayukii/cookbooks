app_name = node['applogs']['app_name']

directory "/var/log/#{app_name}" do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
