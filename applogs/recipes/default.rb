paths = node["applogs"]["paths"]

paths.each do |path|
  directory path do
    owner "root"
    group "root"
    mode "0755"
    action :create
  end

  appname = path.split("/").last(1)

  template "logrotate" do
    path "/etc/logrotate.d/#{appname[0]}"
    source "logrotate.erb"
    action :create
    owner "root"
    group "root"
    mode 0644
    variables({
      :path => path
    })
  end

end
