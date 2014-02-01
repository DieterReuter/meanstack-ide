curl https://gist.github.com/mudasobwa/5308070/raw/fdfac86e7c521b3333c101f135e5105c06da3894/prompt_mudasobwa_setup.sh -o ~/.zsh.prompts/prompt_mudasobwa_setup
cat << END >> ~/.zshrc
autoload -Uz promptinit
promptinit
prompt mudasobwa
END

mkdir -p ~/.fonts
cd ~/.fonts
curl -O https://gist.github.com/qrush/1595572/raw/51bdd743cc1cc551c49457fe1503061b9404183f/Inconsolata-dz-Powerline.otf
curl -O https://gist.github.com/qrush/1595572/raw/417a3fa36e35ca91d6d23ac961071094c26e5fad/Menlo-Powerline.otf
curl -O https://gist.github.com/qrush/1595572/raw/2eb22321d590265799λc5b166cd19f8358b0db1/mensch-Powerline.otf
fc-cache -vf ~/.fonts



