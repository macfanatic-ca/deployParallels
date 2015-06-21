# Parallels Deployment

Deploying Parallels (and associated VMs) in a secure fasion requires additional steps, outside of Parallel's Deployment strategy.

## EA_for_Restricted_Editing

This Extension Attribute will display the Restricted Editing (RE) status of a Parallels VM.  As of Parallels 9, VM's deployed do not retain their RE status.

## Parallels_Apply_Restricted_Editing.sh

This script applies RE to the specified VM with the specified Password.  Typically run after VM deployment, and within the same policy.

## Parallels_Reset_User_Pass.sh

Because binding a VM to AD/LDAP is discouraged, we typically deploy VMs with a single local user.  Although the username is the same for all end users, we do not supply them with a password.  This script is placed within Self Service to provide them with access.
