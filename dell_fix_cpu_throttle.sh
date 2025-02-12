#!/usr/bin/bash

###############################################################################
# dell_fix_cpu_throttle.sh
#
# This shell script is to unblock the CPU throttle on Dell Optiplex due to
# power adapter not being detected properly in BIOS. 
# This program is expected to be run only once.
# Use the once script for a temporary patch.
###############################################################################

# manual patch first
echo "### Removing frequency limit for current session ..."
apt-get update
apt-get install -y msr-tools
wrmsr -a 0x1a0 0x850089
echo 0 | tee /sys/devices/system/cpu/intel_pstate/no_turbo
echo "### Removing frequency limit for current session DONE"

echo -e "\n\n"
# patch and forget now

## we run first the grub patch
./grub/dell_grub_fix.sh

echo -e "\n\n"

## we run later the grub patch
./service/install_dell_fix_cpu_service.sh
