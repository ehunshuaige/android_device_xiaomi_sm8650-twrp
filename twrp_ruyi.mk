#
# Copyright (C) 2025 The TWRP Open Source Project
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

DEVICE_PATH := device/xiaomi/sm8650

# Inherit from device.mk configuration
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# ==================== Copy firmware and config files (non-ELF) ====================
PRODUCT_COPY_FILES += \
    device/xiaomi/sm8650/prebuilts/ruyi/firmware/goodix_cfg_group_ruyi.bin:recovery/root/vendor/firmware/goodix_cfg_group_ruyi.bin \
    device/xiaomi/sm8650/prebuilts/ruyi/firmware/goodix_firmware_ruyi.bin:recovery/root/vendor/firmware/goodix_firmware_ruyi.bin \
    device/xiaomi/sm8650/prebuilts/ruyi/firmware/goodix_test_limits_0.csv:recovery/root/vendor/firmware/goodix_test_limits_0.csv \
    device/xiaomi/sm8650/prebuilts/ruyi/firmware/ruyi_test_limits_S3910P.csv:recovery/root/vendor/firmware/ruyi_test_limits_S3910P.csv \
    device/xiaomi/sm8650/prebuilts/ruyi/firmware/synaptics_spi_ruyi.img:recovery/root/vendor/firmware/synaptics_spi_ruyi.img

# ==================== Prebuilt kernel modules (ELF) ====================
# goodix_cap.ko
include $(CLEAR_VARS)
LOCAL_MODULE := goodix_cap.ko
LOCAL_SRC_FILES := prebuilts/ruyi/lib/modules/goodix_cap.ko
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_RECOVERY)/vendor/lib/modules
LOCAL_STRIP_MODULE := false
include $(BUILD_PREBUILT)

# goodix_core.ko
include $(CLEAR_VARS)
LOCAL_MODULE := goodix_core.ko
LOCAL_SRC_FILES := prebuilts/ruyi/lib/modules/goodix_core.ko
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_RECOVERY)/vendor/lib/modules
LOCAL_STRIP_MODULE := false
include $(BUILD_PREBUILT)

# synaptics_tcm2.ko
include $(CLEAR_VARS)
LOCAL_MODULE := synaptics_tcm2.ko
LOCAL_SRC_FILES := prebuilts/ruyi/lib/modules/synaptics_tcm2.ko
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_RECOVERY)/vendor/lib/modules
LOCAL_STRIP_MODULE := false
include $(BUILD_PREBUILT)

# xiaomi_touch.ko
include $(CLEAR_VARS)
LOCAL_MODULE := xiaomi_touch.ko
LOCAL_SRC_FILES := prebuilts/ruyi/lib/modules/xiaomi_touch.ko
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := $(TARGET_OUT_RECOVERY)/vendor/lib/modules
LOCAL_STRIP_MODULE := false
include $(BUILD_PREBUILT)

# Include all kernel modules in the build
PRODUCT_PACKAGES += \
    goodix_cap.ko \
    goodix_core.ko \
    synaptics_tcm2.ko \
    xiaomi_touch.ko

# Release name
PRODUCT_RELEASE_NAME := ruyi

## Device identifier
PRODUCT_DEVICE := sm8650
PRODUCT_NAME := twrp_ruyi
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := sm8650
PRODUCT_MANUFACTURER := Xiaomi