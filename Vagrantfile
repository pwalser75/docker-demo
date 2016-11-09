# -*- mode: ruby -*-
# vi: set ft=ruby :

# Specify Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

# Create and boxure the VM(s)
Vagrant.configure(VAGRANTFILE_API_VERSION) do |box|

	# Assign a friendly name to this host VM
	box.vm.hostname = "docker-host"

	# Skip checking for an updated Vagrant box
	box.vm.box_check_update = false

	# Always use Vagrant's default insecure key
	box.ssh.insert_key = false

	# Spin up a "host box" for use with the Docker provider
	# and then provision it with Docker
	box.vm.box = "ubuntu/trusty64"
	box.vm.provision "docker"

	box.vm.synced_folder ".", "/vagrant"

	# workaround for disabled ipv4 forwarding on some win 10 installations
	box.vm.provision "shell", run: "always", inline:
		<<-SCRIPT
		echo "enabling ipv4 forwarding (net.ipv4.ip_forward)" 
		sudo sysctl -wq net.ipv4.ip_forward=1
	SCRIPT
end
