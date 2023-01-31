#!/usr/bin/env bash
{ set +x; } 2>/dev/null

IFS=$'\n'
source $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../utils/utils.sh

###############################################################################
# Time Machine
###############################################################################

# Prevent Time Machine from prompting to use new hard drives as backup volume
# defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable local Time Machine backups
# hash tmutil &>/dev/null && sudo tmutil disablelocal

# U=~
# IG_SYSTEM=("$U/.Trash" "$U/Downloads" "$U/Music" "$U/Movies" "$U/Pictures" "$U/Developments")

# IG_APP_XCODE=("$U/Library/Developer/CoreSimulator" "/Applications/Xcode.appdownload")
# IG_APP_ANDROID=("$U/Library/Android")
# IG_APP=($IG_APP_XCODE $IG_APP_ANDROID)

# IG_CACHE_DEV=("$U/.cache" "$U/.npm" "$U/.node-gpy" "$U/.gradle" "$U/.dartserver" "$U/.pub-cache")
# -n 名称
# -a 作者
# -h 帮助
# ACTION=addexclusion
# if [ "$1" = "del" ]
# then
#     ACTION=removeexclusion
#     yellow ⚠️ 删除
# fi
set "$@" ~/.Trash ~/.cache ~/.npm ~/.node-gpy ~/.dartserver ~/.pub-cache ~/.gradle
set "$@" ~/Developments ~/Desktop ~/Downloads ~/Movies ~/Music ~/Pictures
set "$@" /Library/Developer ~/Library/Developer /Library/Java ~/Library/Android

set "$@" ~/Library/Caches
set "$@" ~/Library/Application\ Support/Caches
set "$@" ~/Library/Application\ Support/listen1

IG_USER_CONTAINS=(
    "9AD17523-F3E4-423A-A5CF-077998D376BF"  #百度HD
    "CA3EE929-B1F9-475A-8512-3E6AAFD5179C"  #抖音
    "E4F2145C-B533-453F-AD53-4413C1B7A075"  #米家
    "B4218C8E-9814-4464-8DE1-C459962CF285"  #携程
    "BE48479C-3CD1-4B39-B113-02079B4332F6"  #微信听书
    "8F90E7B0-EB41-461B-98C7-978522FB8EEE"  #微信读书
    "com.tencent.wwmapp"                    #腾讯会议
    "com.tencent.tenvideo"                  #腾讯视频
    "com.iqiyi.player"                      #爱奇艺
    "com.docker.docker"                     #docker
    "ru.keepcoder.Telegram"                 #telegram
    "com.apple.podcasts"
    "com.apple.podcasts.widget"
    "com.apple.podcasts.MacPodcastsStorageExtension"
    "com.apple.podcasts.MacQuicklookExtension"
    "com.apple.podcasts.PodcastsAuthAgent"
    "com.apple.podcasts.PodcastsNotificationExtension"
    "com.apple.Music.MusicCacheExtension"
    "com.apple.Music.MusicStorageExtension"

    "com.apple.Safari/Data/Library/Caches"  #safari cache
)
IG_USER_APPS=(
    #手工安装    
    "Docker"
    "Visual Studio Code"
    "BaiduNetdisk_mac"
    
    #系统轻易下载到
    "Xcode"

    "Keynote"
    "Pages"
    "Numbers"

    "Apifox"
    "Xmind"

    #应用轻易下载到
    "爱奇艺"
    "QQLive"
    "WeChat"
    "企业微信"

    #IOS
    "抖音"
    "百度网盘HD"
    'Mi Home'
    "中国电信"
    "携程旅行"
    "微信听书"
    "微信读书"
)
# # IG=("")
# for files in "${IG_USER[@]}"
#     do set "$@" ~/$files
# done
for files in "${IG_USER_CONTAINS[@]}"
   do set "$@" ~/Library/Containers/$files
done
for files in "${IG_USER_APPS[@]}"
    do set "$@" /Applications/$files.app && set "$@" /Applications/$files.appdownload
done

set "$@" `go env GOMODCACHE`
set "$@" `go env GOCACHE`


n=0
sudo /usr/libexec/PlistBuddy -c "Delete SkipPaths" /Library/Preferences/com.apple.TimeMachine.plist
sudo /usr/libexec/PlistBuddy -c "Add SkipPaths array" /Library/Preferences/com.apple.TimeMachine.plist
# echo $1
#  && [ -e "$1" ]
while [[ $# != 0 ]]; do
    [[ -n "$1" ]] && {
        sudo /usr/libexec/PlistBuddy -c "Add SkipPaths:$n string '$1'" /Library/Preferences/com.apple.TimeMachine.plist || exit
        sudo tmutil addexclusion -p "$1"
        tmutil isexcluded "$1"
        ((n++))
    }
    shift
done
killall cfprefsd;:

# sudo tmutil $ACTION -p "`go env GOMODCACHE`" "`go env GOCACHE`"
# tmutil isexcluded "`go env GOMODCACHE`" "`go env GOCACHE`"
green ✅ $0
defaults read /Library/Preferences/com.apple.TimeMachine SkipPaths
# { set +x; } 2>/dev/null

# IFS=$'\n'
# set "$@" ~/git # store on github/etc :)
# set "$@" ~/Applications # store on github/etc :)

# echo "1" $1
# n=0
# sudo /usr/libexec/PlistBuddy -c "Delete SkipPaths" /Library/Preferences/com.apple.TimeMachine.plist
# sudo /usr/libexec/PlistBuddy -c "Add SkipPaths array" /Library/Preferences/com.apple.TimeMachine.plist
# echo $1
# while [[ $# != 0 ]]; do
#     [[ -n "$1" ]] && [ -e "$1" ] && {
#         # sudo /usr/libexec/PlistBuddy -c "Add SkipPaths:$n string '$1'" /Library/Preferences/com.apple.TimeMachine.plist || exit
#         # sudo tmutil addexclusion "$1"
#         tmutil isexcluded "$1"
#         ((n++))
#     }
#     shift
# done
# killall cfprefsd;:

# sudo /usr/libexec/PlistBuddy -c "Delete SkipPaths" /Library/Preferences/com.apple.TimeMachine.plist
# sudo /usr/libexec/PlistBuddy -c "Add SkipPaths array" /Library/Preferences/com.apple.TimeMachine.plist
# for files in "${IG_USER_CONTAINS[@]}"
#     do sudo tmutil $ACTION -p "~/Library/Containers/$files"
# done
# for files in "${IG_USER_CONTAINS[@]}"
#     do tmutil isexcluded "~/Library/Containers/$files"
# done

# for files in "${IG_USER[@]}"
#     do sudo tmutil $ACTION -p "~/$files"
# done
# for files in "${IG_USER[@]}"
#     do tmutil isexcluded "~/$files"
# done

# for files in "${IG_USER_APPS[@]}"
#     do sudo tmutil $ACTION -p "/Applications/$files.app" && sudo tmutil $ACTION -p "/Applications/$files.appdownload"
# done
# for files in "${IG_USER_APPS[@]}"
#     # echo "/Applications/$files.app"
#     do tmutil isexcluded "/Applications/${files}.app"
# done