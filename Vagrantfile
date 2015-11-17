# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "puppetlabs/centos-7.0-64-puppet"

  config.vm.box_version = "1.0.2"

  config.vm.provision :shell, path: "vim-install.sh"

  config.vm.network :private_network, :ip => "192.168.50.10", :auto_config => true

      config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--natdnshostresolver1', 'on']
    vb.customize ['modifyvm', :id, '--natdnsproxy1', 'on']
  end
end
