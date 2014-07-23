#if node[:cloud]
#  default[:app][:ip] = node[:cloud][:private_ips][0]
#else
#  default[:app][:ip]="127.0.0.1"
#end
default[:app][:port]="80" #port is hard coded in nginx
default[:app][:destination] = '/usr/share/nginx/html'
default[:app][:user]='root'

default[:nodejs][:version]="0.10.29"
default[:nodejs][:app_name]="myapp"