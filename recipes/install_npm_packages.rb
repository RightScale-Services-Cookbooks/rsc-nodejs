

rightscale_marker :begin

include_recipe "nodejs::npm"

bash "install npms from package" do
   code <<-EOH
    #{node['nodejs']['dir']}/bin/npm install #{node[:app][:destination]}
  EOH
  only_if do ::File.exists?("#{node[:app][:destination]}/package.json") end
end

rightscale_marker :end