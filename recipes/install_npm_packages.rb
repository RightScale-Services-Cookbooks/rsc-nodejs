

rightscale_marker :begin

include_recipe "nodejs::npm"

bash "install npms from package" do
   code <<-EOH
    #{node['nodejs']['dir']}/bin/npm install /var/www/nginx-default
  EOH
end

rightscale_marker :end