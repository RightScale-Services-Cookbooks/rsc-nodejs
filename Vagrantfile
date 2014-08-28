Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.hostname = "nodejs-berkshelf"

  # Every Vagrant virtual environment requires a box to build off of.   
  #config.vm.box = "opscode-ubuntu-12.04"
  #config.vm.box = "centos6.5"
  config.vm.box ="opscode-centos-6.5"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  #config.vm.box_url = "https://opscode-vm-bento.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_provisionerless.box"
  config.vm.box_url ="http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-6.5_chef-provisionerless.box"
  
  # Assign this VM to a host-only network IP, allowing you to access it
  # via the IP. Host-only networks can talk to the host machine as well as
  # any other machines on the same network, but cannot be accessed (through this
  # network interface) by any external networks.
  config.vm.network :private_network, ip: "33.33.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.

  # config.vm.network :public_network

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
   config.vm.synced_folder "~/vagrant", "/vagrant", disabled: true

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # The path to the Berksfile to use with Vagrant Berkshelf
  # config.berkshelf.berksfile_path = "./Berksfile"

  # Enabling the Berkshelf plugin. To enable this globally, add this configuration
  # option to your ~/.vagrant.d/Vagrantfile file
  config.berkshelf.enabled = true

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to exclusively install and copy to Vagrant's shelf.
  # config.berkshelf.only = []

  config.omnibus.chef_version = :latest

  # An array of symbols representing groups of cookbook described in the Vagrantfile
  # to skip installing and copying to Vagrant's shelf.
  # config.berkshelf.except = []

  #config.vm.provision "shell",
  #  inline: "yum -y install java-1.7*"

  config.vm.provision :chef_solo do |chef|
    #chef.log_level = 'debug'
    #chef.verbose_logging = true
    chef.json = {
      :vagrant => {
        :box_name => 'rsc-nodejs'
      },
      cloud:{private_ips: ['1.2.3.4'],provider: 'vagrant'},
       nodejs:{
        install_method: 'source',
        version: '0.10.29',
        app_name: 'myapp',
        environment: 'development'
    },
    repo:{default:{
    destination: '/home/webapps',
    repository: 'https://github.com/heroku/node-js-sample.git',
    version: 'master',
    provider: 'repo_git',
   perform_action: 'pull',
    },
     }
    }
    
    chef.run_list = [
        "recipe[git]",
        "recipe[repo::default]",
        "recipe[rsc-nodejs::default]",
        "recipe[rsc-nodejs::do_update_code]", 
        "recipe[rsc-nodejs::install_npm_packages]", 
        "recipe[rsc-nodejs::npm_start]", 
    ]
  end
end