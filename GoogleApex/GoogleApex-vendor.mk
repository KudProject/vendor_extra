# Copyright (C) 2020 Raphielscape LLC. and Haruka LLC.
# Copyright (C) 2021 KudProject Development
# SPDX-License-Identifier: Apache-2.0

PRODUCT_COPY_FILES += \
    vendor/extra/GoogleApex/proprietary/product/etc/sysconfig/google-rollback-package-whitelist.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/google-rollback-package-whitelist.xml \
    vendor/extra/GoogleApex/proprietary/product/etc/sysconfig/google-staged-installer-whitelist.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/google-staged-installer-whitelist.xml

PRODUCT_PACKAGES += \
    ModuleMetadataGoogle \
    com.google.android.adbd \
    com.google.android.conscrypt \
    com.google.android.extservices \
    com.google.android.ipsec \
    com.google.android.media \
    com.google.android.media.swcodec \
    com.google.android.mediaprovider \
    com.google.android.neuralnetworks \
    com.google.android.os.statsd \
    com.google.android.permission \
    com.google.android.resolv \
    com.google.android.sdkext \
    com.google.android.telephony \
    com.google.android.tzdata2 \
    com.google.android.wifi
