LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_ARM_MODE := arm

ffmpegcolorspace_LOCAL_SRC_FILES:= \
	gst/ffmpegcolorspace/gstffmpegcolorspace.c \
	gst/ffmpegcolorspace/gstffmpegcodecmap.c \
	gst/ffmpegcolorspace/dsputil.c \
	gst/ffmpegcolorspace/imgconvert.c \
	gst/ffmpegcolorspace/mem.c \
	gst/ffmpegcolorspace/utils.c

LOCAL_SRC_FILES:= $(addprefix ../,$(ffmpegcolorspace_LOCAL_SRC_FILES))

LOCAL_SHARED_LIBRARIES := \
    libgstvideo-0.10        \
    libgstreamer-0.10       \
    libgstbase-0.10         \
    libglib-2.0             \
    libgthread-2.0          \
    libgmodule-2.0          \
    libgobject-2.0 			\
    libgstpbutils-0.10

LOCAL_MODULE:= libgstffmpegcolorspace

LOCAL_CFLAGS := -DHAVE_CONFIG_H -DGSTREAMER_BUILT_FOR_ANDROID \
	$(GST_PLUGINS_BASE_CFLAGS)
#
# define LOCAL_PRELINK_MODULE to false to not use pre-link map
#
LOCAL_PRELINK_MODULE := false

#It's a gstreamer plugins, and it must be installed on ..../lib/gstreamer-0.10
LOCAL_MODULE_PATH := $(TARGET_OUT)/lib/gstreamer-0.10
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
