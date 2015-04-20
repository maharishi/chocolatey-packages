# Copyright 2011 - Present RealDimensions Software, LLC & original authors/contributors from https://github.com/chocolatey/chocolatey
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

function Install-ChocolateyStartMenuLink {
<#
.SYNOPSIS
This adds a shortcut on the Start Menu to the specified file path.

.PARAMETER TargetFilePath
This is the location to the application/executable file that you want to add a shortcut to the Start Menu.  This is mandatory.

.EXAMPLE
Install-ChocolateyStartMenuLink -TargetFilePath "C:\tools\NHibernatProfiler\nhprof.exe"

This will create a new Start Menu Shortcut pointing at the NHibernate Profiler exe.

#>
param(
  [string] $targetFilePath
)
  Write-Debug "Running 'Install-ChocolateyStartMenuLink' with targetFilePath:`'$targetFilePath`'";
  
  if(!$targetFilePath) {
    throw "Install-ChocolateyStartMenuLink - `$targetFilePath can not be null."
  }
  
  if(!(Test-Path($targetFilePath))) {
	Write-Warning "'$targetFilePath' does not exist. If it is not created the shortcut will not be valid."
  }

  Write-Debug "Creating Shortcut..."
  
  try {
    $startMenu = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::CommonPrograms))
  if(!(Test-Path($startMenu))) {
    [System.IO.Directory]::CreateDirectory($startMenu) | Out-Null
    }
    $link = Join-Path $startMenu "$([System.IO.Path]::GetFileName($targetFilePath)).lnk"
    $workingDirectory = $([System.IO.Path]::GetDirectoryName($targetFilePath))

    $wshshell = New-Object -ComObject WScript.Shell
    $lnk = $wshshell.CreateShortcut($link)
    $lnk.TargetPath = $targetFilePath
    $lnk.WorkingDirectory = $workingDirectory
    $lnk.Save()

    Write-Debug "Start Menu Shortcut created pointing at `'$targetFilePath`'."

  }	
  catch {
    throw $_.Exception
  }	
}