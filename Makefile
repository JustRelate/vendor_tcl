PROJECT_ROOT := $(shell cd ../..; pwd)

ifndef INSTALL_DIR
$(error INSTALL_DIR undefined)
endif
ifndef TARGET_OSTYPE
$(error TARGET_OSTYPE undefined)
endif
ifndef VERSION
$(error VERSION undefined)
endif

include $(PROJECT_ROOT)/Makefiles/Makefile.config

.PHONY: install
install:
	@$(call syncp,$(TARGET_OSTYPE)/$(VERSION),$(INSTALL_DIR)/tcl)
