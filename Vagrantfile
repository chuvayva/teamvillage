Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end

  config.vm.network "private_network", ip: "192.168.0.5"

  config.ssh.forward_agent = true

  config.vm.provision "shell", inline: "sudo -u vagrant mkdir /tmp/sockets"
end
