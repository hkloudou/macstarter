#!/usr/bin/env bash

###############################################################################
# Users & Groups
###############################################################################
echo "\033[32mUsers & Groups...\033[0m"

sudo pwpolicy -clearaccountpolicies

# Display login window as: Name and password
sudo defaults write /Library/Preferences/com.apple.loginwindow "SHOWFULLNAME" -bool true

# Disable automatic login
sudo defaults delete /Library/Preferences/com.apple.loginwindow autoLoginUser 2>/dev/null
# Automatic login as current user or "Guest" for guest login
# sudo defaults write /Library/Preferences/com.apple.loginwindow autoLoginUser -string `whoami`

# Allow guests to login to this computer
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false

# Show fast user switching menu as:
# 0 : Full Name
# 1 : Account Name
# 2 : Icon
# defaults write NSGlobalDomain userMenuExtraStyle -int 0

# Show password hints after count (0 to disable)
defaults write NSGlobalDomain RetriesUntilHint -int 0
