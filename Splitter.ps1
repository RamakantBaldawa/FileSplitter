param(
[Parameter(Mandatory)]$filepath,
[int]$l = 1000,
[boolean]$header = $true,
[boolean]$deleteOriginal = $false

)

#File details

echo $filepath;

 $filebasename = (Get-ChildItem $filepath).BaseName;
 $filename = (Get-ChildItem $filepath).Name;
 $extension = (Get-ChildItem $filepath).Extension; 
 $OriginalDirectory = (Get-ChildItem $filepath).DirectoryName
echo $filename;
echo $filebasename;
echo $extension; 

 
 #split file by number of lines
 
 $lowerbound = 0; #Lowerbound Range
 $upperbound = $l; #Uperbound Range
 $linecount = (Get-Content $filepath).length;     #Number of lines in file
 $numberoffiles = [Math]::ceiling($linecount/$upperbound);   #Number of files to be generated
 $headerLine = (Get-Content $filepath)[0];

 for($i=0; $i -lt $numberoffiles; $i++)
 {
$lowerbound++;

if ($header) {
  @($headerLine)+(get-content $filepath)[$lowerbound..$upperbound] | set-content $OriginalDirectory\$filebasename'0'$i$extension
 
}
else {
  (get-content $filepath)[$lowerbound..$upperbound] | set-content $OriginalDirectory\$filebasename'0'$i$extension
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
