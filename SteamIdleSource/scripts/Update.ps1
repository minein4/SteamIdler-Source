# GitHub repository owner and name
$owner = 'minein4'
$repoName = 'SteamIdler-Source'
$apiUrl = "https://api.github.com/repos/$owner/$repoName/commits/main"
$aboutCommand = Join-Path $pwd "SteamIdleSource\cfg\about.cfg"


# Download the commit has and save it to memory
$response = Invoke-RestMethod -Uri $apiUrl
$lastCommitSha = $response.sha.Substring(0, 7)

# Display commmit hash and write it to about.cfg
Write-Host "$pwd"
Write-Host "Last Commit: $lastCommitSha"

# Read the file into an array of lines
$lines = Get-Content -Path $aboutCommand
$newContent = "echo `"║                 $lastCommitSha               ║`""

# Check if the file has at least 12 lines
if ($lines.Count -ge 12) {
    # Modify the 12th line (index 11) with the new content
    $lines[11] = $newContent

    # Save the modified content back to the file
    $lines | Set-Content -Path $aboutCommand
    Write-Host "Updated $aboutcommand to include latest version info"
} else {
    Write-Host "ERROR! File located at $aboutcommand does not have 12 lines or more it seems to have been modified or is now in a different format. Oops i guess."
}
