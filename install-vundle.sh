sudo apt-get install -y build-essential cmake python-dev
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
cp ~/.vimrc /vagrant/vundle.vimrc.save
cp /vagrant/vundle.vimrc ~/.vimrc

git clone https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
##./install.sh --clang-completer
./install.sh

vim +BundleInstall +qall

