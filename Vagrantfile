# -*- mode: ruby -*-
# vi: set ft=ruby :

# Specify Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

# Create and boxure the VM(s)
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

	# Assign a friendly name to this host VM
	config.vm.hostname = "docker-host"

	# Skip checking for an updated Vagrant box
	config.vm.box_check_update = false

	# VM configuration for virtualbox (add other provider configs as needed)
	config.vm.provider "virtualbox" do |vm|
	  vm.memory = 2048
	  vm.cpus = 2
	end

	# Always use Vagrant's default insecure key
	config.ssh.insert_key = false
	
	# Provisioning script
	config.vm.provision "shell", path: "provision.sh", privileged: true
	
	# network settings
	config.vm.hostname = "docker-host"
	config.vm.network "private_network", ip: "192.168.11.11"
	# config.vm.network :forwarded_port, guest: 80, host: 10080
	# config.vm.network :forwarded_port, guest: 3306, host: 13306

	# Spin up a "host box" for use with the Docker provider
	# and then provision it with Docker
	config.vm.box = "ubuntu/trusty64"
	config.vm.provision "docker"

	# synched folder settings (currently disabled)
	config.vm.synced_folder ".", "/vagrant", disabled: true
	
	# workaround for disabled ipv4 forwarding on some win 10 installations
	config.vm.provision "shell", run: "always", inline:
		<<-SCRIPT
		echo "enabling ipv4 forwarding (net.ipv4.ip_forward)" 
		sudo sysctl -wq net.ipv4.ip_forward=1
	SCRIPT
end
