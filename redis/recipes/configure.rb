node[:opsworks][:layers].each do |layer|
  Chef::Log.error("-- #{layer} --")
  bash "test" do
    code <<-EOC
echo '#{layer}' >> /layer.txt
EOC
  end
  node[:opsworks][:layers]["#{layer}"][:instances].each do |instancehostname|
    Chef::Log.error("-- #{instancehostname} --")
    bash "test" do
      code <<-EOC
echo '#{instancehostname}' >> /instance.txt
EOC
    end

  end
end

