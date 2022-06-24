#!/usr/bin/env bash
source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../utils/utils.sh


###############################################################################
# Time Machine
###############################################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
# defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
# hash tmutil &>/dev/null && sudo tmutil disablelocal

U=~
CT1=$U/Library/Containers
CA1=$U/Caches

IG_Containers_podcast=("$CT1/com.apple.podcasts" "$CT1/com.apple.podcasts.MacPodcastsStorageExtension" "$CT1/com.apple.podcasts.MacQuicklookExtension" "$CT1/com.apple.podcasts.PodcastsNotificationExtension" "$CT1/com.apple.podcasts.widget")
IG_Containers_music=("$CT1/com.apple.Music.MusicCacheExtension" "$CT1/com.apple.Music.MusicStorageExtension")
IG_Containners=($IG_Containers_podcast $IG_Containers_music)

IG_SYSTEM=("$U/.Trash" "$U/Downloads" "$U/Music" "$U/Movies" "$U/Pictures" "$U/Developments")

IG_APP_XCODE=("$U/Library/Developer/CoreSimulator" "/Applications/Xcode.appdownload")
IG_APP_ANDROID=("$U/Library/Android")
IG_APP=($IG_APP_XCODE $IG_APP_ANDROID)

IG_CACHE_DEV=("$U/.cache" "$U/.npm" "$U/.node-gpy" "$U/.gradle" "$U/.dartserver" "$U/.pub-cache")
IG_CACHE_APP=("$CT1/com.apple.Safari/Data/Library/Caches" "$U/Library/Caches/com.apple.dt.Xcode")
IG_CACHE=($IG_CACHE_DEV $IG_CACHE_APP)
echo $IG_SYSTEM $IG_APP $IG_CACHE $IG_Containners "`go env GOMODCACHE`" "`go env GOCACHE`"
sudo tmutil addexclusion -p $IG_SYSTEM $IG_APP $IG_CACHE $IG_Containners "`go env GOMODCACHE`" "`go env GOCACHE`"

green ✅ $0