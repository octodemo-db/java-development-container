#!/usr/bin/env bash

set -e

export DEBIAN_FRONTEND=noninteractive
package_deb=/tmp/packages-microsoft-prod.deb

echo "Installing .NET Core..."

wget -q https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O $package_deb
dpkg -i $package_deb

apt-get update
apt-get install -y dotnet-sdk-3.1

rm -f $package_deb
echo "Done."