#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some Alch3myOS stuff
$(call inherit-product, vendor/alch3my/config/common_full_phone.mk)

# Alch3myOS flags
WITH_GMS := true
ALCH3MY_BUILD_TYPE := B3TA
IS_PIXEL := true
TARGET_HAS_UDFPS := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_DOES_NOT_SUPPORT_GOOGLE_BATTERY := false
# Face unlock is the stock face HAL with FaceEnroll (device/google/malibu);
# Alch3myOS's own face unlock would add a second one.
TARGET_FACE_UNLOCK_SUPPORTED := false

DEVICE_CODENAME := grizzly
DEVICE_PATH := device/google/grizzly
VENDOR_PATH := vendor/google/grizzly
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)

PRODUCT_NAME := alch3my_$(DEVICE_CODENAME)
PRODUCT_SYSTEM_BRAND := google
PRODUCT_SYSTEM_MANUFACTURER := Google
PRODUCT_SYSTEM_NAME := generic_system_google

TARGET_SCREEN_HEIGHT := 2856
TARGET_SCREEN_WIDTH := 1280

# Report the stock build these blobs come from; update it with the blobs.
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="grizzly-user 17 CD1A.261005.003 16262255 release-keys" \
    BuildFingerprint=google/grizzly/grizzly:17/CD1A.261005.003/16262255:user/release-keys \
    BuildSystemFingerprint=google/generic_system_google/generic:17/CD1A.261005.003/16262255:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

# The extracted blobs. This has to come after the inherits above, since it appends to
# PRODUCT_PACKAGES and PRODUCT_COPY_FILES.
$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
