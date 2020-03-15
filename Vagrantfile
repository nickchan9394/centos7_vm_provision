$script = <<-SCRIPT

echo 'try to install puppet agent'
if sudo yum list installed "puppet-agent"; then
  echo 'puppet-agent' already installed.
  true
else
  echo 'add repository for puppet agent'
  sudo rpm -Uvh https://yum.puppet.com/puppet6-release-el-7.noarch.rpm
  
  if sudo yum install -y puppet-agent; then
    echo 'puppet-agent' installed.
  else
    false
  fi
fi

SCRIPT

Vagrant.configure("2") do |config|

  config.vm.hostname="centos7-dev"
  config.vm.box = "centos/7"
  config.vm.synced_folder "./sync", "/sync", :nfs => true

  config.vm.provision "bootstrap", type: "shell", run: "once", inline: $script

  config.vm.provision "puppet" do |puppet|
    puppet.module_path = "./manifests/modules"
  end

  config.vm.provider "hyperv" do |hv|
    hv.memory = "2048"
    hv.cpus=4
    hv.vmname="centos7-dev"
    hv.enable_virtualization_extensions = true
    hv.linked_clone = true
  end
end