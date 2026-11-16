# Stop the background LibreTranslate process
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
if (-not $ScriptDir) { $ScriptDir = $PSScriptRoot }

$PidFile = Join-Path $ScriptDir "..\.server.pid"
$Stopped = $false

if (Test-Path $PidFile) {
    $SavedPid = Get-Content $PidFile -ErrorAction SilentlyContinue
    if ($SavedPid) {
        $Proc = Get-Process -Id $SavedPid -ErrorAction SilentlyContinue
        if ($Proc) {
            Stop-Process -Id $SavedPid -Force
            Write-Host "Stopped background LibreTranslate process (PID: $SavedPid)." -ForegroundColor Green
            $Stopped = $true
        }
    }
    Remove-Item $PidFile -Force -ErrorAction SilentlyContinue
}

# Fallback: check for any rogue libretranslate processes
$Remaining = Get-Process libretranslate -ErrorAction SilentlyContinue
if ($Remaining) {
    $Remaining | Stop-Process -Force
    Write-Host "Stopped remaining LibreTranslate processes." -ForegroundColor Green
    $Stopped = $true
}

if (-not $Stopped) {
    Write-Host "No active background LibreTranslate process found." -ForegroundColor Yellow
}
