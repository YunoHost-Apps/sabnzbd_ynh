#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# SABnzbd version to install
# Change this version to install a specific version of SABnzbd
SABNZBD_VERSION="4.5.3"
SABNZBD_SHA256="c745eeb9f66939f9257ad06042b63fac575aea44604bcdf90bbc8a33cd13e4a0"

#=================================================
# PERSONAL HELPERS
#=================================================

# Function to update SABnzbd version in manifest.toml
update_sabnzbd_version() {
    local new_version="$1"
    local new_sha256="$2"
    local manifest_file="$YNH_APP_BASEDIR/../manifest.toml"
    
    if [ -f "$manifest_file" ]; then
        # Update version in manifest
        sed -i "s/version = \"[0-9]\+\.[0-9]\+\.[0-9]\+~ynh[0-9]\+\"/version = \"${new_version}~ynh1\"/" "$manifest_file"
        
        # Update URL in manifest
        sed -i "s|url = \"https://github.com/sabnzbd/sabnzbd/releases/download/[0-9]\+\.[0-9]\+\.[0-9]\+/SABnzbd-[0-9]\+\.[0-9]\+\.[0-9]\+-src\.tar\.gz\"|url = \"https://github.com/sabnzbd/sabnzbd/releases/download/${new_version}/SABnzbd-${new_version}-src.tar.gz\"|" "$manifest_file"
        
        # Update SHA256 in manifest
        sed -i "s/sha256 = \"[a-f0-9]\{64\}\"/sha256 = \"${new_sha256}\"/" "$manifest_file"
        
        ynh_print_info "Updated SABnzbd version to ${new_version} in manifest.toml"
    fi
}

#=================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
