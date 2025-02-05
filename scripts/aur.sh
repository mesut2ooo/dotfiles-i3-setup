#!/bin/bash

# Create a temporary directory for AUR updates
TEMP_DIR=$(mktemp -d)
echo "Created temporary directory: $TEMP_DIR"

# Get a list of installed AUR packages
echo "Getting a list of installed AUR packages..."
AUR_PACKAGES=$(pacman -Qm | awk '{print $1}')

if [ -z "$AUR_PACKAGES" ]; then
  echo "No AUR packages installed on this system."
  exit 0
fi

# Iterate through each AUR package and check for updates
for PACKAGE in $AUR_PACKAGES; do
  echo "Checking for updates for $PACKAGE..."

  # Clone the AUR repository for the package
  AUR_URL="https://aur.archlinux.org/$PACKAGE.git"
  PACKAGE_DIR="$TEMP_DIR/$PACKAGE"
  
  git clone -q $AUR_URL "$PACKAGE_DIR" || { 
    echo "Failed to clone repository for $PACKAGE. Skipping..."; 
    continue; 
  }

  cd "$PACKAGE_DIR" || continue

  # Check if PKGBUILD exists
  if [ ! -f PKGBUILD ]; then
    echo "PKGBUILD not found for $PACKAGE. Skipping..."
    cd "$TEMP_DIR"
    rm -rf "$PACKAGE_DIR"
    continue
  fi

  # Get the installed and AUR versions
  LOCAL_VER=$(pacman -Q "$PACKAGE" 2>/dev/null | awk '{print $2}')
  PKGVER=$(grep -m1 "^pkgver=" PKGBUILD | cut -d= -f2)
  PKGREL=$(grep -m1 "^pkgrel=" PKGBUILD | cut -d= -f2)
  AUR_VER="${PKGVER}-${PKGREL}"

  # Compare versions
  if [ "$LOCAL_VER" != "$AUR_VER" ]; then
    echo "Update available for $PACKAGE: $LOCAL_VER -> $AUR_VER"
    echo "Building and installing $PACKAGE..."
    makepkg -si --noconfirm || { echo "Failed to build/install $PACKAGE. Skipping..."; }
  else
    echo "$PACKAGE is already up to date."
  fi

  # Clean up the package directory
  cd "$TEMP_DIR"
  rm -rf "$PACKAGE_DIR"
done

# Clean up the temporary directory
rm -rf "$TEMP_DIR"
echo "All done! Temporary directory cleaned up."

