# Install Lacework Windows Agent
#

try {
  Write-Host "Downloading Lacework Windows Agent"
  Invoke-WebRequest -Uri "https://s3.us-west-2.amazonaws.com/www.lacework.net/download/windows/alpha-2-0.3.0.1792/LWDataCollector.msi" -OutFile LWDataCollector.msi

  Write-Host "Installing Lacework Windows Agent"
  $lacework = (Start-Process msiexec.exe -ArgumentList "/i","LWDataCollector.msi","ACCESSTOKEN=<accessToken>", "SERVERURL=lwcs.lacework.net","/passive" -NoNewWindow -Wait -PassThru)
  if ($lacework.ExitCode -ne 0) {
    Write-Error "Error installing Lacework Windows Agent"
    exit 1
  }

}
catch
{
  Write-Error $_.Exception
  exit 1
}
