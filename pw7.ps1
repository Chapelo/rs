powershell -w h Invoke-WebRequest -Uri "https://github.com/PowerShell/PowerShell/releases/download/v7.4.3/PowerShell-7.4.3-win-x64.msi" -OutFile "$env:USERPROFILE\Downloads\pw7.msi"; Start-Process -FilePath "$env:USERPROFILE\Desktop\pw7.msi"
DELAY 25
