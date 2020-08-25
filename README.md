# FileSplitter
Powershell script to Split large file into multiple small files based on number of lines

### Parameters

-filepath -> Mandatory parameter, specify file path to split \
-l -> Number of lines per file (default : 1000) \
-header -> $True / $False (default :  $true) - by default adds header to each of generated files

### Usage

.\Splitter.ps1 -filepath 'path of file'\
.\Splitter.ps1 -filepath 'path of file' -l 500\
.\Splitter.ps1 -filepath 'path of file' -l 2000 -header $false
