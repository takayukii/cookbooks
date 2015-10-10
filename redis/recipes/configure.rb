node[:opsworks][:layers].each do |layershortname|
  node[:opsworks][:layers][layershortname][:instances].each do |instancehostname|

    bash "test" do
      code <<-EOC
echo '#{layershortname}#{instancehostname}' >> /test.txt
EOC
    end

  end
end

