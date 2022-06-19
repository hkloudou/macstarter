#!/usr/bin/env bash

###############################################################################
# Screenshot
###############################################################################
echo "\033[32mConfig tmignore...\033[0m"

mkdir -p /usr/local
mkdir -p /usr/local/bin
curl -L https://github.com/hkloudou/tmignore/releases/download/v1.2.13/tmignore >/usr/local/bin/tmignore
chmod u+x /usr/local/bin/tmignore

mkdir -p ~/.config/tmignore/
echo '{
    "searchPaths": ["~/project"],
    "ignoredPaths": ["~/.Trash", "~/Applications", "~/Downloads", "~/Library", "~/Music/iTunes", "~/Music/Music", "~/Developments", "~/Pictures/Photos Library.photoslibrary"]
}' >~/.config/tmignore/config.json

# Schedule tmignore run
cron_entry='0 */1 * * * /usr/local/bin/tmignore run &>/dev/null'
if ! crontab -l | fgrep "$cron_entry" >/dev/null; then
  (crontab -l 2>/dev/null; echo "$cron_entry") | \
    crontab -
fi