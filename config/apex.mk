#
# Copyright (C) 2020 Raphielscape LLC. and Haruka LLC.
# Copyright (C) 2021 KudProject Development
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

VENDOR_PATH := vendor/extra

# Enable Google Play system updates support
PRODUCT_SOONG_NAMESPACES += \
    $(VENDOR_PATH)/GoogleApex

# Overlay
PRODUCT_PACKAGES += \
    ApexOverlay

# Sepolicy
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(VENDOR_PATH)/GoogleApex/sepolicy/private

# Inherit Google Apex product configuration
include $(VENDOR_PATH)/GoogleApex/GoogleApex-vendor.mk
