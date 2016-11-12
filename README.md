# docker-demo
Docker demo environment for experiments

## Requirements
This demo requires the following software to be installed on your machine:

* **Oracle VM Virtualbox**   
Hypervisor, on which we'll run our VM containing Docker.  
[https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
 
* **Vagrant**  
Software for building and maintaining portable virtual development environments.  
[https://releases.hashicorp.com/vagrant/1.8.5](https://releases.hashicorp.com/vagrant/1.8.5)  
*Note: don't use version 1.8.6 (contains a bug preventing vagrant up from completing)*
* **Git**  
Concurrent versioning system  
[https://git-scm.com/downloads](https://git-scm.com/downloads)


## Vagrant
This project contains a `VagrantFile` configuration file which helps provisioning a docker host using Vagrant.

Commands:

* `vagrant up` boots the VM
* `vagrant ssh` connects to the VM using SSH
* `vagrant halt` stops the VM

Networking settings (IP address and port forwarding) are configured in the `VagrantFile`.

## Docker
Once connected to the VM (using `vagrant ssh`), you can start working with docker.

As a simple example to check if your setup is working, we search, install and run [NGINX](https://www.nginx.com) (note: you can also only use the last command, which will search and pull the latest version automatically):

    docker search nginx
    docker pull nginx
    docker run -d --name nginx-test -p 80:80 nginx
To check if your nginx instance called 'nginx-test' is running:

    docker ps

You can find out the IP address of the docker container on your docker host with:

    docker inspect nginx-test | grep IPAddress

On your local machine, you should now be able to access the welcome page of **NGINX** on 
[http://192.168.11.11:8000](http://192.168.11.11:8000) (see `Vagrantfile`, where we configured the IP address and port forwarding)

The docker container can now be stopped and started any time:

    docker stop nginx-test
    docker start nginx-test

To remove the container:

    docker rm nginx-test

## MySQL on Docker

To install and run MySQL as a docker container (providing the root password as an environment variable):

    docker run --name mysql-test -e MYSQL_ROOT_PASSWORD=secret007 -p 3306:3306 -d mysql