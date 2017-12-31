# Show_IP_address_of_VM_as_console_pre-login_message


In case you didn’t know the pre-login message you see at a Linux console typically comes from /etc/issue

You can customize this file to alter the message with some escape codes that will show things like the current date and time, 
machine name and domain, kernel version, etc. But one thing you can’t easily display is the IP address of a machine.
Showing the IP address is especially useful when building a virtual machine that will use DHCP,
like the Ubuntu development VM I use on my Macbook Pro. This way I can start VMware Fusion,
see the IP address of the VM and then login over SSH.

source: http://offbytwo.com/2008/05/09/show-ip-address-of-vm-as-console-pre-login-message.html
