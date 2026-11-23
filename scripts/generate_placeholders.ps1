# generate_placeholders.ps1
param(
    [string]$ProjectDir = $PSScriptRoot + "\.."
)

$imagesDir = Join-Path $ProjectDir "images"
$manifestPath = Join-Path $ProjectDir "data\image_manifest.json"
$placeholderPng = Join-Path $imagesDir "placeholder.png"

if (-not (Test-Path $manifestPath)) { throw "Manifest not found at $manifestPath" }
if (-not (Test-Path $placeholderPng)) { throw "Master placeholder.png not found at $placeholderPng" }

$manifest = Get-Content $manifestPath -Raw | ConvertFrom-Json
$bytes = [System.IO.File]::ReadAllBytes($placeholderPng)

$created = 0
foreach ($item in $manifest) {
    $targetFile = Join-Path $imagesDir $item.imageFileName
    if (-not (Test-Path $targetFile)) {
        [System.IO.File]::WriteAllBytes($targetFile, $bytes)
        $created++
    }
}

Write-Host "Generated $created missing placeholder images in $imagesDir." -ForegroundColor Green
