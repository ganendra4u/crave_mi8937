#!/bin/bash

rm -rf .repo/local_manifests/

repo init -u https://github.com/AviumUI/android_manifests -b avium-16.2 --git-lfs

git clone https://github.com/ganendra4u/local_manifest_mi8937.git .repo/local_manifests -b main

/opt/crave/resync.sh

export BUILD_USERNAME=ganx0000
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true

cat >> device/vendor_mi8937_4_19/mi8937_4_19/device.mk << 'EOF'
AVIUM_MAINTAINER := ganx0000
AVIUM_SETTINGS_SOC_MODEL_NAME := Snapdragon 430 Ultra
AVIUM_SETTINGS_DEVICE_CODENAME := MI8937
EOF

source build/envsetup.sh

lunch lineage_mi8937_4_19-bp4a-userdebug

m bacon
