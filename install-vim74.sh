# Install VIM 7.4 on Ubuntu 12.04 LTS

# install VIM 7.4
#sudo add-apt-repository -y ppa:fcwu-tw/ppa
#sudo apt-get update -y
#sudo apt-get install -y vim
#sudo apt-get install -y curl
#sudo apt-get install -y rake

# install VIM NERDTree extensions
cd /home/vagrant/
sudo -u vagrant mkdir -p .vim/bundle
cd .vim/bundle
sudo -u vagrant git clone https://github.com/scrooloose/nerdtree.git
sudo -u vagrant git clone https://github.com/jistr/vim-nerdtree-tabs.git


cat <<CONFIG | sudo -u vagrant tee -a /home/vagrant/.vimrc 

" ---DR--- configure NERDTree extensions
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
CONFIG


