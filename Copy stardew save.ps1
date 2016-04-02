$userprofile=$Env:USERPROFILE
 

remove-item "$userprofile\ownCloud\Freenas\Games\stardiew save\blips_118379463" -Recurse
start-sleep -s 5
Copy-Item "$userprofile\AppData\Roaming\StardewValley\Saves\blips_118379463" -Recurse "$userprofile\ownCloud\Freenas\Games\stardiew save"
start-sleep -s 5
rename-Item "$userprofile\AppData\Roaming\StardewValley\Saves\blips_118379463" blipssavebackup_$date.bak
