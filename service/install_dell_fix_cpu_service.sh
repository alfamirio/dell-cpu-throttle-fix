#!/usr/bin/bash

###############################################################################
# install.sh
#
# This shell script install the unlock frequency script as a service
###############################################################################

# We check the service is ok
echo "### Removing frequency limit ..."
apt-get update
apt-get install -y msr-tools
./service/dell_fix_cpu_service.sh
echo "### Removing frequency limit DONE"

echo "### Configuring the service for removing frequency limit for a session ..."
cp ./service/dell_fix_cpu_service.sh /usr/local/sbin/dell_fix_cpu_service.sh
mkdir -p /usr/local/lib/systemd/system/
cp ./service/dell_fix_cpu_service.service /usr/local/lib/systemd/system/dell_fix_cpu_service.service
ln -s /usr/local/lib/systemd/system/dell_fix_cpu_service.service /etc/systemd/system/dell_fix_cpu_service.service
systemctl start dell_fix_cpu_service.service
systemctl enable dell_fix_cpu_service.service
systemctl status dell_fix_cpu_service.service
echo "### Configuring the service for removing frequency limit for a session DONE"
