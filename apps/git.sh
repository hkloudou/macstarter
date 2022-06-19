#!/usr/bin/env bash

###############################################################################
# Git
###############################################################################

# if ! $(which git &>/dev/null); then
#     echo "⚠️\033[33m please install git \033[0m"
#     # Wait until the Xcode Command Line Tools are installed
#     until $(which git &>/dev/null); do
#         sleep 5
#     done
# fi
echo "# .gitignore_global
####################################
######## OS generated files ########
####################################
.DS_Store
.DS_Store?
*.swp
._*
.Spotlight-V100
.Trashes
Icon?
ehthumbs.db
Thumbs.db

# node
bower_components/
node_modules/
" >~/.gitignore_global
git config --global core.excludesfile ~/.gitignore_global
echo "✅\033[32m apps/git global config\033[0m"