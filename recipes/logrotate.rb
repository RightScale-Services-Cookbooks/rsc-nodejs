rightscale_marker :begin
log "Setup Logrotate for nodejs"
logrotate_app "nodejs npm" do
  cookbook "logrotate"
  path "/var/log/nginx/*.log"
  frequency "weekly"
  rotate 30
  create "644 root adm"
end
rightscale_marker :end