prefix := " [gearbox]"

gearbox_dir = $$HOME/.gearbox
common_dir = $(gearbox_dir)/init/pkg/common
dotfiles_dir = $(gearbox_dir)/dotfiles

minimal:
	@sh $(gearbox_dir)/init/minimal.sh

update:
	@make minimal
	@git pull origin master
	@sudo pacman --needed -S base
	@yay -Syu --devel
	@for dotfile in $$(ls -A $(dotfiles_dir)); do \
		rm -rf $$HOME/$$dotfile; \
		ln -sf $(dotfiles_dir)/$$dotfile $$HOME; \
	done
	@rm -rf $$HOME/.config/openbox
	@ln -sf $(gearbox_dir)/config/openbox $$HOME/.config
	@echo "$(prefix) Now gearbox are up to date."

common:
	@make update
	@for common in $$(ls $(common_dir)); do \
		sh "$(common_dir)/$$common"; \
	done
	@echo "$(prefix) All common packages have been installed."

gear:
	@echo ""
	@cat ./res/gear_art
	@echo ""

help:
	@echo "$(prefix) Usage: make [common | update | help | gear | minimal]"
