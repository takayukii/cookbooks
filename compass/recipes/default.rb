%w[sass compass].each do |pkg|
  gem_package pkg do
    action :install
  end
end

# PATHが通ってなかったためリンクを作成する（インストール先を複数あたる）
["/usr/local/bin/compass", "/opt/chef/embedded/bin/compass"].each do |compass_path|
  link "/usr/bin/compass" do
    only_if { File.exist?(compass_path) }
    to compass_path
  end  
end
