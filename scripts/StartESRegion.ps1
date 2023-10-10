[CmdletBinding()]
param(
    [Parameter(Mandatory=$true)]
    [string]$RegionName,
    [Parameter(Mandatory=$false)]
    [string]$Delay
)

try {
    $ErrorActionPreference = "Stop"
     Start-Transcript -Path c:\cfn\log\$($MyInvocation.MyCommand.Name).txt -Append -IncludeInvocationHeader;
     if ($Delay){
         Start-Sleep -s 90
     }
	& "C:\Program Files (x86)\Micro Focus\Enterprise Server\bin\casstart.exe" `
		"-r$RegionName"

} catch {
      $_ | Write-AWSQuickStartException
}