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

link '/usr/local/bin/compass' do
  to '/usr/bin/compass'
end


