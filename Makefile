#--- Defaults
playbook ?= databases

ifeq ($(host),)
	host := domake.io
endif

ifneq ($(tags),)
	options := --tags '$(tags)'
endif

KEYS_PATH = $(shell find keys/$(host) -type f)

help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo "  encrypt       Encrypting unencrypted keys"
	@echo "  decrypt       Decrypting encrypted keys"
	@echo "  install       Install roles dependencies"
	@echo "  play          Executing playbooks"

.vaultpass:
	@echo 'Need a ".vaultpass" to decrypt the keys.'
	@exit 1

check.files: .vaultpass

encrypt:
	@ansible-vault encrypt\
		--vault-password-file=.vaultpass\
		$(KEYS_PATH)

decrypt:
	@ansible-vault decrypt\
		--vault-password-file=.vaultpass\
		$(KEYS_PATH)

install:
	@ansible-galaxy install -r requirements.yml

play: check.files
	@ansible-playbook -i $(host) $(playbook).yml $(options)\
		--verbose\
		--vault-password-file=.vaultpass

.PHONY: check.files encrypt decrypt install play
