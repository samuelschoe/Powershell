$userprofile=$Env:USERPROFILE
$date=Get-Date -format "yyyyMMdd"
 

remove-item "$userprofile\ownCloud\Freenas\Games\stardiew save\blips_118379463" -Recurse
start-sleep -s 5
Copy-Item "$userprofile\AppData\Roaming\StardewValley\Saves\blips_118379463" -Recurse "$userprofile\ownCloud\Freenas\Games\stardiew save"
start-sleep -s 5
rename-Item "$userprofile\AppData\Roaming\StardewValley\Saves\blips_118379463\blips_118379463" "savebackup_$date.bak"
