plugin_LTLIBRARIES = libgstogg.la

libgstogg_la_SOURCES = \
	gstogg.c \
	gstoggdemux.c \
	gstoggmux.c \
	gstogmparse.c \
	gstoggaviparse.c \
	gstoggparse.c \
	gstoggstream.c \
	dirac_parse.c \
	vorbis_parse.c

noinst_HEADERS = \
	gstogg.h \
	gstoggdemux.h \
	gstoggmux.h \
	gstoggstream.h \
	dirac_parse.h \
	vorbis_parse.h

libgstogg_la_CFLAGS = $(GST_PLUGINS_BASE_CFLAGS) $(GST_BASE_CFLAGS) $(GST_CFLAGS) $(OGG_CFLAGS) \
	-Dschro_video_format_set_std_video_format=ogg_schro_video_format_set_std_video_format \
	-Dschro_video_format_set_std_frame_rate=ogg_schro_video_format_set_std_frame_rate \
	-Dschro_video_format_set_std_aspect_ratio=ogg_schro_video_format_set_std_aspect_ratio \
	-Dschro_video_format_set_std_signal_range=ogg_schro_video_format_set_std_signal_range \
	-Dschro_video_format_set_std_colour_spec=ogg_schro_video_format_set_std_colour_spec

libgstogg_la_LIBADD = \
	$(top_builddir)/gst-libs/gst/riff/libgstriff-$(GST_MAJORMINOR).la \
	$(top_builddir)/gst-libs/gst/tag/libgsttag-$(GST_MAJORMINOR).la \
	$(GST_BASE_LIBS) \
	$(GST_LIBS) \
	$(OGG_LIBS)
libgstogg_la_LDFLAGS = $(GST_PLUGIN_LDFLAGS)
if !GST_PLUGIN_BUILD_STATIC
libgstogg_la_LIBTOOLFLAGS = --tag=disable-static
endif

Android.mk: Makefile.am $(BUILT_SOURCES)
	androgenizer \
	-:PROJECT libgstogg -:SHARED libgstogg \
	 -:TAGS eng debug \
         -:REL_TOP $(top_srcdir) -:ABS_TOP $(abs_top_srcdir) \
	 -:SOURCES $(libgstogg_la_SOURCES) \
	 -:CFLAGS $(DEFS) $(DEFAULT_INCLUDES) $(libgstogg_la_CFLAGS) \
	 -:LDFLAGS $(libgstogg_la_LDFLAGS) \
	           $(libgstogg_la_LIBADD) \
	           -ldl \
	 -:PASSTHROUGH LOCAL_ARM_MODE:=arm \
		       LOCAL_MODULE_PATH:='$$(TARGET_OUT)/lib/gstreamer-0.10' \
	> $@
