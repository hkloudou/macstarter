#!/usr/bin/env bash

###############################################################################
# Screenshot
###############################################################################
echo "\033[32mScreenshot...\033[0m"

# Screenshot location
mkdir -p $HOME/Screenshots
defaults write com.apple.screencapture location -string "$HOME/Pictures/Screenshots"

# Base name of screenshots
# defaults write com.apple.screencapture name -string "screen"

# # Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
# defaults write com.apple.screencapture type -string "png"

# # Shadow in screenshots
# defaults write com.apple.screencapture disable-shadow -bool true

# # Include date in screenshots
# defaults write com.apple.screencapture include-date -bool true

# # Show mouse pointer
# defaults write com.apple.screencapture showsCursor -bool true

# # Show floating thumbnail
# defaults write com.apple.screencapture show-thumbnail -bool false
