

log "  Updating project code repository"
log "  Starting code update sequence"
log "  Current project doc root is set to #{[:app][:destination]}"
log "  Downloading project repo"

# Calling "repo" LWRP to download remote project repository
# See cookbooks/repo/resources/default.rb for the "repo" resource.
repo "default" do
  destination [:app][:destination]
  action node[:repo][:default][:perform_action].to_sym
  app_user node[:app][:user]
  repository node[:repo][:default][:repository]
  persist false
end
