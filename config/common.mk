# Inherit from apex config
$(call inherit-product, vendor/prebuilts/config/apex.mk)

PRODUCT_PACKAGE_OVERLAYS += \
    vendor/prebuilts/overlay
