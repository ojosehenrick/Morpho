# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
do.cleanup=1
do.cleanuponabort=0
} # end properties

# shell variables
block=

## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;

## AnyKernel permissions
# set permissions for included ramdisk files
chmod -R 755 $ramdisk
chmod +x $ramdisk/sbin/spa

# Find boot partition
find_boot;

## AnyKernel install
dump_boot;

# begin ramdisk changes

# init.rc
backup_file init.rc;
grep "import /init.spectrum.rc" init.rc >/dev/null || sed -i '1,/.*import.*/s/.*import.*/import \/init.spectrum.rc\n&/' init.rc
# end ramdisk changes

write_boot;

# end install