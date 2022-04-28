#
# Copyright (C) 2022 KudProject Development
#
# SPDX-License-Identifier: Apache-2.0
#

$(warning Inheriting vendor/extra for build.)

# Include KudProject signing keys configuration
include vendor/kud/config/certs.mk

# Inherit GMS Go configuration for devices with <= 2 GB RAM variant
ifneq ($(filter %ulysse,$(TARGET_PRODUCT)),)
WITH_GMS_GO := true
$(call inherit-product, vendor/gms_go/products/gms_go.mk)
endif

# post_process_props.py on some sources are completely dumb that this is needed
ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PRODUCT_PROPERTIES += \
    ro.adb.secure=1 \
    persist.sys.usb.config=none
endif

# Include all packages from this project
PRODUCT_PACKAGES += \
    GrapheneCamera
