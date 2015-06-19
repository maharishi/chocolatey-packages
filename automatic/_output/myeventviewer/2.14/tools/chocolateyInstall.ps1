$packageName = 'myeventviewer'
$url = 'http://www.nirsoft.net/utils/myeventviewer.zip'
$checksum = 'daafa67f8daad26dbfc71e3e80c712284d24829a'
$checksumType = 'sha1'
$url64 = 'http://www.nirsoft.net/utils/myeventviewer-x64.zip'
$checksum64 = '85e7669133cdc8a75d3d200f028c9f10db21a7a2'
$checksumType64 = 'sha1'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installFile = Join-Path $toolsDir "$($packageName).exe"

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$toolsDir" `
                             -Url64bit "$url64" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType" `
                             -Checksum64 "$checksum64" `
                             -ChecksumType64 "$checksumType64"

Set-Content -Path ("$installFile.gui") `
            -Value $null