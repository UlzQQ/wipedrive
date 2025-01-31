Simple bash script to securely wipe a drive in 3 passes.
This script will irreversably destroy all data on a drive using basic methods. 
For highly sensitive data, consider a more secure option like shred or nwipe.

Process:

1st Pass: /dev/zero

2nd Pass: /dev/urandom

3rd Pass: /dev/zero

Syntax: sudo ./wipe_drive.sh /dev/sdX

(X being the correct letter for your drive, i.e /dev/sda)
