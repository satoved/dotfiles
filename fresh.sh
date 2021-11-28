#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Install PHP extensions with PECL
pecl install imagick redis

# Install global Composer packages
composer global require laravel/installer laravel/valet beyondcode/expose

# Install Laravel Valet
$HOME/.composer/vendor/bin/valet install

# Create a Sites directory
# This is a default directory for macOS user accounts but doesn't comes pre-installed
mkdir $HOME/Sites
valet park $HOME/Sites

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/shell/.zshrc $HOME/.zshrc

# Add global gitignore
ln -s $HOME/.dotfiles/shell/.global-gitignore $HOME/.global-gitignore
git config --global core.excludesfile $HOME/.global-gitignore

# Activate z
cd ~/.dotfiles/shell
chmod +x z.sh

# Install Zsh Autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Symlink the Mackup config file to the home directory
ln -s $HOME/.dotfiles/.mackup.cfg $HOME/.mackup.cfg

# Symlink vim prefs
rm -rf $HOME/.vimrc
ln -s $HOME/.dotfiles/shell/.vimrc $HOME/.vimrc
rm -rf $HOME/.vim
ln -s $HOME/.dotfiles/shell/.vim $HOME/.vim

# Set macOS preferences
# We will run this last because this will reload the shell
cd ~/.dotfiles
source .macos

echo '++++++++++++++++++++++++++++++'
echo '++++++++++++++++++++++++++++++'
echo 'All done!'
echo 'Things to do to make the agnoster terminal theme work:'
echo '1. Install menlo patched font included in ~/.dotfiles/misc https://gist.github.com/qrush/1595572/raw/Menlo-Powerline.otf'
echo '2. Install patched solarized theme included in ~/.dotfiles/misc'
