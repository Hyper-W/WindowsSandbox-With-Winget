New-Item -type Directory C:\Script_TMP
Set-Location C:\Script_TMP

curl.exe -fsSOL  https://github.com/microsoft/microsoft-ui-xaml/releases/download/v2.8.6/Microsoft.UI.Xaml.2.8.x64.appx
curl.exe -fsSOL https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx
curl.exe -fsSL https://aka.ms/getwinget -o winget.msixbundle

Add-AppxPackage Microsoft.UI.Xaml.2.8.x64.appx
Add-AppxPackage Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage winget.msixbundle

winget import "C:\Users\WDAGUtilityAccount\Desktop\Scripts\Import.json" --accept-package-agreements --accept-source-agreements --disable-interactivity

Remove-Item -Recurse C:\Script_TMP

Set-WinUserLanguageList -Force ja-JP

[string]$Path = "HKLM:\SYSTEM\CurrentControlSet\services\i8042prt\Parameters"
Set-ItemProperty -Path $Path -Name "LayerDriver JPN" -Value kbd106.dll
Set-ItemProperty -Path $Path -Name "OverrideKeyboardIdentifier" -Value PCAT_106KEY
Set-ItemProperty -Path $Path -Name "OverrideKeyboardType" -Value 7
Set-ItemProperty -Path $Path -Name "OverrideKeyboardSubtype" -Value 2

Restart-Computer