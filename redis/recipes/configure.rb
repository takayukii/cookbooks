node[:opsworks][:layers].each do |layer|
  Chef::Log.debug("-- #{layer} --")
  layer[:instances].each do |instancehostname|
    Chef::Log.debug("-- #{instancehostname} --")
    bash "test" do
      code <<-EOC
echo '#{instancehostname}' >> /test.txt
EOC
    end

  end
end

