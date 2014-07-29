righscale_marker :begin
log "Setup Logrotate for nodejs"
logrotate_app "nodejs npm" do
  cookbook "logrotate"
  path "/var/log/nginx/nodejs.log"
  frequency "weekly"
  rotate 30
  create "644 root adm"
end