rightscale_marker :begin

bash "start node" do
  cdw node[:app][:destination]
  user node[:nodejs][:user]
   code <<-EOH
    pkill -9 node
    NODE_ENV=#{node['nodejs']['environment']} #{node['nodejs']['dir']}/bin/npm restart > /var/log/nginx/node.log 2>&1 &
  EOH
  
end

rightscale_marker :end