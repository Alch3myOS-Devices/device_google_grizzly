#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_CODENAME := grizzly
DEVICE_PATH := device/google/grizzly
VENDOR_PATH := vendor/google/grizzly

$(call inherit-product, device/google/malibu/aosp_common.mk)
$(call inherit-product, $(DEVICE_PATH)/device-grizzly.mk)

PRODUCT_NAME := aosp_grizzly
PRODUCT_DEVICE := grizzly
PRODUCT_MODEL := Pixel 11 Pro
PRODUCT_BRAND := google
PRODUCT_MANUFACTURER := Google

PRODUCT_NAME_FOR_ATTESTATION := grizzly
PRODUCT_DEVICE_FOR_ATTESTATION := grizzly
PRODUCT_MODEL_FOR_ATTESTATION := Pixel 11 Pro
PRODUCT_BRAND_FOR_ATTESTATION := google
PRODUCT_MANUFACTURER_FOR_ATTESTATION := Google
