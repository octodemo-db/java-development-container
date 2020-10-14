#!/usr/bin/env bash

set -e

GCLOUD_VERSION="313.0.0"

wget -q https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUD_VERSION}-linux-x86_64.tar.gz -O /tmp/google-cloud-sdk.tar.gz
tar -xzf /tmp/google-cloud-sdk.tar.gz -C /usr/share

/usr/share/google-cloud-sdk/install.sh --quiet --rc-path /root/.bashrc --usage-reporting false --additional-components kubectl

rm -f /tmp/google-cloud-sdk.tar.gz