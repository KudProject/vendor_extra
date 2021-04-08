# Copyright (C) 2021 KudProject Development
# SPDX-License-Identifier: Apache-2.0

VENDOR_OS := $(shell bash -c 'echo $(TARGET_PRODUCT) | cut -d "_" -f1')

# Include targeted ROM overlays
DEVICE_PACKAGE_OVERLAYS += vendor/extra/overlay-$(VENDOR_OS)
