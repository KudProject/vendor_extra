# Copyright (C) 2021 KudProject Development
# SPDX-License-Identifier: Apache-2.0

VENDOR_OS := $(shell bash -c 'echo $(TARGET_PRODUCT) | cut -d "_" -f1')

# Inherit Google APEX configuration
ifeq ($(WITH_GAPPS),true)
ifeq ($(filter true,$(OVERRIDE_TARGET_FLATTEN_APEX) $(TARGET_FLATTEN_APEX)),)
ifeq ($(TARGET_FLATTEN_APEX),false)
$(warning Building with Google APEX modules)
$(call inherit-product-if-exists, vendor/prebuilts/config/apex.mk)
endif
endif
endif

# Include targeted ROM overlays
DEVICE_PACKAGE_OVERLAYS += vendor/extra/overlay-$(VENDOR_OS)

# Disable blur by default
ifeq ($(TARGET_SUPPORTS_BLUR),true)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.sf.disable_blurs=1
endif

# Include all packages in this project
PRODUCT_PACKAGES += \
    OpenCamera
