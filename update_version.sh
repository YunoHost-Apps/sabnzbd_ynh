#!/bin/bash

# Script to update SABnzbd version in the YunoHost package
# Usage: ./update_version.sh <version> [sha256]
# Example: ./update_version.sh 4.5.3 abc123def456...

set -e

if [ $# -lt 1 ]; then
    echo "Usage: $0 <version> [sha256]"
    echo "Example: $0 4.5.3"
    echo "Example: $0 4.5.3 c1867f35597c6f1b4235c9a478f3c67545a2b9d7d3df8404a21f70f921d5f644"
    exit 1
fi

VERSION="$1"
SHA256="$2"

# If SHA256 is not provided, try to fetch it
if [ -z "$SHA256" ]; then
    echo "Fetching SHA256 for version $VERSION..."
    URL="https://github.com/sabnzbd/sabnzbd/releases/download/$VERSION/SABnzbd-$VERSION-src.tar.gz"
    
    # Download the file temporarily to get its SHA256
    TEMP_FILE=$(mktemp)
    if wget -q "$URL" -O "$TEMP_FILE"; then
        SHA256=$(sha256sum "$TEMP_FILE" | cut -d' ' -f1)
        rm "$TEMP_FILE"
        echo "Calculated SHA256: $SHA256"
    else
        echo "Error: Could not download $URL"
        echo "Please provide the SHA256 manually or check if the version exists."
        rm -f "$TEMP_FILE"
        exit 1
    fi
fi

echo "Updating SABnzbd version to $VERSION..."

# Update _common.sh
sed -i '' "s/SABNZBD_VERSION=\"[^\"]*\"/SABNZBD_VERSION=\"$VERSION\"/" scripts/_common.sh
sed -i '' "s/SABNZBD_SHA256=\"[^\"]*\"/SABNZBD_SHA256=\"$SHA256\"/" scripts/_common.sh

# Update manifest.toml
sed -i '' "s/version = \"[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*~ynh[0-9][0-9]*\"/version = \"${VERSION}~ynh1\"/" manifest.toml
sed -i '' "s|url = \"https://github.com/sabnzbd/sabnzbd/releases/download/[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*/SABnzbd-[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*-src\.tar\.gz\"|url = \"https://github.com/sabnzbd/sabnzbd/releases/download/${VERSION}/SABnzbd-${VERSION}-src.tar.gz\"|" manifest.toml
sed -i '' "s/sha256 = \"[a-f0-9][a-f0-9]*\"/sha256 = \"${SHA256}\"/" manifest.toml

echo "✅ Successfully updated SABnzbd version to $VERSION"
echo "📝 Files updated:"
echo "   - scripts/_common.sh"
echo "   - manifest.toml"
echo ""
echo "🔍 You can verify the changes with:"
echo "   git diff"
