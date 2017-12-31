#!/bin/sh
## description: Show interface IP address at boot on the console with CentOS/RHEL7

## check if running as root

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

## /check if running as root

## copy original /etc/issue

if [ ! -f /etc/issue.orig ]; then
    cp /etc/issue /etc/issue.orig
fi
## /copy original /etc/issue

## following script that when run will overwrite /etc/issue with the contents of /etc/issue.orig + IP address.

if [ ! -f /sbin/ifup-local ]; then

cat > /sbin/ifup-local << EOL
#!/bin/sh

if [ "$1" = lo ]; then
    exit 0
fi

cp /etc/issue.orig /etc/issue
/usr/local/bin/get-ip-address >> /etc/issue
echo "" >> /etc/issue
EOL

fi

if [ ! -x /sbin/ifup-local ]; then
#check if a file is executable
chmod u+x /sbin/ifup-local
fi

## /following script that when run will overwrite /etc/issue with the contents of /etc/issue.orig + IP address.

## run "ip a s" and print out the IP address (after filtering out the localhost interface)

if [ ! -f /usr/local/bin/get-ip-address ]; then

cat > /usr/local/bin/get-ip-address << EOL
ip a | grep glo | awk '{print $2}' | head -1 | cut -f1 -d/
EOL

fi

if [ ! -x /usr/local/bin/get-ip-address ]; then
#check if a file is executable
chmod u+x /usr/local/bin/get-ip-address
fi

## /run "ip a s" and print out the IP address (after filtering out the localhost interface)
