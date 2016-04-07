$userprofile=$Env:USERPROFILE
$date=Get-Date -format "yyyyMMddmmss"
$savename="blips_118379463"
$localbackupsave="$savename_$date.bak"

remove-item "$userprofile\ownCloud\Freenas\Games\stardiew save\$savename" -Recurse
start-sleep -s 3
Copy-Item   "$userprofile\AppData\Roaming\StardewValley\Saves\$savename" -Recurse "$userprofile\ownCloud\Freenas\Games\stardiew save"
start-sleep -s 3
rename-Item "$userprofile\AppData\Roaming\StardewValley\Saves\$savename\$savename" -Force "$savename_$date.bak"
remove-item "$userprofile\AppData\Roaming\StardewValley\Saves\$savename\SaveGame*"
move-item   "$userprofile\AppData\Roaming\StardewValley\Saves\$savename\$localbackupsave" "$userprofile\AppData\Roaming\StardewValley\Backupsaves" -Force
