HOME_SRC_DIR := ~/.config
HOME_DEST_DIR := home/locmai/.config

DIRS := waybar hypr gtk-3.0 gtk-4.0 rofi nvim 

sync-local:
	cp -rf home/locmai/.config/* ~/.config

sync-remote:
	@for dir in $(DIRS); do \
        	echo "Copying $$dir from $(HOME_SRC_DIR) to $(HOME_DEST_DIR)"; \
        	cp -r $(HOME_SRC_DIR)/$$dir $(HOME_DEST_DIR); \
    	done
	
	@echo "Copying /etc/nixos"
	@cp -r /etc/nixos/* nixos/
