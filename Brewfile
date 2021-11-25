# Taps
tap 'homebrew/cask'
tap 'homebrew/cask-fonts'
tap 'homebrew/cask-versions'
tap 'homebrew/bundle'
tap 'nicoverbruggen/homebrew-cask'

# Binaries
brew 'bash' # Latest Bash version
brew 'coreutils' # Those that come with macOS are outdated
brew 'ffmpeg'
brew 'git'
brew 'git-flow-avh'
brew 'svn' # Needed to install fonts
brew 'grep'
brew 'mackup'
brew 'hub'
brew 'mas' # Mac App Store manager
brew 'pkg-config' # https://github.com/driesvints/dotfiles/issues/20
brew 'zsh-autosuggestions'

# Spatie Medialibrary
brew 'jpegoptim'
brew 'optipng'
brew 'pngquant'
brew 'svgo'
brew 'gifsicle'

# Development
brew 'php'
brew 'php@7.4'
brew 'composer'
brew 'imagemagick'
brew 'mysql'
brew 'nginx'
brew 'node'
brew 'redis'

# Apps
cask 'alfred'
cask 'dropbox'
cask 'google-chrome'
cask 'dbngin'
cask 'github'
cask 'google-drive'
cask 'iterm2'
cask 'insomnia'
cask 'keepassx'
cask 'phpstorm'
cask 'ray'
cask 'sequel-ace'
cask 'skype'
cask 'telegram-desktop'
cask 'the-unarchiver'
cask 'tinkerwell'
cask 'transmission'
cask 'upwork'
cask 'vlc'
cask 'phpmon'
cask 'caffeine'
cask 'zoom'

# Fonts
cask 'font-lato'
cask 'font-open-sans'
cask 'font-roboto'
cask 'font-source-code-pro-for-powerline'
cask 'font-source-code-pro'
cask 'font-source-sans-pro'
cask 'font-source-serif-pro'

# Games
cask 'the-battle-for-wesnoth'

# Sign in to App Store
if ! mas account >/dev/null; then
    echo "Please open App Store and sign in using your Apple ID ...."
    until mas account >/dev/null; do
        sleep 5
    done
fi

# Mac App Store
mas 'Speedtest', id: 1153157709
mas 'ColorSlurp', id: 1287239339
