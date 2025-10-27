#!/bin/bash

par2_download_path="/tmp/par2cmdline-turbo"
par2_install_path="/usr/local/bin/par2" # default path by make install

check_and_build_par2() {
    ynh_script_progression "Checking if par2cmdline-turbo is installed..."

    if [ ! -f "$par2_install_path" ]; then
        ynh_script_progression "par2cmdline-turbo not found, building..."

        pushd "$par2_download_path"
            ynh_hide_warnings ./automake.sh
            ynh_hide_warnings ./configure
            ynh_hide_warnings make
            ynh_hide_warnings make install
            ynh_hide_warnings make clean
            ynh_hide_warnings make distclean
        popd

        ynh_script_progression "par2cmdline-turbo built, removing temporary directory..."
        rm -r "$par2_download_path"
    else
        ynh_script_progression "par2cmdline-turbo already installed, skipping build"
    fi
}