#launch the BOI:R with a modified hud. The program checks the status of BOI:R, and closes the hud if BOI:R is not running
#Written by Sam Schoeller
#References:
#http://powershell.com/cs/blogs/tips/archive/2011/08/25/check-whether-a-program-is-running.aspx
#http://blogs.technet.com/b/heyscriptingguy/archive/2014/04/29/powershell-looping-using-the-foreach-object-cmdlet.aspx


$missinghud=C:\Users\Sam\Desktop\Misc\MissingHUD2_v1.2.3\MissingHUD2.exeShortcut.lnk #shortcuts start minimized
$array=(1..36)

Start steam://rungameid/250900
Start-Sleep -Seconds 3
Start-process $missinghud
$array | ForEach-Object {
  If (((get-process isaac* -ea 0) -ne $null) -ne $true){stop-Process -name (get-process MissingHU*).ProcessName; exit}; # if BOI:r running -ne true, call stop MissingHUD2 process and exit shell
  Start-Sleep -Seconds 300
}
exit
