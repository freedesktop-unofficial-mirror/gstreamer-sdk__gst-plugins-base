noinst_PROGRAMS = playback-test

LDADD = \
	$(top_builddir)/gst-libs/gst/interfaces/libgstinterfaces-@GST_MAJORMINOR@.la \
	$(GST_LIBS) $(GTK_LIBS) $(LIBM)

AM_CFLAGS = -I$(top_builddir)/gst-libs $(GST_PLUGINS_BASE_CFLAGS) $(GST_BASE_CFLAGS) $(GST_CFLAGS) $(GTK_CFLAGS)
