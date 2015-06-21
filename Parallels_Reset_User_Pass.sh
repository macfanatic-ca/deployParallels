########################## Variables ##########################
# Name of VM looking to restrict
vmname="vm_name"
# User in VM
vmuser="user"

######################### Do Not Edit #########################
# Find out who's logged in
USER=`who | grep console | awk '{print $1}'`

# Generate Random Password
openssl rand -base64 6 > /tmp/userpass.txt
vmuserpass=$(cat /tmp/userpass.txt)

# Change Password for vmuser
sudo -u $USER /Applications/Parallels\ Desktop.app/Contents/MacOS/prlctl set "$vmname" --userpasswd $vmuser:$vmuserpass

# Reveal Password
mv /tmp/userpass.txt /Users/$USER/Desktop/$vmname\ User\ Password.txt
