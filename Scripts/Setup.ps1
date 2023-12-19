New-Item -type Directory C:\Script_TMP
Set-Location C:\Script_TMP

curl.exe -fsSOL https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx
curl.exe -fsSL https://aka.ms/getwinget -o winget.msixbundle

Install-Package -source https://www.nuget.org/api/v2 Microsoft.UI.Xaml -Force
Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage winget.msixbundle

winget import "C:\Users\WDAGUtilityAccount\Desktop\Scripts\Import.json" --accept-package-agreements --accept-source-agreements --disable-interactivity

Remove-Item -Recurse C:\Script_TMP

Restart-Computer