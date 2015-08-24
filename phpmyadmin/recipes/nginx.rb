%w[php php-fpm phpmyadmin].each do |pkg|
  package pkg do
    action :install
  end
end

# changed parameters in www.conf
# listen = /var/run/php-fpm/php-fpm.sock
# user = nginx
# group = nginx
# http://blog.rhasm.net/centos-nginx-php/
template "www.conf" do
  path "/etc/php-fpm.d/www.conf"
  source "www.conf.erb"
  action :create
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[php-fpm]"
  variables({
    :user => "nginx",
    :group => "nginx"
  })
end

template "config.inc.php" do
  path "/etc/phpMyAdmin/config.inc.php"
  source "config.inc.php.erb"
  action :create
  owner "root"
  group "root"
  mode 0644
end

service "php-fpm" do
  supports :restart => true
  action [ :enable, :start ]
end
