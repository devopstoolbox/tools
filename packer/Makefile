# Makefile variables
export PACKER=packer
export VAGRANT=vagrant
export SPECS_DIR=specs
export LOG_DIR=../../../builds/log

# Used in builds
export BUILDS_DIR=../../../builds
export ISO_DIR=../../../iso

# Packer variables
export PACKER_LOG_PATH=$(LOG_DIR)/packer.log
export CHECKPOINT_DISABLE=1
export PACKER_LOG=1
export PACKER_CACHE_DIR=../../../builds/.packer_cache
export PACKER_KEY_INTERVAL=10ms

# What to build. Change to null to debug. Supports: virtualbox-iso,vmware-iso, qemu
export BUILDS_ONLY=qemu

.DEFAULT_GOAL :=centos-8-base

all:; @$(MAKE) _all -j8
_all: centos-8-base centos-8-base rhel-8-base fedora-31-base

#############################################################################
# make -j 10
#############################################################################

# [X] CentOS 8
centos-8-base:
	[[ -d $(LOG_DIR) ]] || mkdir -p $(LOG_DIR)
	$(PACKER) inspect $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(PACKER) build -only=$(BUILDS_ONLY) -on-error=ask -var-file=config.json -force $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log

# [X] CentOS 7
centos-7-base:
	[[ -d $(LOG_DIR) ]] || mkdir -p $(LOG_DIR)
	$(PACKER) inspect $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(PACKER) build -only=$(BUILDS_ONLY) -on-error=ask -var-file=config.json -force $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log

# [X] RHEL 8
rhel-8-base:
	[[ -d $(LOG_DIR) ]] || mkdir -p $(LOG_DIR)
	$(PACKER) inspect $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(PACKER) build -only=$(BUILDS_ONLY) -on-error=ask -var-file=config.json -force $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log

# [X] Fedora 31
fedora-31-workstation:
	[[ -d $(LOG_DIR) ]] || mkdir -p $(LOG_DIR)
	$(PACKER) inspect $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(PACKER) build -only=$(BUILDS_ONLY) -on-error=ask -var-file=config.json -force $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log

# [X] Fedora 31
fedora-31-server:
	[[ -d $(LOG_DIR) ]] || mkdir -p $(LOG_DIR)
	$(PACKER) inspect $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
	$(PACKER) build -only=$(BUILDS_ONLY) -on-error=ask -var-file=config.json -force $(SPECS_DIR)/$@.json | tee -a $(LOG_DIR)/$@.log
