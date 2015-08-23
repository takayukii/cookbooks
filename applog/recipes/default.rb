app_name = node["applog"]["app_name"]

directory "/var/log/#{app_name}" do
  owner "root"
  group "root"
  mode "0755"
  action :create
end

template "logrotate" do
  path "/etc/logrotate.d/#{app_name}"
  source "logrotate.erb"
  action :create
  owner "root"
  group "root"
  mode 0644
  variables({
    :app_name => app_name
  })
end
