version = node[:nodejs][:npm][:version]

execute "upgrade npm" do
  command "npm install -g npm@#{version}"
  action :run
end

