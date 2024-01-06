# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  ######### VM2 ##########
  config.vm.define "vm2" do |vm2|

    ## BASE
    # vm2.vm.box = "vagrant-ansible-suite"
    vm2.vm.box = "jhoncytech/ansible-suite"
    vm2.vm.box_check_update = false
    vm2.vm.hostname = "ansible-01"

    ## SSH Config
    vm2.ssh.insert_key = false

    ## PORTS
    vm2.vm.network "forwarded_port", guest: 80, host: 8080
    vm2.vm.network "forwarded_port", guest: 443, host: 443
    vm2.vm.network "forwarded_port", guest: 3306, host: 3306
    vm2.vm.network "forwarded_port", guest: 22, host: 2223, id: "ssh"

    ## NETWORK
    vm2.vm.network "private_network", ip: "192.168.10.3", nic_type: "virtio", virtualbox__intnet: "keepcoding"

    ## VB
    vm2.vm.provider "virtualbox" do |vb|
      vb.name = "ansible-01"
      vb.memory = "1024"
      vb.cpus = "1"
      vb.default_nic_type = "virtio"

    end

  end 


  ######### VM3 ##########
  config.vm.define "vm3" do |vm3|

    ## BASE
    # vm3.vm.box = "vagrant-ansible-suite"
    vm3.vm.box = "jhoncytech/ansible-suite"
    vm3.vm.box_check_update = false
    vm3.vm.hostname = "ansible-02"

    ## SSH Config
    vm3.ssh.insert_key = false

    ## PORTS
    vm3.vm.network "forwarded_port", guest: 22, host: 2224, id: "ssh"
    vm3.vm.network "forwarded_port", guest: 80, host: 8082

    ## NETWORK
    vm3.vm.network "private_network", ip: "192.168.10.4", nic_type: "virtio", virtualbox__intnet: "keepcoding"

    ## VB
    vm3.vm.provider "virtualbox" do |vb|
      vb.name = "ansible-02"
      vb.memory = "1024"
      vb.cpus = "1"
      vb.default_nic_type = "virtio"

    end

  end 


  ######### VM4 ##########
  config.vm.define "vm4" do |vm4|

    ## BASE
    # vm4.vm.box = "vagrant-ansible-suite"
    vm4.vm.box = "jhoncytech/ansible-suite"
    vm4.vm.box_check_update = false
    vm4.vm.hostname = "ansible-03"

    ## SSH Config
    vm4.ssh.insert_key = false

    ## PORTS
    vm4.vm.network "forwarded_port", guest: 22, host: 2225, id: "ssh"
    vm4.vm.network "forwarded_port", guest: 80, host: 8084

    ## NETWORK
    vm4.vm.network "private_network", ip: "192.168.10.5", nic_type: "virtio", virtualbox__intnet: "keepcoding"

    ## VB
    vm4.vm.provider "virtualbox" do |vb|
      vb.name = "ansible-03"
      vb.memory = "1024"
      vb.cpus = "1"
      vb.default_nic_type = "virtio"

    end

  end 


  ######### VM5 ##########
  config.vm.define "vm5" do |vm5|

    ## BASE
    # vm5.vm.box = "vagrant-ansible-suite"
    vm5.vm.box = "jhoncytech/ansible-suite"
    vm5.vm.box_check_update = false
    vm5.vm.hostname = "ansible-04"

    ## SSH Config
    vm5.ssh.insert_key = false

    ## PORTS
    vm5.vm.network "forwarded_port", guest: 22, host: 2226, id: "ssh"
    vm5.vm.network "forwarded_port", guest: 80, host: 8085

    ## NETWORK
    vm5.vm.network "private_network", ip: "192.168.10.6", nic_type: "virtio", virtualbox__intnet: "keepcoding"

    ## VB
    vm5.vm.provider "virtualbox" do |vb|
      vb.name = "ansible-04"
      vb.memory = "1024"
      vb.cpus = "1"
      vb.default_nic_type = "virtio"

    end

  end 

  ######### VM1 - SERVER ##########
  config.vm.define "vm1" do |vm1|

    ## BASE
    # vm1.vm.box = "vagrant-ansible-suite"
    vm1.vm.box = "jhoncytech/ansible-suite"
    vm1.vm.box_check_update = false
    vm1.vm.hostname = "ansible-srv"

    ## SSH Config
    vm1.ssh.insert_key = false

    ## PORTS
    vm1.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh"

    ## NETWORK
    vm1.vm.network "private_network", ip: "192.168.10.2", nic_type: "virtio", virtualbox__intnet: "keepcoding"

    ## VOLUMES
    vm1.vm.synced_folder "config-files", "/var/config-files", owner: "vagrant", group: "vagrant"
    
    ## VB
    vm1.vm.provider "virtualbox" do |vb|
      vb.name = "ansible-server"
      vb.memory = "2048"
      vb.cpus = "2"
      vb.default_nic_type = "virtio"

    end

    ## PROVISIONING SCRIPT
    vm1.vm.provision "shell", path: "provisioning.sh"

  end 

end
