rightscale_marker :begin

directory "/var/log/nginx" do
  action :create
end

bash "start node" do
  code <<-EOH
   export NODE_ENV=#{node['nodejs']['environment']} 
   cd #{node[:app][:destination]}
   #{node['nodejs']['dir']}/bin/npm start > /var/log/nginx/node.log
  EOH
  action :run
end

rightscale_marker :end