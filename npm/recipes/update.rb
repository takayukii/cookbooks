execute "upgrade npm" do
  command "npm install -g npm"
  action :run
end

execute "upgrade node" do
  command "sudo npm install -g n;sudo n stable"
  action :run
end
