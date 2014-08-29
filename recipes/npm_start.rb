rightscale_marker :begin

directory "/var/log/nginx" do
  action :create
end

template "/etc/init.d/nodejs" do
  source "nodejs.erb"
  mode 755
  action :create
end


service "nodejs" do 
  action :start
end

rightscale_marker :end