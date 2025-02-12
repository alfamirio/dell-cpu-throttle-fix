#!/usr/bin/bash

###############################################################################
# dell_fix_cpu_throttle_once.sh
#
# This shell script is to unblock the CPU throttle on Dell Optiplex due to
# power adapter not being detected properly in BIOS. 
# This program is expected to be run manually after each boot (for example testing live cd isos).
# Use the other script for a permanent patch.
###############################################################################

# manual patch
echo "### Removing frequency limit for DELL for current session ..."
apt-get update
apt-get install -y msr-tools
wrmsr -a 0x1a0 0x850089
echo 0 | tee /sys/devices/system/cpu/intel_pstate/no_turbo
echo "### Removing frequency limit for DELL for current session DONE"
