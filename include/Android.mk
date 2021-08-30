LOCAL_PATH:= $(call my-dir)
include $(LOCAL_PATH)/../common.mk
include $(CLEAR_VARS)

LOCAL_EXPORT_C_INCLUDE_DIRS_TO         := $(common_header_export_path)
LOCAL_EXPORT_C_INCLUDE_DIRS            := color_metadata.h

include $(BUILD_LOCAL_EXPORT_C_INCLUDE_DIRS)

include $(CLEAR_VARS)
#TODO move all exported headers to this directory
LOCAL_MODULE := display_headers
LOCAL_EXPORT_C_INCLUDE_DIRS   := $(display_top)/libcopybit \
                                 $(display_top)/libqdutils \
                                 $(display_top)/libqservice \

ifeq ($(TARGET_USES_GRALLOC1), true)
    LOCAL_EXPORT_C_INCLUDE_DIRS += $(display_top)/libgralloc1
else
    LOCAL_EXPORT_C_INCLUDE_DIRS += $(display_top)/libgralloc
endif
include $(BUILD_HEADER_LIBRARY)
