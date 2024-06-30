################################################################################
#
# gst1-rtsp-server-example
#
################################################################################

GST1_RTSP_SERVER_EXAMPLE_VERSION = master
GST1_RTSP_SERVER_EXAMPLE_SITE = $(call github,GStreamer,gst-rtsp-server,$(GST1_RTSP_SERVER_EXAMPLE_VERSION))

GST1_RTSP_SERVER_EXAMPLE_LICENSE = LGPL-2.1+
GST1_RTSP_SERVER_EXAMPLE_LICENSE_FILES = COPYING COPYING.LIB
GST1_RTSP_SERVER_EXAMPLE_CPE_ID_VENDOR = gstreamer_project
GST1_RTSP_SERVER_EXAMPLE_CPE_ID_PRODUCT = gst-rtsp-server
GST1_RTSP_SERVER_EXAMPLE_DEPENDENCIES = \
	host-pkgconf \
	gstreamer1 \
	gst1-plugins-base \
	gst1-plugins-good

GST1_RTSP_SERVER_EXAMPLE_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)

GST1_RTSP_SERVER_EXAMPLE_CONF_OPTS = \
	-Dexamples=enabled \
	-Dtests=disabled \
	-Ddoc=disabled

define GST1_RTSP_SERVER_EXAMPLE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/build/examples/test-launch $(TARGET_DIR)/usr/sbin/
endef

ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
GST1_RTSP_SERVER_EXAMPLE_CONF_OPTS += -Dintrospection=enabled
GST1_RTSP_SERVER_EXAMPLE_DEPENDENCIES += gobject-introspection
else
GST1_RTSP_SERVER_EXAMPLE_CONF_OPTS += -Dintrospection=disabled
endif

ifeq ($(BR2_PACKAGE_LIBCGROUP),y)
GST1_RTSP_SERVER_EXAMPLE_DEPENDENCIES += libcgroup
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD),y)
GST1_RTSP_SERVER_EXAMPLE_DEPENDENCIES += gst1-plugins-bad
endif

$(eval $(meson-package))
