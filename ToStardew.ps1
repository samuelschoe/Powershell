$userprofile=$Env:USERPROFILE
$savename="blips_118379463"
$date=Get-Date -format "MM-dd-yyyy::h:mm-ss"


remove-item "$userprofile\AppData\Roaming\StardewValley\Saves\$savename" -Recurse -Force
start-sleep -s 1
Copy-Item   "$userprofile\ownCloud\Freenas\Games\stardiew save\$savename" -Recurse "$userprofile\AppData\Roaming\StardewValley\Saves\" -Force
rename-Item "$userprofile\ownCloud\Freenas\Games\stardiew save\$savename" "$savename_$date.bak" -Force
move-item   "$userprofile\ownCloud\Freenas\Games\stardiew save\$savename_$date.bak" "$userprofile\ownCloud\Freenas\Games\stardiew save\Backupsaves" 

