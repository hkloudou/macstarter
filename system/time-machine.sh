#!/usr/bin/env bash

###############################################################################
# Time Machine
###############################################################################
echo "\033[32mTime Machine...\033[0m"

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
hash tmutil &>/dev/null && sudo tmutil disablelocal
