#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

DEVICE_CODENAME := grizzly
DEVICE_PATH := device/google/grizzly
VENDOR_PATH := vendor/google/grizzly
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)

PRODUCT_NAME := lineage_$(DEVICE_CODENAME)
PRODUCT_SYSTEM_BRAND := google
PRODUCT_SYSTEM_MANUFACTURER := Google
PRODUCT_SYSTEM_NAME := generic_system_google

TARGET_SCREEN_HEIGHT := 2410
TARGET_SCREEN_WIDTH := 1080

# Report the stock build these blobs come from; update it with the blobs.
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="grizzly-user 17 CD1A.261005.003 16262255 release-keys" \
    BuildFingerprint=google/grizzly/grizzly:17/CD1A.261005.003/16262255:user/release-keys \
    BuildSystemFingerprint=google/generic_system_google/generic:17/CD1A.261005.003/16262255:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

# Keys under vendor/lineage-priv map to release-keys; changing them re-signs every
# platform-signed app, so installing over existing data needs a wipe.
PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/lineage-priv/keys/releasekey

# The extracted blobs. This has to come after the inherits above, since it appends to
# PRODUCT_PACKAGES and PRODUCT_COPY_FILES.
$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
