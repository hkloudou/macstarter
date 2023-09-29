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
# 
# set "$@" $(find ~ -name "Google *" -mindepth 1 -maxdepth 1) # Google Drive
# set "$@" ~/git # store on github/etc :)
# set "$@" ~/node_modules

#~/Library/Application\ Support ~/Library/Caches ~/Library/Containers 
set "$@" ~/Library/Google ~/Library/Internet\ Plug-Ins ~/Library/LaunchAgents ~/Library/Logs ~/Library/Mail ~/Library/Messages ~/Library/Mail ~/Library/Metadata ~/Library/QuickLook ~/Library/Safari ~/Library/Saved\ Application\ State ~/Library/Screen\ Savers ~/Library/Sharing ~/Library/Suggestions

# 系统
set "$@" /opt # MacPorts
set "$@" /vm  # swapfile

set "$@" /private/var/db/oah /private/var/db/diagnostics /private/var/db/folders /private/var/db/uuidtext /private/var/db/vm /private/var/log /private/var/tmp
# set "$@" ~/Library/Containers/com.tencent.WeWorkMac    #企业微信，貌似没有备份的必要性

set "$@" /usr/local/go      #常见程序，无缓存必要

IG_USER=(
    g #常见程序，无缓存必要
    .Trash
    .cache .npm .node-gpy
    .dartserver .pub-cache .dart-tool .dart
    .gradle .android
    .vscode
    Library/Android Library/Caches Library/Developer Library/Jave
    Library/Weather #天气要着没用吧
    Desktop Downloads Movies Music Pictures Developments/flutter
)

IG_APPLICATION_SUPPORT=(
    "Caches"    #缓存  
    "listen1"   #listen1
    "com.apple.mobileAssetDesktop"  #壁纸
    "Steam" #这玩意，真的可以不要
    "Code" #Code，自己通过自动同步来搞吧
    "Code - Insiders"   #Code 的未来版本
    "aDrive"        #阿里云盘，没必要缓存
    "Knowledge"     #Knowledge siri的application主动学习功能
    "com.apple.AMPArtworkAgent" #apple music 艺术封面
    "Google" #google
)

IG_USER_CONTAINS=(
    "9AD17523-F3E4-423A-A5CF-077998D376BF"  #百度HD
    "CA3EE929-B1F9-475A-8512-3E6AAFD5179C"  #抖音IOS
    "E4F2145C-B533-453F-AD53-4413C1B7A075"  #米家IOS
    "B4218C8E-9814-4464-8DE1-C459962CF285"  #携程
    "BE48479C-3CD1-4B39-B113-02079B4332F6"  #微信听书
    "8F90E7B0-EB41-461B-98C7-978522FB8EEE"  #微信读书
    "5C64EC52-1E37-4282-9289-E8113D4F708A"  #百度HD
    "com.tencent.wwmapp"                    #腾讯会议
    "com.tencent.tenvideo"                  #腾讯视频
    "com.iqiyi.player"                      #爱奇艺
    "com.docker.docker"                     #docker
    "ru.keepcoder.Telegram"                 #telegram
    "com.tencent.WeWorkMac"                 #企业微信
    "com.apple.freeform"                    #freeform，完全没必要备份，自动同步icloud 就好
    "com.apple.podcasts"
    "com.apple.podcasts.widget"
    "com.apple.podcasts.MacPodcastsStorageExtension"
    "com.apple.podcasts.MacQuicklookExtension"
    "com.apple.podcasts.PodcastsAuthAgent"
    "com.apple.podcasts.PodcastsNotificationExtension"
    "com.apple.Music.MusicCacheExtension"
    "com.apple.Music.MusicStorageExtension"
    "com.apple.weather" #天气
    "com.apple.weather.WeatherIntents" #天气2
    "com.apple.Safari/Data/Library/Caches"  #safari cache

    "com.tencent.LemonLite" #柠檬清理
    "88L2Q4487U.com.tencent.LemonASMonitor" #柠檬清理

    "com.youku.mac" #优酷

)

IG_USER_GROUP_CONTAINS=(
    "6N38VWS5BX.ru.keepcoder.Telegram" #tg
    "6N38VWS5BX.ru.keepcoder.Telegram.TelegramShare" #tg2
    "88L2Q4487U.WeWorkMac" #企业微信
    "243LU875E5.groups.com.apple.podcasts"  #podcasts
    "5A4RE8SF68.com.tencent.xinWeChat/Library/Caches"
    "group.com.apple.tips"  #tips
    "group.com.apple.tipsnext" #tips
    "group.com.apple.stocks" #股票
)

IG_USER_APPS=(
    #手工安装    
    "Docker"
    "Visual Studio Code"
    "Code - Insiders"
    "isual Studio Code - Insiders"
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
    "优酷"
    "QQLive"
    "WeChat"
    "企业微信"
    "aDrive"

    #IOS
    "抖音"
    "百度网盘HD"
    'Mi Home'
    "中国电信"
    "携程旅行"
    "微信听书"
    "微信读书"
    
)

#User
for files in "${IG_USER[@]}"
   do set "$@" ~/$files
done


#Application Support
for files in "${IG_APPLICATION_SUPPORT[@]}"
   do set "$@" ~/Library/Application\ Support/$files
done

#Containers
for files in "${IG_USER_GROUP_CONTAINS[@]}"
   do set "$@" ~/Library/Group\ Containers/$files
done
for files in "${IG_USER_CONTAINS[@]}"
   do set "$@" ~/Library/Containers/$files
done

# #Applications
for files in "${IG_USER_APPS[@]}"
    do set "$@" "/Applications/$files.app" && set "$@" "/Applications/$files.appdownload"
done

# # golang
set "$@" `go env GOMODCACHE`
set "$@" `go env GOCACHE`

# # node_modules
set "$@" `find ~/Developments -name "node_modules" -type d -prune`
# # flutter build folder
set "$@" `find ~/Developments -path ~/Developments/flutter -prune -o -name "pubspec.yaml" -type f -exec dirname {} \; | while read dir; do echo "$dir/build"; done`

# 在当前目录开始搜索 .tmignore 文件
# 定义一个数组来存储所有找到的路径
# ppaths=()

while IFS= read -r file; do
    # 获取文件的目录名
    dir_name=$(dirname "$file")

    # 读取文件中的每一行
    while IFS= read -r line || [[ -n "$line" ]]; do
        # 去除前后空白字符
        trimmed_line=$(echo "$line" | awk '{$1=$1};1')

        # 检查行是否为空或以#开头
        if [[ -z "$trimmed_line" ]] || [[ "$trimmed_line" =~ ^# ]]; then
            continue
        fi
        # 检查指定路径是否存在
        if [[ -e "$dir_name/$trimmed_line" ]]; then
            echo "$dir_name/$trimmed_line"
            set "$@" "$dir_name/$trimmed_line"
        else
            echo "Warning: $dir_name/$trimmed_line not found!"
        fi
    done < "$file"
done < <(find ~/Developments -name ".tmignore")

n=0
sudo /usr/libexec/PlistBuddy -c "Delete SkipPaths" /Library/Preferences/com.apple.TimeMachine.plist
sudo /usr/libexec/PlistBuddy -c "Add SkipPaths array" /Library/Preferences/com.apple.TimeMachine.plist
# echo $1
#  && [ -e "$1" ]
while [[ $# != 0 ]]; do
    [[ -n "$1" ]] && {
        # echo $1
        sudo /usr/libexec/PlistBuddy -c "Add SkipPaths:$n string '$1'" /Library/Preferences/com.apple.TimeMachine.plist || exit
        sudo tmutil addexclusion -p "$1"
        # tmutil isexcluded "$1"
        ((n++))
    }
    shift
done
killall cfprefsd;:

# sudo tmutil $ACTION -p "`go env GOMODCACHE`" "`go env GOCACHE`"
# tmutil isexcluded "`go env GOMODCACHE`" "`go env GOCACHE`"
green ✅ $0
defaults read /Library/Preferences/com.apple.TimeMachine SkipPaths

# du -d 1 -h | sort -rh

