# Dell Optiplex CPU Throttle Fix for Linux (PSU related)
Linux start scritps for fixing Dell Optiplex CPU throttle due to non original power adapter detection.

It seems some Dell units like some Optiplex micros detect non original chargers and enable cpu frequency limitation.

Uso sudo to run the scripts.

# The problem
It seems the problem is related BD PROCHOT, a flag to indicate the cpu to enable temperature restrictions.
If you use Windows, you can use throttlestop.

# The solution
Run the script
dell_fix_cpu_throttle.sh
after installing the OS to remove the CPU throttle. Restart the device and enjoy.

# The scripts
## Grub fix
Modifies the grub boot to speed up from the first moment
Modifies the grub.cfg so each new grub configuration file after a kernel update will be created with the unlocking code

## Service
Creates a service to unthrottle during the load phase of the os
Install a common service to unlock the speed during the loading of the os
