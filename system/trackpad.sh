#!/usr/bin/env bash

###############################################################################
# Trackpad
###############################################################################
echo "\033[32mConfig Trackpad...\033[0m"

echo _ThreeFingerDrag
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool yes
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool yes
# Enable three finger drag
echo _Clicking
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool yes
echo _Tracking Speed
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 3
