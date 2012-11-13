# Copyright (C) 2011 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for maguro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and maguro, hence its name.
#

# GSM APN list
PRODUCT_COPY_FILES += \
    device/htc/vision/configs/apns-conf.xml:system/etc/apns-conf.xml

# GSM SPN overrides list
PRODUCT_COPY_FILES += \
    device/htc/vision/configs/spn-conf.xml:system/etc/spn-conf.xml

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from device
$(call inherit-product, device/htc/vision/device.mk)
$(call inherit-product, device/htc/vision/vision.mk)

# Bring in all audio files
include frameworks/base/data/sounds/AllAudio.mk

# Bring in all video files
$(call inherit-product, frameworks/base/data/videos/VideoPackage2.mk)

# BT config
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf

PRODUCT_RELEASE_NAME := VISION

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_vision BUILD_FINGERPRINT=htc_wwe/htc_vision/vision:4.1.1/JRO03C/87995:user/release-keys PRIVATE_BUILD_DESC="4.1.1 AOSP release-keys"

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_vision
PRODUCT_DEVICE := vision
PRODUCT_BRAND := HTC
PRODUCT_MODEL :=  HTC Vision
