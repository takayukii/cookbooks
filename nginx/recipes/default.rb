#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template '/etc/yum.repos.d/nginx.repo' do
  mode 0644
  user 'root'
  group 'root'
  path '/etc/yum.repos.d/nginx.repo'
  source 'nginx.repo.erb'
end

package 'nginx' do
	action :install
end

template 'nginx.conf' do
  path '/etc/nginx/nginx.conf'
  source 'nginx.conf.erb'
  owner 'root'
  group 'root'
  mode 0644
  notifies :reload, 'service[nginx]'
end


service 'nginx' do
	supports :status => true, :restart => true, :reload => true
	action [ :enable, :start]
end

