package "httpd" do
  action :install
end

service "httpd" do
  action [ :enable, :start ]
end

%w[php php-pdo php-mbstring php-mysql].each do |pkg|
  package "#{pkg}" do
    action :install
  end
end

template "timezon.ini" do
  path "/etc/php.d/timezone.ini"
  source "timezone.ini.erb"
  action :create
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[httpd]"
end

mysql_database = node["lamp"][:mysql][:database]
mysql_user = node["lamp"][:mysql][:user]
mysql_password = node["lamp"][:mysql][:password]

%w[mysql mysql-server].each do |pkg|
  package pkg do
    action :install
  end
end

service "mysqld" do
  action [ :enable, :start ]
end

execute "prepare database" do
  command "mysql -u root -e 'create database #{mysql_database} default charset utf8;'"
  not_if "mysql -u root -e 'show databases;' | grep #{mysql_database}"
end

grant_statement = "GRANT ALL PRIVILEGES ON *.* TO '#{mysql_user}'@'%' IDENTIFIED BY '#{mysql_password}' WITH GRANT OPTION;"
grant_statement += "GRANT ALL PRIVILEGES ON *.* TO '#{mysql_user}'@'localhost' IDENTIFIED BY '#{mysql_password}' WITH GRANT OPTION;"

sql_statement = "SELECT User FROM mysql.user WHERE User = '#{mysql_user}';"

execute "prepare user" do
  command "mysql -u root -e \"#{grant_statement}\""
  not_if "mysql -u root -e \"#{sql_statement}\" | grep #{mysql_user}"
end
