# Master vars
Vagrant.configure("2") do |config|
  # Box de Ansible (master)
  config.vm.define 'master' do |master|
    master.vm.box = "generic/centos8"
    master.vm.synced_folder ".", "/vagrant"
    master.vm.provider "virtualbox" do |v|
      v.memory = 4096
    end

    master.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "ansible/playbook.yml"
      ansible.extra_vars = {
          master_ip: "172.17.167.11",
      }
    end

    master.vm.network "private_network", ip: "172.17.167.11"
    master.vm.hostname = 'custom-playbook-master'
  end
end