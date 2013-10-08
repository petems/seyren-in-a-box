Vagrant::Config.run do |config|

  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.forward_port 80, 8080
  config.vm.forward_port 2003, 2003
  config.vm.forward_port 9090, 9090
  config.vm.forward_port 8125, 8125, { :protocol => 'udp' }

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file  = "base.pp"
    puppet.module_path    = "puppet/modules"
  end
end
