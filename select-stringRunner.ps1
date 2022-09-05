#usage .\select-stringRunner.ps1  -regex_file_path "E:\workspace\repos\grepRunner\regexes4runner\Serialization.txt" -target_dir "E:\workspace\repos\ysoserial.net\"
param (
    [Parameter(Mandatory=$true)][string]$regex_file_path,
    [Parameter(Mandatory=$true)][string]$target_dir,
    [Parameter(Mandatory=$false)][string]$options_dir
 )

foreach($line in Get-Content $regex_file_path) {
        Get-ChildItem -Path $target_dir -Recurse -Exclude '*.dll' | Select-String -Pattern "$line"
}