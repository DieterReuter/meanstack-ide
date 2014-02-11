# install ssh key if provided at host
if [ -f /vagrant/resources/.ssh/id_rsa ]; then
  if [ ! -d ~/.ssh ]; then
    mkdir ~/.ssh
    chmod 700 ~/.ssh
  fi
  if [ ! -f ~/.ssh/id_rsa ]; then
    cp /vagrant/resources/.ssh/id_rsa* ~/.ssh/
    chmod 600 ~/.ssh/id_rsa*
  fi
fi

# install .extra
if [ -f /vagrant/resources/.extra ]; then
  cp /vagrant/resources/.extra ~/.extra
fi

