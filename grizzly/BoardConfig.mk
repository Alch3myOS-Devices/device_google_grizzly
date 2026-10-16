#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#
# grizzly (Pixel 11 Pro); the shared family config is in device/google/malibu.

TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt
TARGET_BOOTLOADER_BOARD_NAME := grizzly
TARGET_SCREEN_DENSITY := 480

MALIBU_KERNEL_DIR := device/google/grizzly-kernels/6.12

include device/google/malibu/BoardConfig-common.mk

include $(VENDOR_PATH)/BoardConfigVendor.mk
