# Prompt the user for the Steam App ID
Clear
$steamAppID = Read-Host "Enter the Steam App ID"

# Define the path to the text file
$filePath = Join-Path $pwd "steam_appid.txt"

# Check if the file exists
if (Test-Path $filePath) {
    try {
        # Read the content of the file into an array of lines
        $fileContent = Get-Content $filePath

        # Update the first line with the provided Steam App ID
        $fileContent[0] = "$steamAppID"

        # Write the updated content back to the file
        $fileContent | Set-Content $filePath

        Write-Host "Steam App ID updated successfully."
        Write-Host "Launching hl2 as $steamAppID"
        Start-Process -FilePath "cmd.exe" -ArgumentList "/k start hl2.exe -game steamidlesource +console -windowed -w 1280 -h 720 && exit"
         
    } catch {
        Write-Host "Error updating the Steam App ID: $_"
    }
} else {
    Write-Host "The file $filePath does not exist."
}
