# Project for provisioning centos 7 machine with development tools

## Provision Steps:
+ Add a "sync" folder under the project root, which will be ignored by git.
+ Run terminal (powershell) as Administrator
+ Enable SMB1 protocol by running the following command [[reference](https://docs.microsoft.com/en-us/virtualization/community/team-blog/2017/20170706-vagrant-and-hyper-v-tips-and-tricks)]:

        Enable-WindowsOptionalFeature -Online -FeatureName smb1protocol
+ Change $user variable on line 3 of default.pp file to the user name will be used.
+ Run *`vagrant up`*
+ After provision successfully, run *`vagrant ssh`*, ssh into the virtual machine
+ Run *`sudo su -`*, switch to *root*
+ Run *`passwd username`*, to change the password of the user name which set in the default.pp file.
+ Exit the virtual machine and record the ip address.
+ Launch *`mstc`* in windows, input the ip address recorded above, then connect to it.

## Components will be installed:
+ GNOME Desktop
+ xrdp 
+ tigervnc-server
+ vscode
+ C++ Development Kit (gcc, g++ and etc)
+ Go
+ Git
