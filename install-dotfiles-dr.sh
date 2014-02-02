# ---Install DR .dotfiles ---
# (run as user)

# clone Paul's dotfiles
cd ~/
mkdir code
cd code
git clone https://github.com/paulirish/dotfiles.git
cd dotfiles
./install-deps.sh
./sync.sh -f

# DR VIM74 NERDTree extensions
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/jistr/vim-nerdtree-tabs.git

# DR VIM74 define new NERDTree shortkeys
# - show NERDTree on VIM startup only if we have no file
# - toogle NERDTree on/off with key Ctrl-N (tested on Mac OSX, Ubuntu)
cat <<CONFIG | sudo -u vagrant tee -a /home/vagrant/.vimrc 

" ---DR--- configure NERDTree extensions
autocmd vimenter * if !argc() | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
CONFIG

