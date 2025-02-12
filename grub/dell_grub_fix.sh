#!/bin/bash
###############################################################################
# dell_grub_fix.sh
#
# This shell script edits the grub.cfg to unlock turbo
###############################################################################

echo "### Adding script to grub.d/ ..."
cp ./grub/90_dell_grub_fix.sh /etc/grub.d/90_dell_grub_fix.sh
echo "### Adding script to grub.d/ DONE"

echo "### Updating grub ..."
sudo update-grub
echo "### Updating grub DONE"
