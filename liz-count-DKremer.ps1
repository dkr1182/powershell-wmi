

$CitrixLicenseServer = "enter ip"


# Get Citrix Licensing Info from WMI

$LicensePool = Get-WmiObject -ComputerName $CitrixLicenseServer -Namespace ROOT\CitrixLicensing -class Citrix_GT_License_Pool

# Calculate licenses in use, total number of licenses and percentage currently in use
$InUseNum = ($LicensePool | Measure-Object -Property InUseCount -sum).Sum
$InstalledLicNum = (($LicensePool | Measure-Object -Property Count -sum).Sum)/10
$PercentageNum = [math]::round(($InUseNum/$InstalledLicNum)*100,2)


#Write-Output $InUseNum
#Write-Output $InstalledLicNum
$Out=[string]$PercentageNum+":OK"
Write-Output $Out
