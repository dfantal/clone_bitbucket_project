# clone_bitbucket_project
Script to clone a bitbucket project and all its repositories locally. Feel free to use this. I use it for personal development as I often like to create new vms to test in and getting all the code there is tedious for large numbers of repos.

## Instructions

1. Put init_modules.sh in the directory you want to clone project into.
2. Ensure init_modules.sh is executable ("chmod +x init_modules.sh")
3. execute init_modules.sh. You will be prompted for the host of your bitbucket instance, credentials, and the key of the project you are retrieving. 
4. IMPORTANT! Make sure you give the key in lowercase. // TODO: make it so the script does the lowercasing
5. You'll get a new directory named after the project key, and inside there will be all the repos from that project
