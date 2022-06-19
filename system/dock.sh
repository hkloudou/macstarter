#!/usr/bin/env bash

###############################################################################
# Dock
###############################################################################
echo "\033[32mdock...\033[0m"

defaults write com.apple.dock magnification -bool no
defaults write com.apple.dock tilesize -int 44
defaults write com.apple.dock largesize -int 48
defaults write com.apple.dock autohide -bool yes
defaults write com.apple.dock showhide -bool yes
defaults write com.apple.dock orientation bottom
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock expose-animation-duration -float 0.12
killall Dock