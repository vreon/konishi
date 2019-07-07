#!/bin/bash

rst=$(tput sgr0)
bld=$(tput bold)
blu=$(tput setaf 4)

for pth in $(find upstream -maxdepth 1 -mindepth 1); do
    pushd $pth >/dev/null
    echo -e "${bld}${blu}--> Generating ${pth}${rst}"
    ./generate.sh
    popd >/dev/null
done
