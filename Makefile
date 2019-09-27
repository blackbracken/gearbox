PREFIX := " [.gear]"

GEAR_ROOT := $$HOME/.gear
DOTFILES_DIR := $(GEAR_ROOT)/dotfiles

MINIMAL_DIR := $(GEAR_ROOT)/init/minimal
ENRICH_DIR := $(GEAR_ROOT)/init/enrich

minimal:
	@make update
	@for minimal in $$(ls $(MINIMAL_DIR)); do \
		sh "$(MINIMAL_DIR)/$$minimal"; \
	done
	@echo "$(PREFIX) All minimal packages have been installed."

enrich:
	@make minimal
	@for enrich in $$(ls $(ENRICH_DIR)); do \
		sh "$(ENRICH_DIR)/$$enrich"; \
	done
	@echo "$(PREFIX) All enrich packages have been installed."

update:
	@git pull origin master
	@if !(type "yay" > /dev/null 2>&1); then \
	    git clone https://aur.archlinux.org/yay.git; \
	    cd yay; \
	    makepkg -si; \
	    cd ../; \
	    rm -rf yay; \
	fi
	@yay -Syu --devel
	@for dotfile in $$(ls -A $(DOTFILES_DIR)); do \
		rm -rf $$HOME/$$dotfile; \
		ln -sf $(DOTFILES_DIR)/$$dotfile $$HOME; \
	done
	@echo "$(PREFIX) Now .gear and symbolics for dotfiles are up to date."

gear:
	@echo ""
	@cat ./res/gear_art
	@echo ""

help:
	@echo "$(PREFIX) Usage: make [minimal | enrich | update | gear | help]"
