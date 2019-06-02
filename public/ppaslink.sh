#!/bin/sh
DoExitAsm ()
{ echo "An error occurred while assembling $1"; exit 1; }
DoExitLink ()
{ echo "An error occurred while linking $1"; exit 1; }
OFS=$IFS
IFS="
"
/Library/Developer/CommandLineTools/usr/bin/ld /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib/crt1.10.5.o        -multiply_defined suppress -L. -o public/app.cgi `cat public/link.res`
if [ $? != 0 ]; then DoExitLink ; fi
IFS=$OFS
