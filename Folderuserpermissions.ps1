#Written by Sam Schoeller, 12/2/2015
#References:
#https://serverfault.com/questions/344304/how-can-i-add-mulitple-user-or-values-to-an-array
#https://technet.microsoft.com/en-us/library/ee617195.aspx
#https://powertoe.wordpress.com/2009/12/14/powershell-part-4-arrays-and-for-loops/
#http://ss64.com/ps/select-object.html
#http://ss64.com/ps/syntax-arrays.html
#http://ss64.com/ps/get-unique.html
#http://windowsitpro.com/blog/breaking-lines-powershell-lose-backtick

import-module Activedirectory

$folder = Read-Host "Enter full folder path"

$folder | get-ACL |Select-Object -ExpandProperty Access | sort-object AccessControltype |
 select FilesystemRights,AccessControlType,IdentityReference | format-table -AutoSize

Write-Host $folder


#arrays to hold the group users
$allowedgroups = @()
$denygroups = @()


#allows multiple elements to be added to each array at once
$wsh = new-object -comobject wscript.shell

do {
    $allowed = Read-Host "Enter Allowed group"
    $allowedgroups += $allowed
    $answer = $wsh.popup("Do you want to add more groups?", 0,"More groups?",4)
    If ($answer -eq 6) {
            $continue = $True
        } else {
            $continue = $False
        }
} while ($continue -eq $True)



$wsh = new-object -comobject wscript.shell

do {
    $allowed = Read-Host "Enter Denied group"
    $denygroups += $denied
    $answer = $wsh.popup("Do you want to add more groups?", 0,"More groups?",4)
    If ($answer -eq 6) {
            $continue = $True
        } else {
            $continue = $False
        }
} while ($continue -eq $True)

#populates the user lists
$denyusers = foreach ($group in $denygroups){$group | get-adgroupmember}
$allowedusers = foreach ($group in $allowedgroups){$group | get-adgroupmember}



#sorts by name and removes duplicates
$allowedusers = $allowedusers |sort-object name | get-unique | select name
$denyusers = $denyusers  |sort-object name | get-unique | select name


"----------------"
"Allowed users"
$allowedusers
"----------------"
"Denied users"
$denyusers
