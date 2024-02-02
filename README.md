# Llama.cpp Update Script

This PowerShell script is used to update the `llama.cpp` repository to the latest version. It also moves the `update_windows.ps1` script to the new directory and compiles the project using `cmake`.

## Prerequisites

- Git
- CMake
- PowerShell

## Usage

1. Save the script as `update_windows.ps1` in your `llama.cpp` directory.
2. Open PowerShell and navigate to the directory containing `update_windows.ps1`.
3. Run the script with the command `./update_windows.ps1`.

## What the Script Does

1. Stores the current working directory and its absolute path.
2. Renames the current directory by appending ".old".
3. Changes to the user's home directory.
4. Checks if the `llama.cpp` directory already exists. If it does, it deletes it.
5. Clones the `llama.cpp` repository from GitHub.
6. Changes to the newly cloned repository directory.
7. Moves the `update_windows.ps1` script to the new directory.
8. Prints the new `llama.cpp` directory path.
9. Creates a new directory for the build files.
10. Changes to the new build directory.
11. Runs `cmake` in the newly created directory.
12. Compiles the project with `cmake --build`.
13. Prompts the user to move the contents of the 'models' folder from the old directory to the new one.
14. Prompts the user to move the contents of the 'prompts' folder from the old directory to the new one.
15. Changes back to the new working directory (`llama.cpp`).
16. Pauses at the end and prompts the user to press Enter to exit.

## Notes

- The script assumes that `git` and `cmake` are installed on your machine and are available in your system's PATH.
- The script will only work if `llama.cpp` is a git repository.
- Always back up your files before running the script to prevent any data loss.

# License
Apache 2.0 license
