name             'rsc-nodejs'
maintainer       'RightScale, Inc.'
maintainer_email 'cookbooks@rightscale.com'
license          'Apache 2.0'
description      'Installs/Configures rsc-nodejs'
long_description 'Installs/Configures rsc-nodejs for use with Rightscale servers'
version          '0.1.0'

depends 'nodejs', '1.3.0'
depends "rightscale"

recipe "rsc-nodejs::default", "Install node.js for use with RightScale Servers" 
recipe "rsc-nodejs::install_npm_packages", "Install npm packages"
recipe "rsc-nodejs::do_update_code", "Update code from repository" 
