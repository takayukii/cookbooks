filename = "remote_syslog_linux_amd64.tar.gz"
remote_uri = node[:papertrail][:remote_uri]

remote_file "/tmp/#{filename}" do
  source "#{remote_uri}"
  retries 3
end

script "install_remote_syslog" do
  interpreter "bash"
  user "root"
  code <<-EOL
    tar zxvf /tmp/#{filename} -C /tmp
    cp -f /tmp/remote_syslog/remote_syslog /usr/local/bin/remote_syslog
  EOL
end

template "remote_syslog" do
  path "/etc/init.d/remote_syslog"
  source "remote_syslog.erb"
  action :create
  owner "root"
  group "root"
  mode 0555
end

template "log_files.yml" do
  path "/etc/log_files.yml"
  source "log_files.yml.erb"
  action :create
  owner "root"
  group "root"
  mode 0644
  notifies :reload, "service[remote_syslog]"
end

service "remote_syslog" do
  supports :restart => true, :reload => true
  action [ :enable, :start ]
end
