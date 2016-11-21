VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.ssh.insert_key = false

  config.vm.define 'db' do |db|
    db.vm.box = 'ubuntu/trusty64'
    db.vm.hostname = 'db'
    db.vm.network :private_network, ip: '192.168.0.5'

    db.vm.provision :hosts, :sync_hosts => true # need vagrant-hosts plugin
  end

  config.vm.define 'web' do |web|
    web.vm.box = 'ubuntu/trusty64'
    web.vm.hostname = 'web'
    web.vm.network :private_network, ip: '192.168.0.6'

    web.vm.provision :hosts, :sync_hosts => true # need vagrant-hosts plugin

    web.vm.provision 'ansible' do |ansible|
      ansible.limit = 'all'
      ansible.playbook = 'ansible/multiple_instance_roles.yml'

      ansible.groups = {
        'web' => ['web'],
        'db'  => ['db']
      }
    end
  end

end
