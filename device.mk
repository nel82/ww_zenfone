#
# Copyright 2014 The Android Open-Source Project
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
ifeq ($(USE_KERNEL_INLINE), true)
 ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/asus/a400cg-kernel/kernel
 else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
 endif

PRODUCT_COPY_FILES := \
	$(LOCAL_KERNEL):kernel
endif # USE_KERNEL_INLINE

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# cm overlay
DEVICE_PACKAGE_OVERLAYS += device/asus/a400cg/overlay

PRODUCT_CHARACTERISTICS := default

# Wifi
PRODUCT_PACKAGES += \
  libwpa_client \
  hostapd \
  dhcpcd.conf \
  wpa_supplicant \
  wpa_supplicant.conf

# Key layout files
PRODUCT_COPY_FILES += \
    device/asus/a400cg/keylayout/ASUS_TransKeyboard.kl:system/usr/keylayout/ASUS_TransKeyboard.kl \
    device/asus/a400cg/keylayout/himax-touchscreen.kcm:system/usr/keychars/himax-touchscreen.kcm \
    device/asus/a400cg/keylayout/himax-touchscreen.kl:system/usr/keylayout/himax-touchscreen.kl \
    device/asus/a400cg/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/asus/a400cg/keylayout/cloverview_audio_Intel_MID_Audio_Jack.kl:system/usr/keylayout/cloverview_audio_Intel_MID_Audio_Jack.kl \
    device/asus/a400cg/keylayout/Vendor_0b05_Product_17fc.kl:system/usr/keylayout/Vendor_0b05_Product_17fc.kl \
    device/asus/a400cg/keylayout/Vendor_0b05_Product_1803.kl:system/usr/keylayout/Vendor_0b05_Product_1803.kl \
    device/asus/a400cg/keylayout/Vendor_0b05_Product_4500.kl:system/usr/keylayout/Vendor_0b05_Product_4500.kl

#bluetooth
PRODUCT_COPY_FILES += \
        device/asus/a400cg/configs/bt_redhookbay_ttyMFD0.conf:system/etc/bluetooth/bt_redhookbay_ttyMFD0.conf \
        device/asus/a400cg/configs/bt_redhookbay_ttyMFD3.conf:system/etc/bluetooth/bt_redhookbay_ttyMFD3.conf

# media
PRODUCT_COPY_FILES += \
    device/asus/a400cg/configs/media_profiles.xml:system/etc/media_profiles.xml \
    device/asus/a400cg/configs/wrs_omxil_components.list:system/etc/wrs_omxil_components.list \
    device/asus/a400cg/configs/media_codecs.xml:system/etc/media_codecs.xml

PRODUCT_COPY_FILES += \
     frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
     frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
     frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml

# video decoder encoder
PRODUCT_PACKAGES += \
    libwrs_omxil_common \
    libwrs_omxil_core_pvwrapped \
    libOMXVideoDecoderAVC \
    libOMXVideoDecoderH263 \
    libOMXVideoDecoderMPEG4 \
    libOMXVideoDecoderWMV \
    libOMXVideoEncoderAVC \
    libOMXVideoEncoderH263 \
    libOMXVideoEncoderMPEG4

# specific audio
PRODUCT_COPY_FILES += \
    device/asus/a400cg/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/asus/a400cg/audio/asound.conf:system/etc/asound.conf \
    device/asus/a400cg/audio/asound-vv.conf:system/etc/asound-vv.conf \
    device/asus/a400cg/audio/audio_volume_curve.conf:system/etc/audio_volume_curve.conf \
    device/asus/a400cg/audio/icesoundpresets.def:system/etc/icesoundpresets.def \
    device/asus/a400cg/audio/route_criteria.conf:system/etc/route_criteria.conf

# init
PRODUCT_PACKAGES += \
	fstab \
	fstab.charger.redhookbay \
	fstab.ramconsole.redhookbay \
	fstab.redhookbay \
	fstab.zram \
	init.avc.rc \
	init.bt.rc \
	init.bt.vendor.rc \
	init.camera_cali.rc \
	init.common.rc \
	init.debug.rc \
	init.diag.rc \
	init.firmware.rc \
	init.gps.rc \
	init.logtool.rc \
	init.modem.rc \
	init.platform.usb.rc \
	init.project.rc \
	init.recovery.redhookbay.rc \
	init.redhookbay.rc \
	init.watchdog.rc \
	init.wifi.rc \
	init.wifi.vendor.rc \
	init.wireless.rc \
	init.zram.rc \
	intel_prop.cfg \
	rfkill_bt.sh \
	ueventd.project.rc \
	ueventd.redhookbay.rc \
	intel_prop \
	thermald \
	pclinkd

# Only copy init.rc if the target doesn't have its own.
PRODUCT_COPY_FILES += \
	device/asus/a400cg/rootdir/etc/init.rc:root/init.rc

PRODUCT_COPY_FILES += \
	system/core/rootdir/init.rc:root/init.extra.rc

PRODUCT_COPY_FILES += \
	device/asus/a400cg/rootdir/sbin/intel_prop:recovery/root/sbin/intel_prop \
	device/asus/a400cg/rootdir/sbin/pclinkd:recovery/root/sbin/pclinkd \
	device/asus/a400cg/rootdir/sbin/thermald:recovery/root/sbin/thermald

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Wifi
PRODUCT_COPY_FILES += \
        device/asus/a400cg/wifi/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
        device/asus/a400cg/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \
        device/asus/a400cg/wifi/TQS.ini:system/etc/wifi/TQS.ini

PRODUCT_PACKAGES += \
	wpa_supplicant_overlay.conf \
	p2p_supplicant.conf
	
# GPS
PRODUCT_COPY_FILES += \
        device/asus/a400cg/gps/gpsconfig_debug.xml:system/etc/gpsconfig_debug.xml \
        device/asus/a400cg/gps/gpsconfig_user.xml:system/etc/gpsconfig_user.xml \
        device/asus/a400cg/gps/libgps.conf:system/etc/libgps.conf \
        device/asus/a400cg/gps/gps.conf:system/etc/gps.conf \
        device/asus/a400cg/gps/gpsd_mgr.sh:system/etc/gpsd_mgr.sh

PRODUCT_COPY_FILES += \
        device/asus/a400cg/gps/get-gps-lto:system/bin/get-gps-lto \
        device/asus/a400cg/gps/gpsd:system/bin/gpsd \
        device/asus/a400cg/gps/gpslogd:system/bin/gpslogd

#atproxy_usbreset
PRODUCT_COPY_FILES += \
        device/asus/a400cg/atproxy_usbreset:system/bin/atproxy_usbreset

#configure trace modem
PRODUCT_COPY_FILES += \
               device/asus/a400cg/activate_trace_modem:system/bin/activate_trace_modem \
               device/asus/a400cg/configure_trace_modem:system/bin/configure_trace_modem

#logtoold##############################################################################################
PRODUCT_COPY_FILES += \
    device/asus/a400cg/logtoold/asus_mts:system/bin/asus_mts \
    device/asus/a400cg/logtoold/klogdog:system/bin/klogdog \
    device/asus/a400cg/logtoold/logdog:system/bin/logdog \
    device/asus/a400cg/logtoold/logt_bootup:system/bin/logt_bootup \
    device/asus/a400cg/logtoold/logt_bootup_cos:system/bin/logt_bootup_cos \
    device/asus/a400cg/logtoold/logt_bootup_mos:system/bin/logt_bootup_mos \
    device/asus/a400cg/logtoold/logt_cosklogdog:system/bin/logt_cosklogdog \
    device/asus/a400cg/logtoold/logt_coslogdog:system/bin/logt_coslogdog \
    device/asus/a400cg/logtoold/logt_onechance:system/bin/logt_onechance \
    device/asus/a400cg/logtoold/start_modem_setting:system/bin/start_modem_setting \
    device/asus/a400cg/logtoold/stop_modem_setting:system/bin/stop_modem_setting \
    device/asus/a400cg/logtoold/proxy:system/bin/proxy \
    device/asus/a400cg/logtoold/uts_bootup:system/bin/uts_bootup

PRODUCT_COPY_FILES += \
    device/asus/a400cg/logtoold/EmptyActivity.obj:system/bin/EmptyActivity.obj \
    device/asus/a400cg/logtoold/monkey_test:system/bin/monkey_test \
    device/asus/a400cg/logtoold/profiling:system/bin/profiling

PRODUCT_COPY_FILES += \
    device/asus/a400cg/logtoold/scripts/monkey/EmptyActivity.obj:system/scripts/monkey/EmptyActivity.obj \
    device/asus/a400cg/logtoold/scripts/monkey/monkey_test_a:system/scripts/monkey/monkey_test_a \
    device/asus/a400cg/logtoold/scripts/monkey/monkey_test_p:system/scripts/monkey/monkey_test_p \
    device/asus/a400cg/logtoold/scripts/monkey/package_list.txt:system/scripts/monkey/package_list.txt \
    device/asus/a400cg/logtoold/scripts/monkey/profiling:system/scripts/monkey/profiling \
    device/asus/a400cg/logtoold/scripts/monkey/script2log:system/scripts/monkey/script2log \
    device/asus/a400cg/logtoold/scripts/monkey/TestIME.obj:system/scripts/monkey/TestIME.obj \
    device/asus/a400cg/logtoold/scripts/monkey/timer:system/scripts/monkey/timer

PRODUCT_COPY_FILES += \
    device/asus/a400cg/logtoold/logdog-events.conf:system/etc/logdog-events.conf \
    device/asus/a400cg/logtoold/logdog-main.conf:system/etc/logdog-main.conf \
    device/asus/a400cg/logtoold/logdog-radio.conf:system/etc/logdog-radio.conf \
    device/asus/a400cg/logtoold/logdog-system.conf:system/etc/logdog-system.conf \
    device/asus/a400cg/logtoold/pnpDump.sh:system/etc/pnpDump.sh \
    device/asus/a400cg/logtoold/pwr-balance.sh:system/etc/pwr-balance.sh \
    device/asus/a400cg/logtoold/pwr-normal.sh:system/etc/pwr-normal.sh \
    device/asus/a400cg/logtoold/tcpDump.sh:system/etc/tcpDump.sh

##########################################################
# permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.gamepad.xml:system/etc/permissions/android.hardware.gamepad.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.ambient_temperature.xml:system/etc/permissions/android.hardware.sensor.ambient_temperature.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.webview.xml:system/etc/permissions/android.software.webview.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml

# Prebuilt busybox
PRODUCT_PACKAGES += \
    busybox_binary

# Tinyalsa
PRODUCT_PACKAGES += \
    tinyplay \
    tinycap \
    tinymix

# Audio
PRODUCT_PACKAGES += \
    libtinycompress \
    libtinyalsa \
    audio.a2dp.default \
    audio.primary.default \
    audio.r_submix.default \
    audio.usb.default \
    libaudioutils

# libmix
PRODUCT_PACKAGES += \
    libmixvbp \
    libmixvbp_h264 \
    libmixvbp_h264secure \
    libmixvbp_mpeg4 \
    libmixvbp_vc1

PRODUCT_PACKAGES += \
    msvdx_bin \
    topaz_bin

PRODUCT_PACKAGES += \
    libmix_imagedecoder \
    libmix_imageencoder

# psb video
PRODUCT_PACKAGES += \
    pvr_drv_video

# stagefright
PRODUCT_PACKAGES += \
    libstagefrighthw

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    tune2fs \
    resize2fs \
    make_ext4fs \
    setup_fs

# library 
PRODUCT_PACKAGES += \
    libtinyxml \
    minizip \
    openssl \
    pack_intel \
    unpack_intel

PRODUCT_PACKAGES += \
    lights.redhookbay \
    power.redhookbay \
    libwsbm

# libdrm
PRODUCT_PACKAGES += \
    libdrm


# libI420colorconvert
PRODUCT_PACKAGES += \
	libI420colorconvert

# Intel multiple display
PRODUCT_PACKAGES += \
    libmultidisplay \
    libmultidisplayjni \
    com.intel.multidisplay \
    com.intel.multidisplay.xml

# IntelCamera Parameters extensions
PRODUCT_PACKAGES += \
    libintelcamera_jni \
    com.intel.camera.extensions \
    com.intel.camera.extensions.xml

#feature_config
PRODUCT_PACKAGES += \
	com.intel.config

# Keyhandler
PRODUCT_PACKAGES += \
    com.cyanogenmod.keyhandler

#doze
PRODUCT_PACKAGES += \
    XDoze

PRODUCT_PACKAGES += \
    Stk

# AOSP and contains Intel optimizations to the compiler.
PRODUCT_PACKAGES += libart-extension

# set USB OTG enabled to add support for USB storage type
PRODUCT_PROPERTY_OVERRIDES += persist.sys.isUsbOtgEnabled=true

# Set the prop to enable arm native bridge
ADDITIONAL_DEFAULT_PROPERTIES += ro.dalvik.vm.native.bridge=libhoudini.so

# usb
PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp

#enable Widevine drm
PRODUCT_PROPERTY_OVERRIDES += drm.service.enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
	rild.libpath=/system/lib/librapid-ril-core.so \
	ro.streaming.video.drs=true \
	keyguard.no_require_sim=true \
	ro.com.android.dataroaming=true \
	ro.telephony.default_network=9 \
	ro.telephony.ril_class=AsusRIL

PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0 \
    persist.tel.lteOnGsmDevice=false \
    persist.radio.multisim.config=dsds \
    persist.tel.hot_swap.support=true

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.ril-daemon.disable=0 \
	persist.radio.ril_modem_state=1

#dalvik
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	dalvik.vm.dex2oat-Xms=64m \
	dalvik.vm.dex2oat-Xmx=512m \
	dalvik.vm.image-dex2oat-Xms=64m \
	dalvik.vm.image-dex2oat-Xmx=64m

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.zygote=zygote32

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    ro.opengles.version=131072

PRODUCT_TAGS += dalvik.gc.type-precise

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.debuggable=1 \
    ro.allow.mock.location=1 \
    persist.sys.usb.config=mtp \
    ro.secure=0 \
    ro.adb.secure=0

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.config.low_ram=false \
    ro.ril.status.polling.enable=0 \
    ro.product.cpu.abi2=armeabi-v7a \
    ro.config.personality=compat_layout

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.sf.lcd_density=240 \
    ro.opengles.version=131072 \
    gsm.net.interface=rmnet0 \
    persist.system.at-proxy.mode=0 \
    ro.dalvik.vm.native.bridge=libhoudini.so \
    dalvik.vm.dex2oat-Xms=64m \
    dalvik.vm.dex2oat-Xmx=512m \
    dalvik.vm.image-dex2oat-Xms=64m \
    dalvik.vm.image-dex2oat-Xmx=64m

PRODUCT_PROPERTY_OVERRIDES += \
    ro.dalvik.vm.isa.arm=x86 \
    ro.enable.native.bridge.exec=1

# bt
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.gnss.sv.status=true \
	ro.bluetooth.le=2 \
	bt.version.driver=V21.23.45.2.0 \
	ro.bt.uart=ttyMFD0

#gps
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	gps.version.driver=6.19.6.216527 \
	persist.gps.ignore_rom_alm=0 \
	ril.agpschannel=/dev/gsmtty7 \
	persist.gps.psm=enabled \
	persist.gps.testmode=disabled \
	gsm.net.interface=rmnet0

PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true \
    ro.blankphone_id=1 \
    ro.contact.simtype=1 \
    ro.camera.sound.forced=0

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapminfree=4m

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_size=20.0f \
    ro.hwui.texture_cache_flushrate=0.75f \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=256 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=256

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.dalvik.vm.lib.2=libart.so \
    ro.ril.status.polling.enable=0 \
    rs.gpu.renderscript=0 \
    rs.gpu.filterscript=0 \
    rs.gpu.rsIntrinsic=0

PRODUCT_PROPERTY_OVERRIDES += \
    persist.telproviders.debug=0 \
    ro.ime.lowmemory=false

# Add WiFi Firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4335/device-bcm.mk)

$(call inherit-product-if-exists, vendor/asus/a400cg/device-vendor.mk)
$(call inherit-product-if-exists, vendor/intel/houdini/houdini.mk)
