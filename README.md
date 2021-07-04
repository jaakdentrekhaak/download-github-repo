# About
Author: Jens Putzeys   
Date: 3 jul 2021  

Description: Download all your Github repositories to zipfiles  

I run this program scheduled on my NAS to backup my Github repositories.

# How to run (Linux)
1. Clone this project
2. Open a terminal in the directory of this project
3. Fill in your token, username and output directory in the download_github_repo.sh file like this:
    ```shell
    TOKEN="your_personal_access_token"
    USERNAME="your_github_username"
    OUTPUT_DIR="path/to/output/directory"
    ```
    The token is a personal access token which can be generated on Github: https://github.com/settings/tokens  
5. Run `bash download_github_repo.sh`
6. The program will now download all your Github repositories to your current directory in zip-format
