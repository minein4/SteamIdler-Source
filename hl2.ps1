Write-Output "Welcome to SteamIdler Source"
$pwd = Get-Location
$steamidlersource = Join-Path $pwd "SteamIdleSource\scripts\SteamIdler.ps1"
$updater = Join-Path $pwd "SteamIdleSource\scripts\update.ps1"
Invoke-Expression -Command $updater
Invoke-Expression -Command $steamidlersource