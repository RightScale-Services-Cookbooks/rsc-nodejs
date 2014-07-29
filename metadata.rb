name             'rsc-nodejs'
maintainer       'RightScale, Inc.'
maintainer_email 'cookbooks@rightscale.com'
license          'Apache 2.0'
description      'Installs/Configures rsc-nodejs'
long_description 'Installs/Configures rsc-nodejs for use with Rightscale servers'
version          '0.2.0'

depends 'nodejs', '1.3.0'
depends "rightscale"
depends "repo"
depends "logrotate"


recipe "rsc-nodejs::default", "Install node.js for use with RightScale Servers" 
recipe "rsc-nodejs::install_npm_packages", "Install npm packages"
recipe "rsc-nodejs::do_update_code", "Update code from repository" 
recipe "rsc-nodejs::start_npm", "run npm start on destination path" 
recipe "rsc-nodejs::stop_npm", "run npm stop on destination path" 
recipe "rsc-nodejs::restart_npm", "run npm restart on destination path" 
recipe "rsc-nodejs::logrotate", "setup logrotate for node" 
recipe "rsc-nodejs::setup_vhost", "Setup the vhost with the application specifics. " 

attribute "nodejs/version",
  :display_name => "nodejs version",
  :description => "Indicate which version of nodejs to install",
  :required => "optional",
  :recipes => ['rsc-nodejs::default']

attribute "npm/version",
  :display_name => "npm version",
  :description => "Indicate which version of npm to install",
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

attribute "nodejs/environment",
  :display_name => "name of the application",
  :description => "the name of the application.  appended to repo/default/destination",
  :required => "optional",
  :recipes => ['rsc-nodejs::default']