echo "Moving the default config to smb.conf.old"
sudo mv /etc/samba/smb.conf.old;
echo "Creating new smb.conf file"
sudo echo "[NewShare]
        path = /media/user
        browseable = yes
        read only = no
        guest ok = no
        valid users = user" > /etc/smb/smb.conf
echo "Restarting service..."
systemctl restart smbd;
echo "Change SMB login password for user"
sudo smbpasswd -a user;
ifconfig | grep inet
