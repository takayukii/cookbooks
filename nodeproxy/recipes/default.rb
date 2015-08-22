#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template 'nginx.repo' do
  path '/etc/yum.repos.d/nginx.repo'
  source 'nginx.repo.erb'
  mode 0644
  user 'root'
  group 'root'
end

# chkconfig --list (default)
# nginx 0:off 1:off 2:on  3:on  4:on  5:on  6:off
package 'nginx' do
	action :install
  options '--disablerepo=* --enablerepo=nginx'
end

file '/etc/nginx/conf.d/default.conf' do
  action :delete
end

template 'nginx.conf' do
  path '/etc/nginx/nginx.conf'
  source 'nginx.conf.erb'
  action :create
  owner 'root'
  group 'root'
  mode 0644
  notifies :reload, 'service[nginx]'
end

template 'nodeproxy.conf' do
  path '/etc/nginx/conf.d/nodeproxy.conf'
  source 'nodeproxy.conf.erb'
  action :create
  owner 'root'
  group 'root'
  mode 0644
  notifies :reload, 'service[nginx]'
end

service 'nginx' do
	supports :status => true, :restart => true, :reload => true
	action [ :enable, :start]
end
