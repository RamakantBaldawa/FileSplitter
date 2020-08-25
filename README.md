# FileSplitter
Powershell script to Split large file into multiple small files based on number of lines

### Parameters

-filepath -> Mandatory parameter, specify file path to split \
-l -> Number of lines per file (default : 1000) \
-header -> $True / $False (default :  $true) - Adds header to each of generated files if true\
-deleteOriginal -> $true / $false (default : $false) - Deletes the original file if true


### Usage

.\Splitter.ps1 -filepath 'path of file'\
.\Splitter.ps1 -filepath 'path of file' -l 500\
.\Splitter.ps1 -filepath 'path of file' -l 2000 -header $false
