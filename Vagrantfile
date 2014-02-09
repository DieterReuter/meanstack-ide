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
apt-get install -y --no-install-recommends ubuntu-desktop
apt-get install -y gnome-panel
apt-get install -y unity-lens-applications
sudo -E -u vagrant gconftool -s /apps/gnome-terminal/profiles/Default/use_system_font -t bool false


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
sudo apt-get install -y curl
sudo apt-get install -y rake
sudo apt-get install -y zsh

# install Python pip
sudo apt-get install -y python-pip

# install latest Node.js Modules
npm install -g bower
npm install -g grunt-cli
npm install -g yo
npm install -g generator-webapp
npm install -g generator-angular

fi
###--debug---

# set default for gem/install to no-doc/no-ri
echo "gem: --no-document --no-rdoc --no-ri" | tee ~/.gemrc
echo "gem: --no-document --no-rdoc --no-ri" | sudo -u vagrant tee /home/vagrant/.gemrc
gem install compass
gem install rake

#-----------------------------------------

# setup development: GIT, VIM/GVIM, ...
apt-get install -y git vim vim-gnome

# install powerline fonts
cd /usr/share/fonts/ && git clone https://github.com/scotu/ubuntu-mono-powerline.git
cd /home/vagrant
fc-cache -vf

npm install -g powerline
sudo -E -u vagrant cat <<'BASHRC' >> /home/vagrant/.bashrc
function _update_ps1() {
   export PS1="$(powerline $? --shell bash --depth 4)"
}
export PROMPT_COMMAND="_update_ps1"
BASHRC


# start desktop (using autologin for user "vagrant")
echo "autologin-user=vagrant" | tee -a /etc/lightdm/lightdm.conf
service lightdm restart

# install Chromium  browser
apt-get install -y chromium-browser

# create Launcher with our preferred applications
# (installed Applications see /usr/share/applications/*.desktop)
sleep 10
sudo -E -u vagrant DISPLAY=:0.0 gsettings set com.canonical.Unity.Launcher favorites "['nautilus-home.desktop', 'chromium-browser.desktop', 'gnome-terminal.desktop', 'gvim.desktop', 'ubuntu-software-center.desktop', 'gnome-control-center.desktop']"
sleep 10

# setup VBox Guest Additions
/etc/init.d/vboxadd-x11 setup
service lightdm restart

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
    config.vm.network :forwarded_port, :host => 80, :guest => 8888
    config.vm.network :forwarded_port, :host => 443, :guest => 4443
    config.vm.network :forwarded_port, :host => 631, :guest => 6631
    config.vm.network :forwarded_port, :host => 515, :guest => 5515
    config.vm.network :forwarded_port, :host => 9100, :guest => 9100
  end

  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "1024", "--cpus", "1"]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
  end

  # Provision using the shell to install
  config.vm.provision "shell", inline: $script
  
end
