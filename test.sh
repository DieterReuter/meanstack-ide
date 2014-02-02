sudo npm install -g powerline
sudo -E -u vagrant cat << 'BASHRC' >> /home/vagrant/.bashrc
  function _update_ps1() {
    export PS1="$(powerline $? --shell bash --depth 4)"
  }
BASHRC
export PROMPT_COMMAND="_update_ps1"

