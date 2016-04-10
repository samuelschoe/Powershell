$userprofile=$Env:USERPROFILE
$date=Get-Date -format "MM-dd-yyyy::h:mm-ss"
$savename="blips_118379463"
$localbackupsave="$savename_$date.bak"
$savegameinfosave="SaveGameInfo_$date.bak"

remove-item "$userprofile\ownCloud\Freenas\Games\stardiew save\$savename" -Recurse
start-sleep -s 1
Copy-Item   "$userprofile\AppData\Roaming\StardewValley\Saves\$savename" -Recurse "$userprofile\ownCloud\Freenas\Games\stardiew save"
start-sleep -s 1
rename-Item "$userprofile\AppData\Roaming\StardewValley\Saves\$savename\$savename" -Force "$savename_$date.bak"
rename-Item "$userprofile\AppData\Roaming\StardewValley\Saves\$savename\SaveGameInfo" -Force "SaveGameInfo_$date.bak"
move-item   "$userprofile\AppData\Roaming\StardewValley\Saves\$savename\$localbackupsave" "$userprofile\AppData\Roaming\StardewValley\Backupsaves" -Force
move-item   "$userprofile\AppData\Roaming\StardewValley\Saves\$savename\$savegameinfosave" "$userprofile\AppData\Roaming\StardewValley\Backupsaves" -Force
