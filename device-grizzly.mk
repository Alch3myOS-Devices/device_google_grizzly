#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#
# grizzly (Pixel 11 Pro); the shared family config is in device/google/malibu.

# Prebuilt; the Image is the family build, vendor_dlkm and dtbo are grizzly's own.
TARGET_LINUX_KERNEL_VERSION := 6.12
TARGET_KERNEL_DEVICE := grizzly
TARGET_KERNEL_DIR := device/google/$(TARGET_KERNEL_DEVICE)-kernels/$(TARGET_LINUX_KERNEL_VERSION)

# Recovered from the stock overlays the blob list drops; priorities are stock's own,
# vendor 0 and product 1.
PRODUCT_PACKAGES += \
    FrameworkResOverlayVendorGrizzly \
    FrameworkResOverlayProductGrizzly \
    SystemUIGoogleOverlayVendorGrizzly \
    SystemUIGoogleOverlayProductGrizzly \
    SettingsGoogleOverlayVendorGrizzly \
    SettingsGoogleOverlayProductGrizzly \
    TeleServiceOverlayVendorGrizzly \
    TeleServiceOverlayProductGrizzly \
    SettingsProviderOverlayVendorGrizzly \
    SettingsProviderOverlayProductGrizzly \
    FrameworkResOverlayLineageGrizzly \
    LineageSdkOverlayGrizzly \
    SettingsOverlayLineageGrizzly

# Alch3myOS About phone
PRODUCT_PACKAGES += \
    Alch3mySettingsGrizzly

PRODUCT_PRODUCT_PROPERTIES += \
    ro.alch3my.maintainer=Pyrtle93 \
    ro.alch3my.maintainer.url=https://t.me/PyrtlesPixels

# config_face_enroll points Settings here; the HAL draws the preview itself.
PRODUCT_PACKAGES += \
    FaceEnroll

# The three vendor.*.modules/devices.ready properties gate the init blocks incl. the
# vibrator HAL; without them system_server waits on IVibratorManager forever.
PRODUCT_COPY_FILES += \
    device/google/grizzly/init.insmod.grizzly.cfg:$(TARGET_COPY_OUT_VENDOR_DLKM)/etc/init.insmod.grizzly.cfg

# The qfp extension interface only the fingerprint daemon registers.
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/vintf/qfp_framework_matrix_system_ext.xml

# Vendor properties recovered from stock. Without ro.hardware.egl there is no display.
include device/google/grizzly/vendor_props.mk
