from sys import platform
import os, wget

def check_os_func():
    if platform == "linux" or platform == "linux2":
        return 1
    elif platform == "win32":
        return 2

def check_env_vars():
    if len(os.environ) != 0 :
        return "Y"
    else:
        return "N"

def download_file_from_web():

    remote_url = 'https://dl.k8s.io/release/v1.21.0/bin/windows/amd64/kubectl.exe'

    local_file = 'kubectl.exe'
    
    try:
        wget.download(remote_url, local_file)
        return "\nY"
    except:
        return "\nUnable to Download"


my_options = int(input("Type 1 to check OS. (Output : 1 for Linux, 2 for Windows) \nType 2 to check if ENV variables exist. \nType 3 to check successful download of file. \n\n"))

print("\nYou've entered ",my_options)

if my_options == 1:
    print(check_os_func())
elif my_options == 2:
    print(check_env_vars())
elif my_options == 3:
    print(download_file_from_web())
else:
    print("please type number between 1, 2 or 3")
