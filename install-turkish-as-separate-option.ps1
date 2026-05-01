$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$data = Join-Path $root "Supermarket Together_Data"
$assetsPath = Join-Path $data "resources.assets"
$assetsBackupPath = Join-Path $data "resources.assets.bak-before-turkish"
$translationPath = Join-Path $PSScriptRoot "Localization_TR_starter.xml"

if (!(Test-Path $translationPath)) {
  throw "Turkce XML bulunamadi: $translationPath"
}

if (!(Test-Path $assetsBackupPath)) {
  Copy-Item -LiteralPath $assetsPath -Destination $assetsBackupPath
  Write-Host "Temiz resources.assets yedegi olusturuldu: $assetsBackupPath"
}

function Replace-BytesSameLength([byte[]]$bytes, [byte[]]$oldBytes, [byte[]]$newBytes) {
  if ($oldBytes.Length -ne $newBytes.Length) {
    throw "Eski ve yeni byte dizileri ayni uzunlukta olmali."
  }

  $count = 0
  for ($i = 0; $i -le $bytes.Length - $oldBytes.Length; $i++) {
    $matched = $true
    for ($j = 0; $j -lt $oldBytes.Length; $j++) {
      if ($bytes[$i + $j] -ne $oldBytes[$j]) {
        $matched = $false
        break
      }
    }

    if ($matched) {
      [Array]::Copy($newBytes, 0, $bytes, $i, $newBytes.Length)
      $count++
      $i += $oldBytes.Length - 1
    }
  }

  return $count
}

# English slotunu temiz yedekten geri getirip Turkceyi Macarca slotuna yazar.
$bytes = [IO.File]::ReadAllBytes($assetsBackupPath)
$ascii = [Text.Encoding]::ASCII.GetString($bytes)

$name = "Localization_HU"
$nameStart = $ascii.IndexOf($name)
if ($nameStart -lt 0) {
  throw "$name resources.assets icinde bulunamadi."
}

$textStart = $ascii.IndexOf("<text>", $nameStart)
$textEnd = $ascii.IndexOf("</text>", $textStart)
if ($textStart -lt 0 -or $textEnd -lt 0) {
  throw "$name icin <text> blogu bulunamadi."
}

$textEnd += "</text>".Length
$slotLength = $textEnd - $textStart

$translation = Get-Content -LiteralPath $translationPath -Raw -Encoding UTF8
$translationBytes = [Text.Encoding]::UTF8.GetBytes($translation)

if ($translationBytes.Length -gt $slotLength) {
  throw "Turkce XML Macarca dil bloguna sigmiyor. Uzunluk: $($translationBytes.Length), alan: $slotLength bayt."
}

$padded = New-Object byte[] $slotLength
[Array]::Copy($translationBytes, 0, $padded, 0, $translationBytes.Length)
for ($i = $translationBytes.Length; $i -lt $padded.Length; $i++) {
  $padded[$i] = 0x20
}

[Array]::Copy($padded, 0, $bytes, $textStart, $slotLength)
[IO.File]::WriteAllBytes($assetsPath, $bytes)

# Dil seciminde gorunen Hungarian adini Turkce olarak degistirir.
$displayFiles = @(
  (Join-Path $data "sharedassets0.assets"),
  (Join-Path $data "level0")
)

$old = [Text.Encoding]::UTF8.GetBytes("Hungarian")
$new = [Text.Encoding]::UTF8.GetBytes("Türkçe ")

foreach ($file in $displayFiles) {
  if (!(Test-Path $file)) { continue }

  $backup = "$file.bak-before-turkish-option"
  if (!(Test-Path $backup)) {
    Copy-Item -LiteralPath $file -Destination $backup
    Write-Host "Yedek olusturuldu: $backup"
  }

  $fileBytes = [IO.File]::ReadAllBytes($file)
  $count = Replace-BytesSameLength $fileBytes $old $new
  if ($count -gt 0) {
    [IO.File]::WriteAllBytes($file, $fileBytes)
  }
  Write-Host "$file icinde $count dil etiketi degistirildi."
}

Write-Host "Kurulum tamamlandi. Oyunda English orijinal kalir; dil listesindeki Turkce secenegi Turkce modu acar."
