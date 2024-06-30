################################################################################
#
# UBOOT_SPI
#
################################################################################


UBOOT_SPI_VERSION = 2ca90b728aabc14d27c9fde19f04661dfd79c896
UBOOT_SPI_SITE = $(call github,sumitmamoria,u-boot-v3s-spi-nor,$(UBOOT_SPI_VERSION))

define UBOOT_SPI_BUILD_CMDS
	$(MAKE)  ARCH=arm CROSS_COMPILE='$(TARGET_CROSS)' -C $(@D) all
endef

define UBOOT_SPI_INSTALL_TARGET_CMDS
	cp $(@D)/u-boot-sunxi-with-spl.bin $(BINARIES_DIR)/uboot_spi.bin
endef

$(eval $(generic-package))

