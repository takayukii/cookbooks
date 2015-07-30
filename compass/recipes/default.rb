#
# Cookbook Name:: compass
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w[sass compass].each do |pkg|
  gem_package pkg do
    action :install
  end
end

['/usr/local/bin/compass', '/opt/chef/embedded/bin/compass'].each do |compass_path|
  link '/usr/bin/compass' do
    only_if { File.exist?(compass_path) }
    to compass_path
  end  
end
