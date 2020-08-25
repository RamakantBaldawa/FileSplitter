param(
[Parameter(Mandatory)]$filepath,
[int]$l = 1000,
[boolean]$header = $true,
[boolean]$deleteOriginal = $false

)

#File details

 $filebasename = (Get-ChildItem $filepath).BaseName;
 $filename = (Get-ChildItem $filepath).Name;
 $extension = (Get-ChildItem $filepath).Extension; 
 

 
 #split file by number of lines
 
 $lowerbound = 0; #Lowerbound Range
 $upperbound = $l; #Uperbound Range
 $linecount = (Get-Content $filename).length;     #Number of lines in file
 $numberoffiles = [Math]::ceiling($linecount/$upperbound);   #Number of files to be generated
 $headerLine = (Get-Content $filename)[0];

 for($i=0; $i -lt $numberoffiles; $i++)
 {
$lowerbound++;

if ($header) {
  @($headerLine)+(get-content $filename)[$lowerbound..$upperbound] | set-content $filebasename'0'$i$extension
 
}
else {
  (get-content $filename)[$lowerbound..$upperbound] | set-content $filebasename'0'$i$extension
}
 
$lowerbound=$upperbound;
$upperbound=$upperbound+$l;
    Write-Progress -Activity "File creation in Progress" -Status "$i Complete:";
 }

#delete the file original file if required
if($deleteOriginal)
{
  Remove-Item $filepath;
}
