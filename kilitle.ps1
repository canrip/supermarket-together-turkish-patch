$ErrorActionPreference = "Stop"

$files = @(
  "install-turkish-as-separate-option.ps1",
  "Yamayi-Kur.ps1",
  "Yamayi-Yonetici-Olarak-Kur.bat",
  "Localization_TR_starter.xml",
  "README.md",
  "README_TR.md"
)

foreach ($name in $files) {
  $file = Join-Path $PSScriptRoot $name
  if (Test-Path -LiteralPath $file) {
    attrib +R $file
    Write-Host "Kilitlendi: $file"
  } else {
    Write-Host "Bulunamadi: $file"
  }
}

Write-Host "Tamamlandi. Dosyalar salt okunur yapildi."
