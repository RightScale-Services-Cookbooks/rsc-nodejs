rightscale_marker :begin

node.override[:app][:destination] = "#{node[:repo][:default][:destination]}/#{node[:nodejs][:app_name]}"

log "  Updating project code repository"
log "  Starting code update sequence"
log "  Current project doc root is set to #{node[:app][:destination]}"
log "  Downloading project repo"

# Calling "repo" LWRP to download remote project repository
# See cookbooks/repo/resources/default.rb for the "repo" resource.
directory "#{node[:repo][:default][:destination]}" do
  
end
repo "default" do
  destination "#{node[:app][:destination]}"
  action node[:repo][:default][:perform_action].to_sym
  app_user node[:app][:user]
  repository node[:repo][:default][:repository]
  persist false
end


rightscale_marker :end
