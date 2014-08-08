rightscale_marker :begin

bash "start node" do
  cwd node[:app][:destination]
  user node[:nodejs][:user]
   code <<-EOH
     NODE_ENV=#{node['nodejs']['environment']} #{node['nodejs']['dir']}/bin/npm start > /var/log/nginx/node.log 2>&1 &
  EOH
  
end

rightscale_marker :end