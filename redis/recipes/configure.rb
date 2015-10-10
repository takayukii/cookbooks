node[:opsworks][:layers].each do |layer|
  Chef::Log.error("-- #{layer[1]} --")
  bash "test" do
    code <<-EOC
echo '#{layer[0]}' >> /layer.txt
EOC
  end
  layer[1][:instances].each do |instancehostname|
    Chef::Log.error("-- #{instancehostname[0]} --")
    bash "test" do
      code <<-EOC
echo '#{instancehostname[1][:ip]}' >> /instance.txt
EOC
    end

  end
end

# [
#     "php-app",
#    {
#        "name" => "PHP App Server",
#        "id" => "1c74027c-2ba9-459f-b74e-e7e28531d5e0",
#        "elb-load-balancers" => [],
#        "instances" => {
#            "php-app1" => {
#                "public_dns_name" => "ec2-54-178-169-193.ap-northeast-1.compute.amazonaws.com",
#                "private_dns_name" => "ip-172-31-5-54.ap-northeast-1.compute.internal",
#                "backends" => 8,
#                "ip" => "54.178.169.193",
#                "private_ip" => "172.31.5.54",
#                "instance_type" => "c3.large",
#                "status" => "online",
#                "id" => "fc1f7790-2327-407b-b671-c25e379d2148",
#                "aws_instance_id" => "i-188051bd",
#                "elastic_ip" => nil,
#                "created_at" => "2015-10-10T16:57:41+00:00",
#                "booted_at" => "2015-10-10T16:58:35+00:00",
#                "region" => "ap-northeast-1",
#                "availability_zone" => "ap-northeast-1a",
#                "infrastructure_class" => "ec2"
#            },
#            "php-app2" => {
#                "public_dns_name" => "ec2-52-68-198-171.ap-northeast-1.compute.amazonaws.com",
#                "private_dns_name" => "ip-172-31-10-217.ap-northeast-1.compute.internal",
#                "backends" => 8,
#                "ip" => "52.68.198.171",
#                "private_ip" => "172.31.10.217",
#                "instance_type" => "c3.large",
#                "status" => "online",
#                "id" => "50a546d7-fbf0-400d-87f7-71c104469e15",
#                "aws_instance_id" => "i-028455a7",
#                "elastic_ip" => nil,
#                "created_at" => "2015-10-10T17:06:00+00:00",
#                "booted_at" => "2015-10-10T17:06:56+00:00",
#                "region" => "ap-northeast-1",
#                "availability_zone" => "ap-northeast-1a",
#                "infrastructure_class" => "ec2"
#            }
#        }
#    }
# ]