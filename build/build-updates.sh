#!/bin/bash -e
#
# $Id: build-updates.sh 12790 2016-01-16 01:37:16Z NiLuJe $
#

HACKNAME="crp"
PKGNAME="${HACKNAME}"
PKGVER="2.N"

# We need kindletool (https://github.com/NiLuJe/KindleTool) in $PATH
if (( $(kindletool version | wc -l) == 1 )) ; then
	HAS_KINDLETOOL="true"
fi

if [[ "${HAS_KINDLETOOL}" != "true" ]] ; then
	echo "You need KindleTool (https://github.com/NiLuJe/KindleTool) to build this package."
	exit 1
fi


## NOTE: Doesn't work on the Touch, for some strange reason... Bundle it anyway, since it works when called manually, later in the boot process...
# Install
kindletool create ota2 -d kindle5 -C ../src/install  Update_${PKGNAME}_${PKGVER}_install.bin
# Uninstall
kindletool create ota2 -d kindle5 -C ../src/uninstall Update_${PKGNAME}_${PKGVER}_uninstall.bin


## Move our updates
mv -f *.bin ../
