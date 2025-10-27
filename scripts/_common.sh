#!/bin/bash

par2_download_path="/tmp/par2cmdline-turbo"
par2_install_path="/usr/local/bin" # default path by make install

check_and_build_par2() {
    if [ ! -f "$par2_install_path" ]; then
        pushd "$par2_download_path"
            ynh_hide_warnings ./automake.sh
            ynh_hide_warnings ./configure
            ynh_hide_warnings make
            ynh_hide_warnings make install
            ynh_hide_warnings make clean
            ynh_hide_warnings make distclean
        popd
        ynh_safe_rm "$par2_download_path"
    fi
}
