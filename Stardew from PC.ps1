$userprofile=$Env:USERPROFILE
$date=Get-Date -format "yyyyMMddmmss"
 

remove-item "$userprofile\ownCloud\Freenas\Games\stardiew save\blips_118379463" -Recurse
start-sleep -s 3
Copy-Item "$userprofile\AppData\Roaming\StardewValley\Saves\blips_118379463" -Recurse "$userprofile\ownCloud\Freenas\Games\stardiew save"
start-sleep -s 3
rename-Item "$userprofile\AppData\Roaming\StardewValley\Saves\blips_118379463\blips_118379463" -Force "savebackup_$date.bak"
