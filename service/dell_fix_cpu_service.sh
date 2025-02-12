#!/usr/bin/bash

###############################################################################
# dell_fix_cpu_service.sh
#
# This shell script is to unblock the CPU throttle on Dell Optiplex due to
# power adapter not being detected properly in BIOS.
###############################################################################

# This program should live in /usr/local/sbin
echo "### Service removing frequency limit for current session ..."
wrmsr -a 0x1a0 0x850089
echo 0 | tee /sys/devices/system/cpu/intel_pstate/no_turbo
echo "### Service removing frequency limit for current session DONE"
