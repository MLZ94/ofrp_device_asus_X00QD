#
# Copyright (C) 2016 The Android Open-Source Project
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

# Release name
PRODUCT_RELEASE_NAME := X00QD

$(call inherit-product, build/target/product/embedded.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/asus/X00QD/device.mk)

PRODUCT_DEVICE := X00QD
PRODUCT_NAME := omni_X00QD
PRODUCT_BRAND := asus
PRODUCT_MODEL := ASUS_X00QD
PRODUCT_MANUFACTURER := asus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=OPEN_Phone
    
PRODUCT_PROPERTY_OVERRIDES += \
    ro.treble.enabled=true \
    ro.hardware.keystore=sdm660 \
    ro.hardware.gatekeeper=sdm660 \
    ro.vendor.build.security_patch=2099-12-31 \
    ro.bootimage.build.date.utc=1514797200 \
    ro.build.date.utc=1514797200
