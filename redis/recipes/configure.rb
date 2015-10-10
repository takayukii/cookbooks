node[:opsworks][:layers].each do |layer|
  node[:opsworks][:layers][layer][:instances].each do |instancehostname|
    Chef::Log.debug("-- #{layer} --")
    Chef::Log.debug("-- #{instancehostname} --")
    bash "test" do
      code <<-EOC
echo '#{instancehostname}' >> /test.txt
EOC
    end

  end
end

