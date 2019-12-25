gearbox_dir := $(HOME)/gearbox

TARGET := arch

initialize:
	$(eval init_path := "$(gearbox_dir)/init/$(TARGET)/init.sh")
	@if [[ ! -f $(init_path) ]]; then \
		echo "TARGET($(TARGET)) not found"; \
		exit 1; \
	fi
	@sh $(init_path)
	@make symbolic

symbolic:
	@for dotfile in $$(ls -A ./dotfiles); do \
		rm -f $(HOME)/$$dotfile; \
		ln -sf $(gearbox_dir)/dotfiles/$$dotfile $(HOME); \
		echo "Set symbolic: $$dotfile";\
	done
