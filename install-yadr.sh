# Install YADR on Ubuntu 12.04 LTS

# install VIM 7.4
sudo add-apt-repository -y ppa:fcwu-tw/ppa
sudo apt-get update -y
sudo apt-get install -y vim

# first, we need curl and rake
sudo apt-get install -y curl
sudo apt-get install -y rake
#sudo gem install rake
sudo apt-get install -y zsh

# now, install YADR 
# sh -c "`curl -fsSL https://raw.github.com/skwp/dotfiles/master/install.sh`"

# Install YADR
git clone https://github.com/skwp/dotfiles ~/.yadr
# patch out line ending
sed -i 's/set list listchars/"set list listchars/g' ~/.yadr/vimrc
echo ":set g:session_autosave = 'no'" >> ~/.yadr/vimrc
cd ~/.yadr 
SHELL=zsh rake install


cd
# Create a ~/.secrets file (required by YADR)
touch ~/.secrets

# Install the prompt
curl https://raw.github.com/davidjrice/prezto_powerline/master/prompt_powerline_setup > ~/.zsh.prompts/prompt_powerline_setup

# Install Solarized
git clone https://github.com/altercation/solarized
cd solarized

# e.g. for iTerm
cd iterm2-colors-solarized/
open Solarized\ Dark.itermcolors
# this should load the colours for iTerm, but they are not configured yet

# in iTerm2 open preferences 
#   profiles > default > colours > load presets > Solarized Dark
#   profiles > default > terminal > report terminal type > "xterm-256color"

# Enable
echo "prompt powerline" > ~/.zsh.after/prompt.zsh
