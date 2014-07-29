rightscale_marker :begin

bash "start node" do
  cdw node[:app][:destination]
   code <<-EOH
    NODE_ENV=#{node['nodejs']['environment']} #{node['nodejs']['dir']}/bin/npm start > /var/log/nginx/node.log
  EOH
  
end

rightscale_marker :end