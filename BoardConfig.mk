#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Default device path
DEVICE_PATH := device/$(PRODUCT_BRAND)/$(TARGET_DEVICE)

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a73

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a73

TARGET_BOARD_SUFFIX := _64
TARGET_SUPPORTS_64_BIT_APPS := true
TARGET_IS_64_BIT := true
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Assert
TARGET_OTA_ASSERT_DEVICE := ASUS_X00QD

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 55235884 # This is the maximum known partition size, but it can be higher, so we just omit it
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor

# Kernel
# BOARD_KERNEL_CMDLINE := \
# 	console=ttyMSM0,115200n8 \
# 	androidboot.console=ttyMSM0 \
# 	earlycon=msm_serial_dm,0xc170000 \
# 	androidboot.hardware=qcom \
# 	user_debug=31 \
# 	msm_rtb.filter=0x37 \
# 	ehci-hcd.park=3 \
# 	lpm_levels.sleep_disabled=1 \
# 	sched_enable_hmp=1 \
# 	sched_enable_power_aware=1 \
# 	service_locator.enable=1 \
# 	swiotlb=1 \
# 	firmware_class.path=/vendor/firmware_mnt/image \
# 	buildvariant=user
BOARD_KERNEL_CMDLINE := \
	console=ttyMSM0,115200n8 \
	androidboot.console=ttyMSM0 \
	earlycon=msm_serial_dm,0xc170000 \
	androidboot.hardware=qcom \
	user_debug=31 \
	msm_rtb.filter=0x37 \
	ehci-hcd.park=3 \
	service_locator.enable=1 \
	swiotlb=1 \
	loop.max_part=7 \
	buildvariant=userdebug
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/$(BOARD_KERNEL_IMAGE_NAME)
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
TARGET_KERNEL_ARCH := $(TARGET_ARCH)
TARGET_KERNEL_HEADER_ARCH := $(TARGET_ARCH)

# Platform
TARGET_BOARD_PLATFORM := sdm660
TARGET_BOARD_PLATFORM_GPU := qcom-adreno509
QCOM_BOARD_PLATFORMS += $(TARGET_BOARD_PLATFORM)

# Partitions
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3758096384
BOARD_USERDATAIMAGE_PARTITION_SIZE := 55940840960
BOARD_VENDORIMAGE_PARTITION_SIZE := 1073741824

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

BOARD_ROOT_EXTRA_FOLDERS := ADF \
                            APD \
                            asdf \
                            bt_firmware \
                            dsp \
                            factory \
                            firmware \
                            persist \
                            xrom

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# Ramdisk
LZMA_RAMDISK_TARGETS := recovery

# SELinux
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/private

# TWRP Configuration
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_INCLUDE_NTFS_3G := true
#TW_EXTRA_LANGUAGES := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TW_BRIGHTNESS_PATH := /sys/class/backlight/panel0-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_EXCLUDE_NANO := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_EXCLUDE_TWRPAPP := true

TW_OVERRIDE_SYSTEM_PROPS := \  "ro.build.date.utc;ro.build.flavor;ro.build.tags;ro.build.type;ro.build.user;ro.build.version.incremental=ro.system.build.version.incremental;ro.build.version.release=ro.system.build.version.release;ro.build.version.release_or_codename=ro.system.build.version.release;ro.bootimage.build.tags;ro.bootimage.build.type;ro.bootimage.build.fingerprint=ro.system.build.fingerprint;ro.bootimage.build.version.incremental=ro.system.build.version.incremental;ro.bootimage.build.version.release=ro.system.build.version.release;ro.bootimage.build.version.release_or_codename=ro.system.build.version.release;ro.product.build.fingerprint=ro.system.build.fingerprint;ro.product.build.version.incremental=ro.system.build.version.incremental;ro.product.build.version.release=ro.system.build.version.release;ro.product.build.version.release_or_codename=ro.system.build.version.release;ro.build.description=ro.system.build.fingerprint;ro.build.display.id=ro.system.build.fingerprint;ro.build.fingerprint=ro.system.build.fingerprint;ro.odm.build.tags;ro.odm.build.type;ro.odm.build.fingerprint=ro.system.build.fingerprint;ro.odm.build.version.incremental=ro.system.build.version.incremental;ro.odm.build.version.release=ro.system.build.version.release;ro.odm.build.version.release_or_codename=ro.system.build.version.release;ro.system.build.tags;ro.system.build.type;ro.system.build.fingerprint=ro.system.build.fingerprint;ro.system.build.version.incremental=ro.system.build.version.incremental;ro.system.build.version.release=ro.system.build.version.release;ro.system.build.version.release_or_codename=ro.system.build.version.release;ro.system_ext.build.tags;ro.system_ext.build.type;ro.system_ext.build.fingerprint=ro.system.build.fingerprint;ro.system_ext.build.version.incremental=ro.system.build.version.incremental;ro.system_ext.build.version.release=ro.system.build.version.release;ro.system_ext.build.version.release_or_codename=ro.system.build.version.release;ro.vendor.build.tags;ro.vendor.build.type;ro.vendor.build.fingerprint=ro.system.build.fingerprint;ro.vendor.build.version.incremental=ro.system.build.version.incremental;ro.vendor.build.version.release=ro.system.build.version.release;ro.vendor.build.version.release_or_codename=ro.system.build.version.release"

# TWRP_EVENT_LOGGING := true
TWRP_INCLUDE_LOGCAT := true
# TWRP Debug Flags
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true
TARGET_RECOVERY_DEVICE_MODULES += debuggerd
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd
TARGET_RECOVERY_DEVICE_MODULES += strace
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/strace
