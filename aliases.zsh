# Shortcuts
alias copyssh="pbcopy < $HOME/.ssh/id_rsa.pub"
alias sshconfig="vi ~/.ssh/config"
alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="/opt/homebrew/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias l="ls -laF"
alias phpstorm='open -a /Applications/PhpStorm.app "`pwd`"'
alias c="clear"
alias hostfile="sudo vim /etc/hosts"

# Directories
alias dotfiles="cd $DOTFILES"
alias sites="cd $HOME/Herd"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Laravel
alias a="herd php artisan"
alias fresh="herd php artisan migrate:fresh --seed"
alias seed="herd php artisan db:seed"

# PHP
alias cfresh="rm -rf vendor/ composer.lock && composer i"
alias composer="herd composer"
alias php="herd php"
alias phpunit="vendor/bin/phpunit"

# DBnging
#alias mysql="mysql -h127.0.0.1"

# JS
alias nfresh="rm -rf node_modules/ package-lock.json && npm install"
alias watch="npm run dev"

# Git
alias nah='git reset --hard;git clean -df'
alias gl="git log --oneline --decorate --color"
alias gs="git status"
alias commit="git add . && git commit -m"
alias amend="git add . && git commit --amend --no-edit --no-verify"
alias pull="git pull"
alias push="git push"
alias stash="git stash -u"
alias wip="git add . && git commit -m 'wip' --no-verify"

#  Commit everything
function commit() {
  commitMessage="$*"

  git add .

  if [ "$commitMessage" = "" ]; then
     aicommits
     return
  fi

  eval "git commit -a -m '${commitMessage}'"
}