# Launch LibreTranslate locally via PowerShell
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
if (-not $ScriptDir) { $ScriptDir = $PSScriptRoot }

$HostIP = "127.0.0.1"
$Port = 5000
$Languages = "en,hi"

$LTExe = Join-Path $ScriptDir "..\.venv\Scripts\libretranslate.exe"

if (-not (Test-Path $LTExe)) {
    Write-Error "Could not find .venv\Scripts\libretranslate.exe. Please verify virtual environment."
    exit 1
}

Write-Host "=========================================" -ForegroundColor Cyan
Write-Host " Starting LibreTranslate ($HostIP:$Port)" -ForegroundColor Cyan
Write-Host " Active Models: $Languages" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan

& $LTExe --host $HostIP --port $Port --load-only $Languages
