# Remote machines management software

>[!WARNING]
> This software is still under development and it can contain bugs, so use it under your own risk.

## Description
This software manage the access to multiple remote machines using SSH tunnels and RSA Keys, before each VNC connection
a SSH tunnel is opened. The access password for each remote machine is used on the first connection to set up the RSA Keys,
for the next connections the remote machine uses the private RSA Key of the local HOST to verify it's identity without the need
of entering the password.


## Instructions
### To install:

> sudo ./install.sh


### To uninstall:

> dev_vnc -u 

To add remote machines edit the `virtual-machines.conf` file following this sintax, 
> `machine_name`=`IP`:`PORT`

User related information like the `USER` for remote access can be configured in `user-config.conf` file.

> [!TIP]
> Configurations files can be edited before the installation inside `configs` folder, to edit them after the installation
> find them on the installation path.


> [!IMPORTANT]
> - Installations paths can be customized in `params.conf` file.
> - Default VNC tool is RealVNC, this software use `.vnc` session files in order to make the remote connections.
> - These files should be located inside `sessions` folder for the software to work,
>   `.vnc` files of existing connections can be exported from RealVNC software.
> - The name of each `name.vnc` file should match the name of the machine defined in `virtual-machines.conf`.


>[!NOTE]
> Export the connections with password to don't have to enter it each time.
