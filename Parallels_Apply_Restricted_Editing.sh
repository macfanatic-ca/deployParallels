########################## Variables ##########################
# Name of VM looking to restrict
vmname="vm_name"
# Password used to restrict
vmpassword=pass_in_clear

######################### Do Not Edit #########################
# Find out who's logged in
USER=`who | grep console | awk '{print $1}'`

# Find Restriction status
editr=$(sudo -u $USER /Applications/Parallels\ Desktop.app/Contents/MacOS/prlctl list "$vmname" -i | grep -i Edit | awk '{print $3}')
echo $editr

# If yes, exit
if [ "$editr" == "yes" ]; then
echo "$vmname already protected"
exit 0

# If no, set password
elif [ "$editr" == "no" ]; then
echo "$vmname not protected"
expect <<- DONE
set timeout -1
spawn sudo -u $USER /Applications/Parallels\ Desktop.app/Contents/MacOS/prlctl set "$vmname" --password-to-edit
expect "*?assword:*"
send "$vmpassword\n"
expect "*?assword:*"
send "$vmpassword\r"
expect EOF
DONE

# Announce new status
checkr=$(sudo -u $USER /Applications/Parallels\ Desktop.app/Contents/MacOS/prlctl list "$vmname" -i | grep -i Edit)
echo $checkr

# Else, return error
else
echo "Unable to find $vmname"
fi
