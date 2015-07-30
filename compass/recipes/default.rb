#
# Cookbook Name:: compass
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

data_dir = value_for_platform(
  "amazon" => { "default" => "/amazon_test" },
  "ubuntu" => { "default" => "/ubuntu_test" },
  "default" => "/default_test"
)

directory data_dir do
  mode 0755
  owner 'root'
  group 'root'
  recursive true
  action :create
end

%w[sass compass].each do |pkg|
  gem_package pkg do
      action :install
  end
end
