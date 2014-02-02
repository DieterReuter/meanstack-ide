# from http://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin
# wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
# sudo mv PowerlineSymbols.otf /usr/share/fonts/

#git clone https://github.com/Lokaltog/powerline-fonts.git
#sudo mv powerline-fonts/UbuntuMono/ /usr/share/fonts/truetype/
# sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/


# set to UTF8 locale
sudo update-locale LANG=en_US.uft8 LC_ALL=en_US.utf8

cd /usr/share/fonts/ && sudo git clone https://github.com/scotu/ubuntu-mono-powerline.git && cd ~

sudo fc-cache -vf

cd
sudo npm install -g powerline
cat <<'BASHRC' >> ~/.bashrc
function _update_ps1() {
   export PS1="$(powerline $? --shell bash --depth 4)"
}
export PROMPT_COMMAND="_update_ps1"
BASHRC

echo "You have to restart your desktop now."
