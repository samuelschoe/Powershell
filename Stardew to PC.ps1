$userprofile=$Env:USERPROFILE


remove-item $userprofile\AppData\Roaming\StardewValley\Saves\blips_118379463\blips_118379463
remove-item $userprofile\AppData\Roaming\StardewValley\Saves\blips_118379463\savebackup* -Force
remove-item $userprofile\AppData\Roaming\StardewValley\Saves\blips_118379463\SaveGameInfo
start-sleep -s 3
Copy-Item "$userprofile\ownCloud\Freenas\Games\stardiew save\blips_118379463" -Recurse "$userprofile\AppData\Roaming\StardewValley\Saves\"
