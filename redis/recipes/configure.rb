node[:opsworks][:layers].each do |layer|
  Chef::Log.debug("-- #{layer} --")
  bash "test" do
    code <<-EOC
echo '#{layer}' >> /layer.txt
EOC
  end
  layer[:instances].each do |instancehostname|
    Chef::Log.debug("-- #{instancehostname} --")
    bash "test" do
      code <<-EOC
echo '#{instancehostname}' >> /instance.txt
EOC
    end

  end
end

