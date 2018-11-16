# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

		# Lets give our box its proper name
		config.vm.define "ubuntu" do |ubuntu|

			# Specifically what box
  			ubuntu.vm.box = "ubuntu/xenial64"

  			# Since this will only be used to spin up the container web infrastructure locally, this setting will suffice ~M.K.
  			ubuntu.vm.network "forwarded_port", guest: 3000, host: 3000, host_ip: "127.0.0.1"

  			# Lets sync up web infrast. folders from host to guest OS's
  			ubuntu.vm.synced_folder "./webInfrast/tomcat", "/web-infrast/tomcat"
  			ubuntu.vm.synced_folder "./webInfrast/httpd", "/web-infrast/httpd"

  			# Lets add/change some configs for the VM
  			ubuntu.vm.provider "vbox" do |vb|
  				vb.cpus = 1	
  				vb.memory = 2048
  			end

 			# Setup docker using vagrant's built-in provision system
  			ubuntu.vm.provision :docker

  			# Enable Docker Remote API via shell script
  			ubuntu.vm.provision :shell, path: "./enable-docker-remote-api.sh"
  		end
end
