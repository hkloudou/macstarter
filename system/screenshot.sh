#!/usr/bin/env bash
source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../utils/utils.sh

###############################################################################
# Screenshot
###############################################################################

# Screenshot location
mkdir -p $HOME/Pictures/Screenshots
defaults write com.apple.screencapture location -string "$HOME/Pictures/Screenshots"


green ✅ $0
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
