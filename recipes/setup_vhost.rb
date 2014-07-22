rightscale_marker :begin


template "#{node[:nginx][:directory]}/default.conf" do
  source "default.conf.erb"
  mode 0644
  owner "root"
  group "root"
  variables({
     :port => node[:app][:port],
     :destination => node[:app][:destination]
  })
end

service "nginx" do
  action :restart
end

rightscale_marker :end