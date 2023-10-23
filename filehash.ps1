<#
NOTE! File must be in same location as the script!
If it isn't, replace 'Get-Location' with filepath
excluding the filename.#>

#Prompt user for filename and known hash value
Write-Host "Please input filename: "
$FileNameOnly = Read-Host
Write-Host " "
Write-Host "Please input Known Hash: "
$KnownHash = Read-Host
Write-Host " "

#Write absolute filepath to variable
$File = Get-Location
$File = $File,"\",$FileNameOnly -join ""

#Change SHA256 for desired hash if you want, ex. MD5
$FileHash = certutil -hashfile $File SHA256

#Removes first and last line from certutils report so only hash remains
$FileHash = $FileHash | select -skip 1 | select -skiplast 1


#Checks if known and generated hash are the same
Write-Host "Known Hash " $KnownHash
Write-Host "File Hash  " $FileHash
Write-Host " "

If ($FileHash -eq $KnownHash){Hash are the same}
} 
else { (Hash are not the same)
}
pause
