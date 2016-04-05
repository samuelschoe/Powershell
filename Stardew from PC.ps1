$userprofile=$Env:USERPROFILE
$date=Get-Date -format "yyyyMMddmmss"
$savename="blips_118379463"

remove-item "$userprofile\ownCloud\Freenas\Games\stardiew save\$savename" -Recurse
start-sleep -s 3
Copy-Item   "$userprofile\AppData\Roaming\StardewValley\Saves\$savename" -Recurse "$userprofile\ownCloud\Freenas\Games\stardiew save"
start-sleep -s 3
rename-Item "$userprofile\AppData\Roaming\StardewValley\Saves\$savename\$savename" -Force "blips_118379463_$date.bak"
move-item   "$userprofile\AppData\Roaming\StardewValley\Saves\$savename\*.*" "$userprofile\AppData\Roaming\StardewValley\Backupsaves" -Force
