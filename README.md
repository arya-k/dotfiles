# dotfiles
.files for setting up a new computer completely from scratch

### Purpose
This repository is meant to ease the creation and maintainance of a new computer, so that all my settings are synced between devices as well. In general, it tries to centralize all settings within the repository with symlinks.

The main code for setup is in the `bin` folder. The `install.sh` script runs setup.sh scripts for each dotfile module. Modules are organized each in their own folder. Additionally, dotfile changes can be pulled or pushed using the `dotfile pull/push` commands.

### Before Using
Before using this, ensure that you've created a computer with the username `arya`, and that icloud has been logged in. Sync Desktop and Documents, etc.

Run the command `git clone git@github.com:arya-k/dotfiles.git ~/.dotfiles`

Afterwards, run `bash ~/.dotfiles/bin/install.sh`

### Modules
 - appconfigs: *Setup iina (video player) and Sublime Text with my usual settings.*
 - bin: *Install the dotfiles command, which makes it easy to keep things up to date.*
 - brew: *Install Homebrew, plus a bunch of applications + cli utilities. Prompts to manually install several macOS App Store applications.*
 - git: *Sets up git config, and global .gitignore. Allows me to use ssh keys that are symlinked from iCloud drive.*
 - hyperkey: *Allows me to use Caps Lock as a global hyperkey for window management, application launching, and escape in vim. Uses Karabiner-Elements and HammerSpoon.*
 - macos: *Custom macOS settings for trackpad, keyboard, etc. Also adjusts the dock. Computer restart required afterwards, so this one is done last.*
 - python: *Installs latest versions of python2 and python3. After python2 EOL, will just symlink python3 binaries to `/usr/local/bin/python`. Installs useful packages in both versions*
 - theme: *Themes the wallpapers, symlinks a `Wallpaper` folder in `~/Library`. Also sets terminal theme.*
 - vim: *Vim config. Fairly minimal, but will be customized furthar once I'm more adept with the editor.*
 - zsh: *Use ZSH as default shell with better code completion, and pure prompt.*
