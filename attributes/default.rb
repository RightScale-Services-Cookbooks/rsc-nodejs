
default[:app][:ip] = node[:cloud][:private_ips][0]
default[:app][:port]=80 #port is hard coded in nginx
default[:app][:destination] = '/var/www/nginx-default'
default[:app][:user]='nginx'