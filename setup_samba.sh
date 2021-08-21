## Dumb script to create quick SMB Server with default unsafe settings - do not trust this SMB.conf file for critical purposes

echo "Installing samba and cifs-utils"
sudo apt install samba cifs-utils;
echo "Moving the default config to smb.conf.old"
sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.old;
echo "Creating new smb.conf file"
sudo echo "[NewShare]
        path = /media/user
        browseable = yes
        read only = no
        guest ok = no
        valid users = user" > /home/user/Desktop/smb.conf
sudo mv /home/user/Desktop/smb.conf /etc/samba/smb.conf
echo "Restarting service..." && systemctl restart smbd
echo "Change SMB login password for user"
sudo smbpasswd -a user;
echo "Showing my IP addresses:"
ifconfig | grep inet
