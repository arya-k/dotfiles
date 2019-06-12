#!/usr/local/bin/zsh
#
# dock
#
# Configures the dock

green 'Changing Dock Settings'
# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0
# Remove the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# disable magnification
defaults write com.apple.dock magnification -bool false
defaults write com.apple.dock tilesize -float 120

green 'Setting up applications for the dock'
dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Safari.app"

if test -d "/Applications/Utilities/Terminal.app"
then
    dockutil --no-restart --add "/Applications/Utilities/Terminal.app"
else
    dockutil --no-restart --add "/System/Applications/Utilities/Terminal.app"
fi

dockutil --no-restart --add "/Applications/Bear.app"
dockutil --no-restart --add "/Applications/Sublime Text.app"

killall Dock