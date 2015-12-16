# Copyright (C) 2010 The Android Open Source Project
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


# This file is the device-specific product definition file for
# crespo. It lists all the overlays, files, modules and properties
# that are specific to this hardware: i.e. those are device-specific
# drivers, configuration files, settings, etc...

# Note that crespo is not a fully open device. Some of the drivers
# aren't publicly available in all circumstances, which means that some
# of the hardware capabilities aren't present in builds where those
# drivers aren't available. Such cases are handled by having this file
# separated into two halves: this half here contains the parts that
# are available to everyone, while another half in the vendor/ hierarchy
# augments that set with the parts that are only relevant when all the
# associated drivers are available. Aspects that are irrelevant but
# harmless in no-driver builds should be kept here for simplicity and
# transparency. There are two variants of the half that deals with
# the unavailable drivers: one is directly checked into the unreleased
# vendor tree and is used by engineers who have access to it. The other
# is generated by setup-makefile.sh in the same directory as this files,
# and is used by people who have access to binary versions of the drivers
# but not to the original vendor tree. Be sure to update both.


# These is the hardware-specific overlay, which points to the location
# of hardware-specific resource overrides, typically the frameworks and
# application settings that are stored in resourced.
DEVICE_PACKAGE_OVERLAYS := device/samsung/aries-common/overlay

# Init files
PRODUCT_COPY_FILES += \
    device/samsung/aries-common/init.aries.rc:root/init.aries.rc \
    device/samsung/aries-common/init.trace.rc:root/init.trace.rc \
    device/samsung/aries-common/init.aries.gps.rc:root/init.aries.gps.rc \
    device/samsung/aries-common/init.aries.usb.rc:root/init.aries.usb.rc \
    device/samsung/aries-common/init.recovery.aries.rc:root/init.recovery.aries.rc \
    device/samsung/aries-common/init.aries.usb.rc:recovery/root/usb.rc \
    device/samsung/aries-common/fstab.aries:root/fstab.aries \
    device/samsung/aries-common/ueventd.aries.rc:root/ueventd.aries.rc \
    device/samsung/aries-common/setupdatadata.sh:root/sbin/setupdatadata.sh \
    device/samsung/aries-common/umountdatadata.sh:root/sbin/umountdatadata.sh \
    device/samsung/aries-common/bml_over_mtd.sh:bml_over_mtd.sh \
    device/samsung/aries-common/updater.sh:updater.sh \
    device/samsung/aries-common/twrp.fstab:recovery/root/etc/twrp.fstab

# Prebuilt kl and kcm keymaps
PRODUCT_COPY_FILES += \
    device/samsung/aries-common/cypress-touchkey.kl:system/usr/keylayout/cypress-touchkey.kl \
    device/samsung/aries-common/cypress-touchkey.kcm:system/usr/keychars/cypress-touchkey.kcm \
    device/samsung/aries-common/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/aries-common/sec_jack.kcm:system/usr/keychars/sec_jack.kcm \
    device/samsung/aries-common/s3c-keypad.kl:system/usr/keylayout/s3c-keypad.kl \
    device/samsung/aries-common/s3c-keypad.kcm:system/usr/keychars/s3c-keypad.kcm

# Input device calibration files
PRODUCT_COPY_FILES += \
    device/samsung/aries-common/mxt224_ts_input.idc:system/usr/idc/mxt224_ts_input.idc

# Filesystem management tools
PRODUCT_PACKAGES += \
    setup_fs \
    bml_over_mtd

# Usb accessory
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# These are the OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
    hardware/samsung/exynos3/s5pc110/sec_mm/sec_omx/sec_omx_core/secomxregistry:system/etc/secomxregistry \
    device/samsung/aries-common/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/aries-common/media_codecs.xml:system/etc/media_codecs.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml

# These are the OpenMAX IL modules
PRODUCT_PACKAGES += \
    libSEC_OMX_Core \
    libOMX.SEC.AVC.Decoder \
    libOMX.SEC.M4V.Decoder \
    libOMX.SEC.M4V.Encoder \
    libOMX.SEC.AVC.Encoder

# Misc other modules
PRODUCT_PACKAGES += \
    lights.aries \
    sensors.aries \
    power.s5pc110 \
    hwcomposer.s5pc110 \
    camera.aries \
    audio.primary.aries \
    audio.a2dp.default \
    audio.usb.default \
    libs3cjpeg

# Wi-Fi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    hostapd_default.conf \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

# PVR
PRODUCT_PACKAGES += \
    pvrsrvinit

PRODUCT_COPY_FILES += \
    device/samsung/aries-common/libaudio/audio_policy.conf:system/etc/audio_policy.conf \
    device/samsung/aries-common/libaudio/audio_effects.conf:system/vendor/etc/audio_effects.conf

# Libs
PRODUCT_PACKAGES += \
    libstagefrighthw

# Bluetooth MAC Address
PRODUCT_PACKAGES += \
    bdaddr_read

# Device-specific packages
PRODUCT_PACKAGES += \
    SamsungServiceMode \
    DeviceSettings

# Libnetcmd
PRODUCT_PACKAGES += \
    libnetcmdiface

# f2fs
PRODUCT_PACKAGES += \
    fsck.f2fs \
    mkfs.f2fs \
    fibmap.f2fs

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES := \
    ro.opengles.version=131072 \
    debug.hwui.render_dirty_regions=false \
    ro.zygote.disable_gl_preload=true

# Support for Browser's saved page feature. This allows
# for pages saved on previous versions of the OS to be
# viewed on the current OS.
PRODUCT_PACKAGES += \
    libskia_legacy

# These are the hardware-specific settings that are stored in system properties.
# Note that the only such settings should be the ones that are too low-level to
# be reachable from resources or other mechanisms.
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.media.legacy-drm=1 \
    wifi.interface=wlan0 \
    ro.telephony.ril_class=SamsungExynos3RIL \
    ro.telephony.ril.config=icccardstatus,datacall,signalstrength,facilitylock \
    mobiledata.interfaces=pdp0,eth0,gprs,ppp0,rmnet \
    ro.bq.gpu_to_cpu_unsupported=1 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.adb.qemud=1 \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.emc.mode=2 \
    ro.phone_storage=1 \
    ro.additionalmounts=/storage/sdcard1 \
    ro.config.low_ram=true \
    ro.sys.fw.bg_apps_limit=16 \
    ro.config.max_starting_bg=10 \
    ro.ksm.default=1

# ART
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-flags=--no-watch-dog \
    dalvik.vm.dex2oat-filter=balanced \
    dalvik.vm.image-dex2oat-filter=speed

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1 \
    camera2.port.operation_time_ms=5000

# SGX540 is slower with the scissor optimization enabled
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.disable_scissor_opt=true

# Enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# We have sacrificed /cache for a larger /system, so it's not large enough for dalvik cache
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-data-only=1

# SELinux
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly,
# but they can spot a variety of nasty bugs
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    dalvik.vm.checkjni=false

# ART
PRODUCT_DEX_PREOPT_DEFAULT_FLAGS := \
    --compiler-filter=balanced

include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

$(call add-product-dex-preopt-module-config,services,--compiler-filter=speed)

$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)
