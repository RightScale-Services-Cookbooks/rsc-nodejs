name             'rsc-nodejs'
maintainer       'RightScale, Inc.'
maintainer_email 'cookbooks@rightscale.com'
license          'Apache 2.0'
description      'Installs/Configures rsc-nodejs'
long_description 'Installs/Configures rsc-nodejs for use with Rightscale servers'
version          '0.1.0'

depends 'nodejs', '1.3.0'
depends "rightscale"
depends "repo"

recipe "rsc-nodejs::default", "Install node.js for use with RightScale Servers" 
recipe "rsc-nodejs::install_npm_packages", "Install npm packages"
recipe "rsc-nodejs::do_update_code", "Update code from repository" 
recipe "rsc-nodejs::setup_vhost", "Setup the vhost with the application specifics. " 

attribute "nodejs/version",
  :display_name => "nodejs version",
  :description => "Indicate which version of nodejs to install",
  :required => "optional",
  :recipes => ['rsc-nodejs::default']

attribute "app/port",
  :display_name => "application port",
  :description => "Indicate which port to use",
  :required => "optional",
  :recipes => ['rsc-nodejs::default']

attribute "nodejs/app_name",
  :display_name => "name of the application",
  :description => "the name of the application.  appended to repo/default/destination",
  :required => "optional",
  :recipes => ['rsc-nodejs::default']