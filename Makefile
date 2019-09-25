PREFIX := " [.gear]"
COMMON_PKG := ./init/common

initialize:
	@make update
	for common in $$(ls $(COMMON_PKG)); do \
		sh "$(COMMON_PKG)/$$common"; \
	done
	@echo "$(PREFIX) All common packages are installed."

update:
	@yes | sudo pacman --needed -S yay
	@yay -Syu --devel --timeupdate
	@git pull origin master
	@echo "$(PREFIX) Now .gear is up to date."

help:
	@echo "$(PREFIX) Usage: make [initialize | update | help]"
