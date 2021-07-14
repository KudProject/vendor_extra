# Copyright (C) 2021 KudProject Development
# SPDX-License-Identifier: Apache-2.0

VENDOR_PATH := vendor/extra

PRODUCT_SOONG_NAMESPACES += \
    $(VENDOR_PATH)/GoogleCarrier

# Overlay
PRODUCT_PACKAGES += \
    CarrierSettingsOverlay

# Inherit Google Carrier product configuration
include $(VENDOR_PATH)/GoogleCarrier/GoogleCarrier-vendor.mk
