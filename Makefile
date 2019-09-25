PREFIX := " [.gear]"

GEAR_ROOT := $$HOME/.gear
COMMONS_DIR := $(GEAR_ROOT)/init/common
DOTFILES_DIR := $(GEAR_ROOT)/dotfiles

initialize:
	@make update
	@for common in $$(ls $(COMMONS_DIR)); do \
		sh "$(COMMONS_DIR)/$$common"; \
	done
	@echo "$(PREFIX) All common packages are installed."

update:
	@git pull origin master
	@yes | sudo pacman --needed -S yay
	@yay -Syu --devel --timeupdate
	@for dotfile in $$(ls -A $(DOTFILES_DIR)); do \
		rm -f $$HOME/$$dotfile; \
		ln -sf $(DOTFILES_DIR)/$$dotfile $$HOME; \
	done
	@echo "$(PREFIX) Now .gear and symbolics are up to date."

help:
	@echo "$(PREFIX) Usage: make [initialize | update | help]"
