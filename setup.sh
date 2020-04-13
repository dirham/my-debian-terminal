echo 'check for update'
apt update
echo 'running upgrade'
apt upgrade -y

echo 'installing zsh...'
apt install zsh

echo 'Installing powerline and fonts'
apt-get install powerline fonts-powerline -y

echo 'start install Oh My Zsh...'

if ! [ -x "$(command -v git)" ]; then
  echo 'git not installed.'
  echo 'start install git...'
  apt install git -y

  echo 'clone Oh My Zsh'
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  echo 'configure zsh...'
  cp .zshrc ~/.zshrc
  echo 'new config copied to ~/.zshrc, edit it as you want'

  echo 'start clone and config PowerLevel9k!'
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
else
  echo 'clone oh my zsh
  git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  echo 'configure zsh...'
  cp .zshrc ~/.zshrc
  echo 'new config copied to ~/.zshrc, edit it as you want'
  echo 'start clone and config PowerLevel9k!'
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi


echo 'create ~/.fonts directory if not exists'
mkdir -p ~/.fonts

echo 'check for wget command'
if ! [ -x "$(command -v wget)" ]; then
  echo 'wget command  is not installed.' >&2
  echo 'start install wget...'
  apt install wget -y
  echo 'download Nerd fonts'
  wget -P ~/.fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
  echo 'create font cache'
  fc-cache -f -v
else
  echo 'running download Nerd fonts'
  wget -P ~/.fonts https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
  echo 'create font cache'
  fc-cache -f -v
fi

echo 'Done!'
echo 'Edit your terminal profiles and set the font to Hack Nerd Font Regurlar'
