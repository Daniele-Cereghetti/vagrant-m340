# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
   
    BOX_IMAGE="ubuntu/impish64" 

    PROXY_HTTP = "http://10.0.2.2:5865"
    PROXY_HTTPS = "http://10.0.2.2:5865"
    PROXY_EXCLUDE = "localhost,127.0.0.1"

    BASE_INTNET = "10.10.20"

    config.vm.define "web" do |subconfig|
      subconfig.vm.box =  BOX_IMAGE
   
      subconfig.proxy.http = PROXY_HTTP
      subconfig.proxy.https = PROXY_HTTPS
      subconfig.proxy.no_proxy = PROXY_EXCLUDE
   
      subconfig.vm.network "private_network", ip: "#{BASE_INTNET}.10", virtualbox__intnet: true
      subconfig.vm.network "forwarded_port", guest: 80, host:9080
   
      subconfig.vm.hostname = "mmweb.cpt.local"
      subconfig.vm.provider "virtualbox" do |vb|
          vb.name = "MMWeb"
	  vb.memory = "1024"
	  vb.cpus = 1
      end

      subconfig.vm.synced_folder "http/", "/var/www/http"
   
      subconfig.vm.provision "shell", path: "./provision_update.sh"
      subconfig.vm.provision "shell", path: "./provision_apache.sh"
      subconfig.vm.provision "shell", path: "./provision_php.sh"
    end

    config.vm.define "db" do |subconfig|
      subconfig.vm.box =  BOX_IMAGE
   
      subconfig.proxy.http = PROXY_HTTP
      subconfig.proxy.https = PROXY_HTTPS
      subconfig.proxy.no_proxy = PROXY_EXCLUDE
      
      subconfig.vm.network "private_network", ip: "#{BASE_INTNET}.15", virtualbox__intnet: true    
      
      subconfig.vm.hostname = "mmdb.cpt.local"
      subconfig.vm.provider "virtualbox" do |vb|
          vb.name = "MMDb"
	  vb.memory = "1024"
	  vb.cpus = 1
      end
      
      subconfig.vm.provision "shell", path: "./provision_update.sh"
      subconfig.vm.provision "shell", path: "./provision_mysql.sh"
   end
     
end

