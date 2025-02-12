#!/bin/bash
###############################################################################
# 90_dell_grub_fix.sh
#
# This shell script in grub.d/ is used to build the grub.cfg
###############################################################################

cat <<EOF
insmod wrmsr
wrmsr 0x1A0 0x850089
rmmod wrmsr
EOF

