#!/bin/bash

if [ -z $1 ]; then
    echo 'USAGE: $1->Path to dir with .flatpakref'
else
    echo $1
    cd $1
    ls | grep ".flatpakref"  > ./files_to_install
    FILE_TO_INSTALL=$(head --lines=1 ./files_to_install)
    while [ -n "$FILE_TO_INSTALL" ]; do
        flatpak install --assumeyes $FILE_TO_INSTALL
        sed -i 1d ./files_to_install
        FILE_TO_INSTALL=$(head --lines=1 ./files_to_install)
    done
fi



