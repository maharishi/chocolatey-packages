$packageName = '{{PackageName}}'
$version = '{{PackageVersion}}'
$installerType = 'exe'
$silentArgs = '/S'
$url = '{{DownloadUrl}}'
$checksum = '{{Checksum}}'
$checksumType = 'sha1'
$url64 = '{{DownloadUrlx64}}'
$checksum64 = '{{Checksumx64}}'
$checksumType64 = 'sha1'
$validExitCodes = @(0)

Install-ChocolateyPackage -PackageName "$packageName" -FileType "$installerType" -SilentArgs "$silentArgs" -Url "$url" -Url64bit "$url64" -validExitCodes $validExitCodes -Checksum "$checksum" -ChecksumType "$checksumType" -Checksum64 "$checksum64" -ChecksumType64 "$checksumType64"
