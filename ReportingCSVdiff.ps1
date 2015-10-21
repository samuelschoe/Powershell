#ReportingCSVdiff.ps1
#a powershell scirpt to compare to reports in csv format and return the difference.
#nominally to compare suspence reports for COMMS
#created by Sam Schoeller, 3/31/15. Last modified 4/2/15
#references:
#http://blogs.technet.com/b/heyscriptingguy/archive/2013/11/18/powertip-compare-the-contents-of-files-with-powershell.aspx
#https://social.technet.microsoft.com/Forums/en-US/589ecf00-3c60-4862-b23c-99e4ad9c6216/powershell-getchilditem
#https://technet.microsoft.com/en-us/library/hh849895.aspx
#http://ss64.com/ps/get-childitem.html
#http://ss64.com/ps/syntax-arrays.html


$a = Get-ChildItem .\*.* -include *.csv | Select-object name #creates an array if csv files with only the name property on the object
$date=Get-Date -Format "MMddyyyy" #generates a date to append to the diff file name
$b = get-content $a[0].name
$c = get-content $a[1].name

#compares the array objects content and exports a txt diff. The huge width is to get all of the data out.
Compare-Object -ReferenceObject $b -DifferenceObject $c |
  Out-file "SuspenceDIFFreport_run1_$date.txt" -width 2400

#imports the txt diff above to assign sane headers and reformat into a table
Import-Csv ".\SuspenceDIFFreport_run1_$date.txt" -Header "center","Name","DueDate","SystemInitDate","Action","SuspendedTo","SuspendedBy",
"Status","CompletedBY","CompletedDate","PolicyNumber","PolicyTerm" |
  Format-table "Name","PolicyTerm"| # the two collums that the report generator cares about.
    Out-file "SuspenceDIFFreport_run_$date.txt" -width 200

Remove-item "SuspenceDIFFreport_run1_$date.txt" #removes first output file

""

"Your Diff'ed report is now in the same folder named SuspenceDIFFreport"

""
