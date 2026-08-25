#!/bin/bash

rm -rf .repo/local_manifests/

repo init -u https://github.com/AviumUI/android_manifests -b avium-16.2 --git-lfs --depth=1

mkdir -p .repo/local_manifests
curl -L -o .repo/local_manifests/lineage-23.2.xml https://raw.githubusercontent.com/Rve27/local_manifests/master/lineage-23.2.xml

repo sync

export BUILD_USERNAME=Ganendra1945
export BUILD_HOSTNAME=crave
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=true

cat >> device/xiaomi/Mi8937/lineage_Mi8937_4_19.mk << 'EOF'

AVIUM_MAINTAINER := Ganendra1945
AVIUM_SETTINGS_SOC_MODEL_NAME := MSM8937
AVIUM_SETTINGS_DEVICE_CODENAME := MI8937
EOF

source build/envsetup.sh

lunch lineage_Mi8937_4_19-bp4a-userdebug

m bacon
