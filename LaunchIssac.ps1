#launch the BOI:R with a modified hud. The program checks the status of BOI:R, and closes the hud if BOI:R is not running
#Written by Sam Schoeller
#Last Modified 10/20/15


$missinghud=C:\Users\Sam\Desktop\Misc\MissingHUD2_v1.2.3\MissingHUD2.exeShortcut.lnk #shortcuts start minimized
$killmissinghud=(get-process MissingHUD2).ProcessName
$array=(1..36)

Start steam://rungameid/250900
Start-process $missinghud
Start-Sleep -Seconds 3
$array | ForEach-Object {
  If (((get-process isaac* -ea 0) -ne $null) -ne $true){stop-Process -name $killmissinghud; exit};
  Start-Sleep -Seconds 300
}
exit

#References:
#http://powershell.com/cs/blogs/tips/archive/2011/08/25/check-whether-a-program-is-running.aspx
#http://blogs.technet.com/b/heyscriptingguy/archive/2014/04/29/powershell-looping-using-the-foreach-object-cmdlet.aspx
