# Copyright (C) 2021 KudProject Development
# SPDX-License-Identifier: Apache-2.0

VENDOR_OS := $(shell bash -c 'echo $(TARGET_PRODUCT) | cut -d "_" -f1')

# Speed profile services and wifi-service to reduce RAM and storage
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile

# Always preopt extracted APKs to prevent extracting out of the APK for gms modules
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true

# Use a profile based boot image for this device
PRODUCT_USE_PROFILE_FOR_BOOT_IMAGE := true
PRODUCT_DEX_PREOPT_BOOT_IMAGE_PROFILE_LOCATION := frameworks/base/config/boot-image-profile.txt

# Inherit Google APEX configuration
ifeq ($(WITH_GAPPS),true)
ifeq ($(filter true,$(OVERRIDE_TARGET_FLATTEN_APEX) $(TARGET_FLATTEN_APEX)),)
ifeq ($(TARGET_FLATTEN_APEX),false)
$(warning Building with Google APEX modules)
$(call inherit-product-if-exists, vendor/prebuilts/config/apex.mk)
endif
endif
endif

# Disable blur by default
ifeq ($(TARGET_SUPPORTS_BLUR),true)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.sf.disable_blurs=1
endif

# Include all packages in this project
PRODUCT_PACKAGES += \
    OpenCamera \
    TrichromeChrome \
    TrichromeWebView

ifeq ($(VENDOR_OS),dot)
PRODUCT_PACKAGES += \
    DotSystemUpdatesOverlay
endif
