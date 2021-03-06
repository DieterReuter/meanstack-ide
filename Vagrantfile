# -*- mode: ruby -*-
# vi: set ft=ruby :

#---script---
#(running as user="root")
$script = <<SCRIPT
set -x 

# switch to German keyboard layout
export DEBIAN_FRONTEND=noninteractive
sed -i 's/"us"/"de"/g' /etc/default/keyboard
apt-get install -y console-common
install-keymap de

# set to UTF8 locale for later powerline 
sudo update-locale LANG=en_US.uft8 LC_ALL=en_US.utf8

# set ubuntu download mirror
# Aachen:   10Gbit, http://ftp.halifax.rwth-aachen.de/ubuntu/ 
# Erlangen: 1GBit,  http://ftp.fau.de/ubuntu/ 
sudo sed -i 's,http://us.archive.ubuntu.com/ubuntu/,http://ftp.halifax.rwth-aachen.de/ubuntu/,' /etc/apt/sources.list
sudo sed -i 's,http://security.ubuntu.com/ubuntu,http://ftp.halifax.rwth-aachen.de/ubuntu/,' /etc/apt/sources.list
apt-get update -y

# set timezone to German timezone
echo "Europe/Berlin" | tee /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# update/upgrade and install Ubuntu desktop
apt-get upgrade -y
apt-get install -y linux-headers-$(uname -r)
apt-get install -y --no-install-recommends ubuntu-desktop
apt-get install -y gnome-panel
apt-get install -y unity-lens-applications
sudo -E -u vagrant gconftool -s /apps/gnome-terminal/profiles/Default/use_system_font -t bool false

# remove Ubuntu automatic update/upgrade
apt-get purge -y unattended-upgrades

# install git
sudo apt-get install -y git

#-----------------------------------------

###--debug---
#if [ 0 -eq 1 ]; then
if [ 1 -eq 1 ]; then

# install latest MongoDB version
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list
apt-get update -y
apt-get install -y mongodb-10gen

# install latest Node.js and NPM version
apt-get install -y python-software-properties python g++ make
add-apt-repository -y ppa:chris-lea/node.js
apt-get update -y
apt-get install -y nodejs

# install VIM 7.4
sudo add-apt-repository -y ppa:fcwu-tw/ppa
sudo apt-get update -y
sudo apt-get install -y vim
sudo apt-get install -y vim-gnome --force-yes
sudo apt-get install -y curl
sudo apt-get install -y rake
sudo apt-get install -y zsh

# install Python pip
sudo apt-get install -y python-pip

# install latest Node.js Modules
npm install -g express
npm install -g bower
npm install -g grunt-cli
npm install -g yo
npm install -g generator-webapp
npm install -g generator-angular
npm install -g forever
npm install -g nodemon
npm install -g http-console

fi
###--debug---

# set default for gem/install to no-doc/no-ri
echo "gem: --no-document --no-rdoc --no-ri" | tee ~/.gemrc
echo "gem: --no-document --no-rdoc --no-ri" | sudo -u vagrant tee /home/vagrant/.gemrc
gem install compass
gem install rake

#-----------------------------------------

# install Chromium browser
apt-get install -y chromium-browser

# install some useful devtools
apt-get install -y screenkey

# install wireshark and allow user vagrant to use it
apt-get install -y wireshark
addgroup -system wireshark
chown root:wireshark /usr/bin/dumpcap
setcap cap_net_raw,cap_net_admin=eip /usr/bin/dumpcap
usermod -a -G wireshark vagrant

# start desktop (using autologin for user "vagrant")
echo "autologin-user=vagrant" | tee -a /etc/lightdm/lightdm.conf

# create Launcher with our preferred applications
# (installed Applications see /usr/share/applications/*.desktop)
cat <<GSCHEMA | sudo tee /usr/share/glib-2.0/schemas/10_local-unity-launcher.gschema.override
[com.canonical.Unity.Launcher]
favorites=['nautilus-home.desktop', \
           'chromium-browser.desktop', \
           'gnome-terminal.desktop', \
           'gvim.desktop', \
           'wireshark.desktop', \
           'ubuntu-software-center.desktop', \
           'gnome-control-center.desktop' \
]
GSCHEMA
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

# setup VBox Guest Additions
/etc/init.d/vboxadd-x11 setup
service lightdm restart

# install external resources
# install ssh key if provided at host
if [ -f /vagrant/resources/.ssh/id_rsa ]; then
  if [ ! -d /home/vagrant/.ssh ]; then
    sudo -u vagrant mkdir /home/vagrant/.ssh
    chmod 700 /home/vagrant/.ssh
  fi
  if [ ! -f /home/vagrant/.ssh/id_rsa ]; then
    sudo -u vagrant cp /vagrant/resources/.ssh/id_rsa* /home/vagrant/.ssh/
    chmod 600 /home/vagrant/.ssh/id_rsa*
  fi
fi

# install .extra
if [ -f /vagrant/resources/.extra ]; then
  sudo -u vagrant cp /vagrant/resources/.extra /home/vagrant/.extra
fi
SCRIPT
#---script---


# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = "meanstack-ide-precise64"
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  
  if ENV['_system_type'] == 'Darwin'
    # Mac OSX Host (don't use restricted TCP ports)
    config.vm.network :forwarded_port, :host => 8888, :guest => 8888
    config.vm.network :forwarded_port, :host => 4443, :guest => 4443
    config.vm.network :forwarded_port, :host => 6631, :guest => 6631
    config.vm.network :forwarded_port, :host => 5515, :guest => 5515
    config.vm.network :forwarded_port, :host => 9100, :guest => 9100
  else
    # Windows Host (not a problem to use restricted TCP ports)
    config.vm.network :forwarded_port, :host => 8888, :guest => 8888
    config.vm.network :forwarded_port, :host => 4443, :guest => 4443
    config.vm.network :forwarded_port, :host => 6631, :guest => 6631
    config.vm.network :forwarded_port, :host => 5515, :guest => 5515
    config.vm.network :forwarded_port, :host => 9100, :guest => 9100
  end

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "1024", "--cpus", "1"]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--vram", "32"]
  end

  # Provision using the shell to install
  config.vm.provision "shell", inline: $script
  
end
