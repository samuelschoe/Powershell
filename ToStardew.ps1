$userprofile=$Env:USERPROFILE
$savename="blips_118379463"


remove-item $userprofile\AppData\Roaming\StardewValley\Saves\$savename\$savename
remove-item $userprofile\AppData\Roaming\StardewValley\Saves\$savename\savebackup* -Force
remove-item $userprofile\AppData\Roaming\StardewValley\Saves\$savename\SaveGameInfo
start-sleep -s 3
Copy-Item "$userprofile\ownCloud\Freenas\Games\stardiew save\$savename" -Recurse "$userprofile\AppData\Roaming\StardewValley\Saves\" -Force
