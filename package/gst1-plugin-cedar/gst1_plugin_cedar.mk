################################################################################
#
# gst1-plugin-cedar
#
################################################################################

GST1_PLUGIN_CEDAR_VERSION = master
GST1_PLUGIN_CEDAR_SITE = $(call github,peteallenm,gst-plugin-cedar-cs,$(GST1_PLUGIN_CEDAR_VERSION))
GST1_PLUGIN_CEDAR_CPE_ID_PRODUCT = gst-plugin-cedar-ce
GST1_PLUGIN_CEDAR_INSTALL_STAGING = YES
GST1_PLUGIN_CEDAR_DEPENDENCIES = \
	host-pkgconf \
	gstreamer1 \
	gst1-plugins-base \
	gst1-plugins-good \
	libcedarc libv4l

GST1_PLUGIN_CEDAR_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)

ifeq ($(BR2_PACKAGE_LIBCGROUP),y)
GST1_PLUGIN_CEDAR_DEPENDENCIES += libcgroup
endif

ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD),y)
GST1_PLUGIN_CEDAR_DEPENDENCIES += gst1-plugins-bad
endif

GST1_PLUGIN_CEDAR_AUTORECONF = YES

$(eval $(autotools-package))
