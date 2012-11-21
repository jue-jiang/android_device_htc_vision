#
# Copyright (C) 2011 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/vision/configs/gps.conf:system/etc/gps.conf

# ramdisk stuff
PRODUCT_COPY_FILES += \
    device/htc/vision/ramdisk/init.msm7x30.usb.rc:root/init.msm7x30.usb.rc \
    device/htc/vision/ramdisk/init.vision.rc:root/init.vision.rc \
    device/htc/vision/ramdisk/ueventd.vision.rc:root/ueventd.vision.rc \
    device/htc/vision/ramdisk/fstab.vision:root/fstab.vision

# the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

# Extra props
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dataroaming=false

DEVICE_PACKAGE_OVERLAYS += device/htc/vision/overlay

# gsm config xml file
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

PRODUCT_COPY_FILES += \
    device/htc/vision/configs/voicemail-conf.xml:system/etc/voicemail-conf.xml

# Device specific firmware
PRODUCT_COPY_FILES += \
    device/htc/vision/firmware/bcm4329.hcd:system/vendor/firmware/bcm4329.hcd \
    device/htc/vision/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/vision/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/vision/firmware/default_org_WA.acdb:system/etc/firmware/default_org_WA.acdb \
    device/htc/vision/firmware/vidc_720p_mp2_dec_mc.fw:system/etc/firmware/vidc_720p_mp2_dec_mc.fw \
    device/htc/vision/firmware/Vision_SPK.acdb:system/etc/firmware/Vision_SPK.acdb 

# Alternate NAM gps.conf to NAM package
PRODUCT_COPY_FILES += device/common/gps/gps.conf_US:system/etc/nam/gps.conf

# Copy bcm4329 firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

PRODUCT_COPY_FILES += \
    device/htc/vision/configs/vold.fstab:system/etc/vold.fstab

# BT main.conf
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf

# Prebuilts
PRODUCT_COPY_FILES += \
    device/htc/vision/prebuilt/zImage:kernel \
    device/htc/vision/prebuilt/bcmdhd.ko:system/lib/modules/bcmdhd.ko \
    device/htc/vision/prebuilt/sysinit:system/bin/sysinit

# Sensors, GPS, Lights
PRODUCT_PACKAGES += gps.vision lights.vision sensors.vision

# Optional packages
PRODUCT_PACKAGES += Development SoundRecorder SpareParts Stk su

# CM packages
PRODUCT_PACKAGES += Apollo CMFileManager Superuser

# Publish that we support the live wallpaper feature
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

# common msm7x30 configs
$(call inherit-product, device/htc/vision/msm7x30.mk)

# input configs
$(call inherit-product, device/htc/vision/input.mk)

# Audio settings
$(call inherit-product, device/htc/vision/media_htcaudio.mk)
$(call inherit-product, device/htc/vision/media_a1026.mk)

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# Non-open source blobs (Camera, Adreno etc)
$(call inherit-product, device/htc/vision/vision-vendor-blobs.mk)
