rightscale_marker :begin

bash "start node" do
  cwd node[:app][:destination]
  user node[:nodejs][:user]
   code <<-EOH
    pkill -9 node
  EOH
  
end

rightscale_marker :end