# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "chavo1/bionic64base"
  config.vm.define "go" do |go|
    go.vm.hostname = "go"
    go.vm.network "private_network", ip: "192.168.56.56"
    go.vm.provision "shell",inline: "cd /vagrant ; bash scripts/install_redis.sh"
    go.vm.provision "shell",inline: "cd /vagrant ; bash scripts/install_go.sh"

  end
end
