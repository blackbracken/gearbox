gearbox_dir := $(HOME)/gearbox

TARGET := arch

initialize:
	$(eval init_path := "$(gearbox_dir)/init/$(TARGET)/init.sh")
	@mkdir -p $(HOME)/.config
	@if [[ ! -f $(init_path) ]]; then \
		echo "TARGET($(TARGET)) not found"; \
		exit 1; \
	fi
	@sh $(init_path)
	@make wallpaper
	@make executable
	@make symbolic

wallpaper:
	@for b64wallpaper in $$(find ./res/wallpaper/ -name "*.b64" -type f); do \
		base64 -d < $$b64wallpaper > "`dirname $$b64wallpaper`/`basename $$b64wallpaper .b64`.png"; \
	done

executable:
	@for binfile in $$(ls -A ./bin); do \
		chmod +x $(gearbox_dir)/bin/$$binfile; \
		echo "Give a permission to execute: $$binfile"; \
	done

symbolic:
	@for dotfile in $$(ls -A ./dotfiles); do \
		rm -f $(HOME)/$$dotfile; \
		ln -sf $(gearbox_dir)/dotfiles/$$dotfile $(HOME); \
		echo "Set symbolic: $$dotfile";\
	done
