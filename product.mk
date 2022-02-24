#
# Copyright (C) 2022 KudProject Development
#
# SPDX-License-Identifier: Apache-2.0
#

$(warning Inheriting vendor/extra for build.)

# Always assume build type is CI
DERP_BUILDTYPE := CI

# Include KudProject signing keys configuration
include vendor/kud/config/certs.mk

# Inherit GMS Go configuration for devices with <= 2 GB RAM variant
ifneq ($(filter %ulysse,$(TARGET_PRODUCT)),)
WITH_GMS_GO := true
$(call inherit-product, vendor/gms_go/products/gms_go.mk)
endif

# Include all packages from this project
PRODUCT_PACKAGES += \
    GrapheneCamera
