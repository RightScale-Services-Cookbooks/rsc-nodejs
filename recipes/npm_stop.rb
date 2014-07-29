rightscale_marker :begin

bash "start node" do
  cdw node[:app][:destination]
   code <<-EOH
    NODE_ENV=#{node['nodejs']['environment']} #{node['nodejs']['dir']}/bin/npm stop
  EOH
  
end

rightscale_marker :end