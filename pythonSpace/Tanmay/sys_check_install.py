#!/usr/bin/python3.8

import os, wget, urllib, sys, subprocess

kubectl_version = "v1.21.0"



def check_os_func():
    print("Checking your Operating System type")
    if sys.platform == "linux" or sys.platform == "linux2":
        print("You have Linux OS")
        dwnld_install_kubectl_linux()

    elif sys.platform == "win32":
        print("You have Windows OS")
        download_kubectl_windows()
    else:
        return "OS is neither Linux nor windows"

def check_env_vars():
    pass

def dwnld_install_kubectl_linux():

    print("Downloading kubectl.......................")
    subprocess.run('curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"',shell=True)
    print("Installing kubectl......................")
    subprocess.run('sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl',shell=True)
    dwnld_install_awscli_linux()
    
def dwnld_install_awscli_linux():
    
    print("Downloading AWS cli......................")
    subprocess.run('curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"',shell=True)
    print("Unzipping AWS cli......................")
    subprocess.run('unzip awscliv2.zip',shell=True)
    print("Installing AWS cli......................")
    subprocess.run('sudo ./aws/install',shell=True)
                

def download_kubectl_windows():

    my_sys_paths = os.environ['path']

    chk_path ="C:\\bin\\"

    print("checking if 'C:\\bin\\' path exists or not")

    if chk_path in my_sys_paths:
        print("Path exists")

        print("Downloading kubectl on the path")

        remote_url = "https://dl.k8s.io/release/"+kubectl_version+"/bin/windows/amd64/kubectl.exe"
    
        local_file = "C:\\bin\\kubectl.exe"

        try:
            wget.download( remote_url , local_file )
            print("File succesfully downloaded")

            
            download_aws_cli_windows()
        
        except ( urllib.error.HTTPError , urllib.error.URLError ) as exception:
            print(exception)
            
        except:
            print("Error Occured")

        
    else:
        print("Path does not exist")  





def download_aws_cli_windows():

    print("Downloading aws cli ")
    aws_cli_url = "https://awscli.amazonaws.com/AWSCLIV2.msi"

    local_awscli_installer = "AWSCLIV2.msi"

    try:
        wget.download(aws_cli_url, local_awscli_installer)
        print("File succesfully downloaded")
        print("New window will open kindly complete the AWS cli installation")


        os.startfile("AWSCLIV2.msi")

    except (urllib.error.HTTPError, urllib.error.URLError ) as exception:
        print(exception)

    except:
        print("Error Occured")


check_os_func()
