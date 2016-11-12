Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 443, host: 8443

  config.vm.provision "shell",
    inline: "mkdir /tmp/sockets"

  config.trigger.after [:provision, :up, :reload] do
    system('echo "
    rdr pass inet proto tcp from any to any port 80 -> 127.0.0.1 port 8080  
    rdr pass inet proto tcp from any to any port 443 -> 127.0.0.1 port 8443  
    " | sudo pfctl -ef - > /dev/null 2>&1; echo "==> Fowarding Ports: 80 -> 8080, 443 -> 8443"')  
  end

  config.trigger.after [:halt, :destroy] do
    system("sudo pfctl -ef /etc/pf.conf > /dev/null 2>&1; echo '==> Removing Port Forwarding'")
  end
end
