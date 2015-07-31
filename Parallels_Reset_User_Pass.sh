########################## Variables ##########################
# Name of VM looking to restrict
vmname="vm_name"
# User in VM
vmuser="user"

######################### Do Not Edit #########################
# Find out who's logged in
USER=`who | grep console | awk '{print $1}'`

# Generate Random Password
openssl rand -base64 6 > ~/Desktop/$vmname\ User\ Password.txt
vmuserpass=$(cat ~/Desktop/$vmname\ User\ Password.txt)

# Change Password for vmuser
/Applications/Parallels\ Desktop.app/Contents/MacOS/prlctl set "$vmname" --userpasswd $vmuser:$vmuserpass
