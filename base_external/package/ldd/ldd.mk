
##############################################################
#
# LDD
#
##############################################################

# Define the usual meta-data to specify the version, archive name, remote URI where to find the package source, licensing information.
LDD_VERSION = e2de689b550bb2b96b92bd8d438164f240f35488
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-mukesh2006.git
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES

LDD_MODULE_SUBDIRS = misc-modules/
LDD_MODULE_SUBDIRS += scull/

#define LDD_BUILD_CMDS
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) ARCH=${KERNEL_ARCH} KERNELDIR=${LINUX_DIR} -C $(@D)/misc-modules modules
#	$(MAKE) $(TARGET_CONFIGURE_OPTS) ARCH=${KERNEL_ARCH} KERNELDIR=${LINUX_DIR} -C $(@D)/scull modules
#	mv $(@D)/misc-modules/*.ko $(TARGET_DIR)/usr/bin/
#	mv $(@D)/scull/*.ko $(TARGET_DIR)/usr/bin/
#endef

#$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules modules
#$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/scull modules


# Add the kernal modules in the proper location
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin/
endef


$(eval $(kernel-module))
$(eval $(generic-package))
