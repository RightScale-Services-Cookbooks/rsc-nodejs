#
# Cookbook Name:: rsc-nodejs
# Recipe:: default
#
# Copyright (C) 2014 RightScale, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

rightscale_marker :begin


include_recipe 'nodejs::default'

set[:app][:ip]=node[:cloud][:private_ips][0]
set[:app][:port]=node[:nginx][:configuration][:port]

log "  Application IP is #{node[:app][:ip]}"
log "  Application port is #{node[:app][:port]}"

unless node[:cloud][:provider]=='vagrant'
  right_link_tag "appserver:active=true"
  right_link_tag "appserver:listen_ip=#{node[:app][:ip]}"
  right_link_tag "appserver:listen_port=#{node[:app][:port]}"
end
rightscale_marker :end