wpdir = "/usr/bin"

remote_file "#{wpdir}/wp" do
  source "https://raw.github.com/wp-cli/builds/gh-pages/phar/wp-cli.phar"
  owner "root"
  group "root"
  mode 00755
  not_if { File.exists?("#{wpdir}/wp") }
end

install_path = node[:wordpress][:install_path]
install_user = node[:wordpress][:install_user]

execute "wp download" do
  command "wp core download --locale=ja --path=#{install_path}"
  user "root"
  not_if { File.exists?("#{install_path}/index.php") }
  action :run
end

execute "chmod install_path" do
  command "chown -R #{install_user} #{install_path}"
  user "root"
  action :run
end

dbname = node[:wordpress][:dbname]
dbuser = node[:wordpress][:dbuser]
dbpass = node[:wordpress][:dbpass]
dbhost = node[:wordpress][:dbhost]

execute "wp configure" do
  command "wp core config --dbname=#{dbname} --dbuser=#{dbuser} --dbpass=#{dbpass} --dbhost=#{dbhost}"
  cwd "#{install_path}"
  user install_user
  not_if { File.exists?("#{install_path}/wp-config.php") }
  action :run
end

execute "db create" do
  command "wp db create"
  cwd "#{install_path}"
  user install_user
  action :run
  ignore_failure true
end

url = node[:wordpress][:url]
title = node[:wordpress][:title]
admin_password = node[:wordpress][:admin_password]
admin_email = node[:wordpress][:admin_email]

execute "wp install" do
   command "wp core install --url=#{url} --title='#{title}' --admin_name=admin --admin_password=#{admin_password} --admin_email=#{admin_email}"
   cwd "#{install_path}"
   user node[:wordpress][:install_user]
   action :run
   not_if "wp core is-installed --path=#{install_path}"
end
