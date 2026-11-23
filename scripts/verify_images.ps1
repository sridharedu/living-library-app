# verify_images.ps1
param(
    [string]$ProjectDir = $PSScriptRoot + "\.."
)

$manifestPath = Join-Path $ProjectDir "data\image_manifest.json"
$imagesDir = Join-Path $ProjectDir "images"
$placeholderPath = Join-Path $imagesDir "placeholder.png"

if (-not (Test-Path $manifestPath)) { throw "Manifest not found at $manifestPath" }
if (-not (Test-Path $placeholderPath)) { throw "placeholder.png not found at $placeholderPath" }

$placeholderSize = (Get-Item $placeholderPath).Length
$manifest = Get-Content $manifestPath -Raw | ConvertFrom-Json

$total = $manifest.Count
$existing = 0
$customReplaced = 0
$placeholders = 0
$missing = 0

foreach ($item in $manifest) {
    $filePath = Join-Path $imagesDir $item.imageFileName
    if (Test-Path $filePath) {
        $existing++
        $fileSize = (Get-Item $filePath).Length
        if ($fileSize -ne $placeholderSize) {
            $customReplaced++
        } else {
            $placeholders++
        }
    } else {
        $missing++
    }
}

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " LIVING LIBRARY IMAGE VERIFICATION REPORT" -ForegroundColor Yellow
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "Total Topics in Library:       $total"
Write-Host "Total Mapped Files on Disk:    $existing"
Write-Host "Custom Original Diagrams:      $customReplaced" -ForegroundColor Green
Write-Host "Default Placeholders:          $placeholders" -ForegroundColor Yellow
Write-Host "Missing Files:                 $missing" -ForegroundColor $(if ($missing -eq 0) { "Green" } else { "Red" })
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "Progress: $([math]::Round(($customReplaced / $total) * 100, 2))% original diagrams populated." -ForegroundColor Cyan
