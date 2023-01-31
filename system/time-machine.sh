#!/usr/bin/env bash
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

IG_USER=(
    ".Trash"
    ".cache"
    ".npm"
    ".node-gpy"
    ".dartserver"
    ".pub-cache"
    ".gradle"

    "Downloads"
    "Music"
    "Movies"
    "Pictures"
    "Developments"
    

    "Library/Android"
    "Library/Developer/Xcode"           #这里大概率没有意义的东西
    "Library/Developer/CoreSimulator"   #模拟器，就不备份吧

    "Library/Caches"
    "Library/Caches/go-build"
    "Library/Caches/com.apple.dt.Xcode" #cache
)

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
    "Xcode"
    "Docker"
    "企业微信"
    "抖音"
    "爱奇艺"
    "百度网盘HD"
    "QQLive"
)
# 9AD17523-F3E4-423A-A5CF-077998D376BF 百度HD
# com.tencent.tenvideo腾讯视频 com.iqiyi.player爱奇艺
# echo $IG_CACHE_CONTAIN

# IG_CACHE_APP=(
#     "$CT1/com.apple.Safari/Data/Library/Caches"
#     "$U/Library/Caches/com.apple.dt.Xcode"
# )
# IG_CACHE=(${IG_CACHE_DEV[@]} ${IG_CACHE_APP[@]})
# echo "IG_CACHE"
# echo ${IG_CACHE[@]}
# echo $IG_SYSTEM $IG_APP $IG_CACHE $IG_Containners "`go env GOMODCACHE`" "`go env GOCACHE`"

# for files in ${IG_CACHE_CONTAIN[@]}
#     do sudo tmutil addexclusion -p $CT1/$files
# done
for files in ${IG_USER_CONTAINS[@]}
    do sudo tmutil addexclusion -p ~/Library/Containers/$files
done
for files in ${IG_USER_CONTAINS[@]}
    do tmutil isexcluded ~/Library/Containers/$files
done

for files in ${IG_USER[@]}
    do sudo tmutil addexclusion -p ~/$files
done
for files in ${IG_USER[@]}
    do tmutil isexcluded ~/$files
done

for files in ${IG_CACHE_APP[@]}
    do sudo tmutil addexclusion -p /Applications/$files.app && sudo tmutil addexclusion -p /Applications/$files.appdownload
done
for files in ${IG_CACHE_APP[@]}
    do tmutil isexcluded /Applications/$files.app
done

sudo tmutil addexclusion -p "`go env GOMODCACHE`" "`go env GOCACHE`"
tmutil isexcluded "`go env GOMODCACHE`" "`go env GOCACHE`"
green ✅ $0