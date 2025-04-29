## Introduction

This repository serves as my way to help me setup and maintain my Mac. It takes the effort out of installing everything manually. Everything needed to install my preferred setup of macOS is detailed in this readme. Feel free to explore, learn and copy parts for your own dotfiles. Enjoy!

## A Fresh macOS Setup

These instructions are for setting up new Mac devices.

### Backup your data

If you're migrating from an existing Mac, you should first make sure to backup all of your existing data. Go through the checklist below to make sure you didn't forget anything before you migrate.

- Did you commit and push any changes/branches to your git repositories?
- Did you remember to save all important documents from non-iCloud directories?
- Did you save all of your work from apps which aren't synced through iCloud?
- Did you remember to export important data from your local database?
- Did you remember to backup ~/.ssh folder
- Did you update [mackup](https://github.com/lra/mackup) to the latest version and ran `mackup backup --force && mackup uninstall --force` (see [issue](https://github.com/lra/mackup?tab=readme-ov-file#warning) since Sonoma)?

### Setting up your Mac

After backing up your old Mac you may now follow these install instructions to setup a new one.

1. Update macOS to the latest version through system preferences
2. Restore ~/.ssh folder from backup and add it to the keychain:
   - `eval "$(ssh-agent -s)"` to start the agent
   - `ssh-add ~/.ssh/id_rsa`
   - enter key password if required
   - check that the key is added `ssh-add -l`
3. Git usage might require devtools: `xcode-select --install`

4. Clone this repo to `~/.dotfiles` with:

    ```zsh
    git clone --recursive git@github.com:satoved/dotfiles.git ~/.dotfiles
    ```

5. Run the installation with:

    ```zsh
    cd ~/.dotfiles && ./fresh.sh
    ```

6. Start `Herd.app` and run its install process
7. After mackup is synced with your cloud storage, restore preferences by running `mackup restore --force && mackup uninstall --force`
8. Restart your computer to finalize the process

Your Mac is now ready to use!

> 💡 You can use a different location than `~/.dotfiles` if you want. Make sure you also update the references in the [`.zshrc`](./.zshrc#L2) and [`fresh.sh`](./fresh.sh#L20) files.

### Cleaning your old Mac (optionally)

After you've set up your new Mac you may want to wipe and clean install your old Mac. Follow [this article](https://support.apple.com/guide/mac-help/erase-and-reinstall-macos-mh27903/mac) to do that. Remember to [backup your data](#backup-your-data) first!
