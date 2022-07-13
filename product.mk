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

ifeq ($(TARGET_PRODUCT)-$(DERP_BUILDTYPE)-$(DERP_RELEASE),derp_alioth-SnuggyWuggy-true)
OVERRIDE_OTA_CHANNEL := https://prod-ota.kudnet.id/derpfest/12/alioth.json
PRODUCT_SYSTEM_PROPERTIES += \
    derp.updater.uri?=$(OVERRIDE_OTA_CHANNEL)
endif

# Include all packages from this project
PRODUCT_PACKAGES += \
    GrapheneCamera
