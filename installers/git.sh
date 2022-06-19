#!/usr/bin/env bash

###############################################################################
# Git
###############################################################################

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
