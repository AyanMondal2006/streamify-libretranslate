# Start LibreTranslate in the background without keeping a console window open
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
if (-not $ScriptDir) { $ScriptDir = $PSScriptRoot }

$LTExe = Join-Path $ScriptDir "..\.venv\Scripts\libretranslate.exe"
$PidFile = Join-Path $ScriptDir "..\.server.pid"

if (-not (Test-Path $LTExe)) {
    Write-Error "Could not find .venv\Scripts\libretranslate.exe"
    exit 1
}

# Check if already running
if (Test-Path $PidFile) {
    $OldPid = Get-Content $PidFile -ErrorAction SilentlyContinue
    if ($OldPid -and (Get-Process -Id $OldPid -ErrorAction SilentlyContinue)) {
        Write-Host "LibreTranslate is already running in background (PID: $OldPid)." -ForegroundColor Yellow
        exit 0
    }
}

$Process = Start-Process -FilePath $LTExe -ArgumentList "--host 127.0.0.1 --port 5000 --load-only en,hi" -WindowStyle Hidden -PassThru
$Process.Id | Out-File -FilePath $PidFile -Encoding ascii

Write-Host "==========================================================" -ForegroundColor Green
Write-Host " LibreTranslate started in background! (PID: $($Process.Id))" -ForegroundColor Green
Write-Host " Server running on http://127.0.0.1:5000" -ForegroundColor Green
Write-Host " To stop it, run .\scripts\stop_background.ps1" -ForegroundColor Gray
Write-Host "==========================================================" -ForegroundColor Green
