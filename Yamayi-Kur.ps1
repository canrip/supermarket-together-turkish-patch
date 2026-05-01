$ErrorActionPreference = "Stop"

Set-Location -LiteralPath $PSScriptRoot

Write-Host "Turkce yama kurulumu basliyor..."
Write-Host ""

.\kilidi-ac.ps1
.\install-turkish-as-separate-option.ps1
.\kilitle.ps1

Write-Host ""
Write-Host "Kurulum tamamlandi."
Write-Host "Oyunda dil listesinden Turkce secin."
Write-Host ""
Read-Host "Kapatmak icin Enter'a basin"
