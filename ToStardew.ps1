$userprofile=$Env:USERPROFILE
$savename="blips_118379463"
$date=Get-Date -format "MMddyyyyhmmss"
$localbackupsave="$savename_$date.bak"


remove-item "$userprofile\AppData\Roaming\StardewValley\Saves\$savename" -Recurse -Force
start-sleep -s 1
Copy-Item   "$userprofile\ownCloud\Freenas\Games\stardiew save\$savename" -Recurse "$userprofile\AppData\Roaming\StardewValley\Saves\" -Force
rename-Item "$userprofile\ownCloud\Freenas\Games\stardiew save\$savename" "$savename_$date.bak" -Force
start-sleep -s 1
move-item   "$userprofile\ownCloud\Freenas\Games\stardiew save\$localbackupsave" "$userprofile\ownCloud\Freenas\Games\stardiew save\Backupsaves\" 

