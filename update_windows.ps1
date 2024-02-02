# PowerShell script to update llama.cpp

# Store the current working directory
$current_dir = Get-Location

# Get the absolute path of the current directory
$abs_current_dir = Resolve-Path $current_dir

# Rename the current directory by appending ".old"
Set-Location ..
Rename-Item -Path $current_dir -NewName "$($current_dir).old"

# Store the renamed directory path
$old_dir = "${abs_current_dir}.old"

# Change to the user's home directory
Set-Location $env:USERPROFILE

# Clone the llama.cpp repository
git clone https://github.com/ggerganov/llama.cpp

# Change to the newly cloned repository directory
Set-Location llama.cpp

# Store the new build directory path
$new_dir = Get-Location

# Move the update_windows.ps1 script to the new directory
Move-Item -Path "${old_dir}\update_windows.ps1" -Destination "${new_dir}\update_windows.ps1"

# Print the new llama.cpp directory path
Write-Output "New llama.cpp directory: ${new_dir}"

# Create a new directory for the build files
New-Item -ItemType Directory -Force -Path build

# Change to the new build directory
Set-Location build

# Run 'cmake' in the newly created directory
cmake ..

# Then compile the project with 'cmake --build'
cmake --build .

# Prompt the user to move the contents of the 'models' folder
$move_models = Read-Host -Prompt "Do you want to move the contents of the 'models' folder from '${old_dir}\models' to '${new_dir}\models'? [y/N]"
if ($move_models -match "^[Yy]$") {
    robocopy "${old_dir}\models" "${new_dir}\models" /E /Z /MT:8
}

# Prompt the user to move the contents of the 'prompts' folder
$move_prompts = Read-Host -Prompt "Do you want to move the contents of the 'prompts' folder from '${old_dir}\prompts' to '${new_dir}\prompts'? [y/N]"
if ($move_prompts -match "^[Yy]$") {
    robocopy "${old_dir}\prompts" "${new_dir}\prompts" /E /Z /MT:8
}

# Optionally, change back to the new working directory (llama.cpp)
Set-Location "${new_dir}"

# Press enter to exit
Read-Host -Prompt "Press Enter to exit"
