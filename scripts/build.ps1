# build.ps1 - Compiles docs/*.md into index.html
param(
    [string]$ProjectDir = $PSScriptRoot + "\.."
)

$ErrorActionPreference = 'Stop'

$indexPath = Join-Path $ProjectDir "index.html"
$docsDir = Join-Path $ProjectDir "docs"
$imagesDir = Join-Path $ProjectDir "images"

if (-not (Test-Path $indexPath)) { throw "index.html not found at $indexPath" }
if (-not (Test-Path $docsDir)) { throw "docs/ folder not found at $docsDir" }

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " LIVING LIBRARY BUILD SCRIPT: Compiling docs/*.md -> index.html" -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan

$html = [System.IO.File]::ReadAllText($indexPath, [System.Text.Encoding]::UTF8)

# Extract library JSON
$startMarker = 'const INITIAL_LIBRARY='
$startIdx = $html.IndexOf($startMarker) + $startMarker.Length
$m = [regex]::Match($html.Substring($startIdx), ';(\r?\n)?const EMBEDDED_LIBRARY_ID')
if (-not $m.Success) { throw "Could not locate EMBEDDED_LIBRARY_ID" }
$endIdx = $startIdx + $m.Index
$jsonStr = $html.Substring($startIdx, $endIdx - $startIdx).Trim()
$lib = $jsonStr | ConvertFrom-Json

function Slugify([string]$val) {
    if ([string]::IsNullOrWhiteSpace($val)) { return "" }
    $s = $val.ToLower()
    $s = [regex]::Replace($s, '[^a-z0-9]+', '_')
    $s = $s.Trim('_')
    return $s
}

$updatedFromMd = 0
$total = 0

foreach ($sec in $lib) {
    $sSlug = Slugify $sec.name
    foreach ($grp in $sec.groups) {
        $gSlug = Slugify $grp.name
        foreach ($top in $grp.topics) {
            $total++
            $tSlug = Slugify $top.title
            $mdFileName = "${sSlug}__${gSlug}__${tSlug}.md"
            $mdFilePath = Join-Path $docsDir $mdFileName

            if (Test-Path $mdFilePath) {
                $mdContent = [System.IO.File]::ReadAllText($mdFilePath, [System.Text.Encoding]::UTF8)
                if ($mdContent -ne $top.explanation) {
                    $top.explanation = $mdContent
                    $updatedFromMd++
                }
            }
        }
    }
}

Write-Host "Scanned $total topics in library." -ForegroundColor Green
Write-Host "Updated $updatedFromMd topics from modified .md files in docs/." -ForegroundColor Green

# Hash library
$newJson = $lib | ConvertTo-Json -Depth 6 -Compress

function Hash-Snapshot([string]$text) {
    $hash = [uint32]2166136261
    for ($i = 0; $i -lt $text.Length; $i++) {
        $hash = $hash -bxor [uint32][int]$text[$i]
        $hash = [uint32](($hash * [uint32]16777619) -band 0xFFFFFFFF)
    }
    return $hash.ToString("x8")
}

$nextId = Hash-Snapshot $newJson

# Get current revision and bump it
$revMatch = [regex]::Match($html, 'EMBEDDED_LIBRARY_REVISION=(\d+)')
$currentRev = if ($revMatch.Success) { [int]$revMatch.Groups[1].Value } else { 4 }
$nextRev = $currentRev + 1

$stableMatch = [regex]::Match($html, 'EMBEDDED_STABLE_VERSION=(\d+)')
$stableVer = if ($stableMatch.Success) { [int]$stableMatch.Groups[1].Value } else { 0 }

# Slicing replacement
$revMarker = 'const EMBEDDED_LIBRARY_REVISION='
$revIdx = $html.IndexOf($revMarker, $html.IndexOf($startMarker))
$lineEndIdx = $html.IndexOf(';', $revIdx)

$before = $html.Substring(0, $html.IndexOf($startMarker))
$after = $html.Substring($lineEndIdx + 1)

$replacement = @"
const INITIAL_LIBRARY=$newJson;
const EMBEDDED_LIBRARY_ID='$nextId';
const EMBEDDED_STABLE_VERSION=$stableVer;
const EMBEDDED_LIBRARY_REVISION=$nextRev;
"@

$html = $before + $replacement + $after

# Update version badges in HTML
$formattedVer = if ($stableVer -gt 0) { "V$stableVer." + $nextRev.ToString().PadLeft(3, '0') } else { "V." + $nextRev.ToString().PadLeft(3, '0') }
$html = [regex]::Replace($html, '<b id="downloadVersion">[^<]*</b>', "<b id=""downloadVersion"">$formattedVer</b>")
$html = [regex]::Replace($html, '<small id="mobileDownloadVersion">[^<]*</small>', "<small id=""mobileDownloadVersion"">$formattedVer</small>")

[System.IO.File]::WriteAllText($indexPath, $html, [System.Text.Encoding]::UTF8)

Write-Host "Successfully compiled index.html with revision $formattedVer (ID: $nextId)!" -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Cyan
