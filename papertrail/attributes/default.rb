default[:papertrail][:remote_uri] = "https://github.com/papertrail/remote_syslog2/releases/download/v0.13/remote_syslog_linux_amd64.tar.gz"
default[:papertrail][:files] = ["/var/log/messages", "/var/log/onecoindog/server.log"]
default[:papertrail][:hostname] = "onecoindog.com"
default[:papertrail][:papertrail_host] = "logs.papertrailapp.com"
default[:papertrail][:papertrail_port] = 1111
