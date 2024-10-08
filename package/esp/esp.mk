################################################################################
#
# ESP8089
#
################################################################################


ESP_VERSION = 6afa97bc839ce1a67700c38b01f0f6f3168ec2a4
ESP_SITE = $(call github,al177,esp8089,$(ESP_VERSION))
ESP_INSTALL_STAGING = YES
ESP_INSTALL_TARGET = YES

define ESP_BUILD_CMDS
	$(MAKE) ARCH=arm CROSS_COMPILE='$(TARGET_CC)'- -C '$(LINUX_DIR)' LINUX_DIR='$(LINUX_DIR)' CC='$(TARGET_CC)' LD='$(TARGET_LD)' modules
endef

$(eval $(kernel-module))
$(eval $(generic-package))

