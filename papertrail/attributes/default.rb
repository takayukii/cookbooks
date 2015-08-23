default["papertrail"][:files] = ["/var/log/messages", "/var/log/onecoindog/server.log"]
default["papertrail"][:hostname] = "onecoindog.com"
default["papertrail"][:papertrail_host] = "logs.papertrailapp.com"
default["papertrail"][:papertrail_port] = 1111
