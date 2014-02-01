# paul's dotfiles
sudo apt-get install -y curl
sudo apt-get install -y ruby
mkdir code
mkdir github
cd github
git clone https://github.com/paulirish/dotfiles.git
cd dotfiles
./install-deps.sh
./sync.sh -f

